//
//  CCViewController.m
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import "CCViewController.h"
#import "CCTile.h"
#import "CCWeapon.h"
#import "CCArmor.h"
#import "CCCharacter.h"

@interface CCViewController ()

@end

@implementation CCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // Initialize the character
    self.factory = [[CCFactory alloc] init];
    self.player = [self.factory character];
    
    [self updateView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// UI View Methods
- (IBAction)restartButton:(UIButton *)sender
{
    self.point = CGPointMake(0, 0); // Set the location (0, 0) as the start point
    
    // Reset the character and boss by resetting the factory
    [self.factory reset];
    
    // Update the view
    [self updateView];
}

- (IBAction)westButton:(UIButton *)sender
{
    [self move:'W'];
}

- (IBAction)northButton:(UIButton *)sender
{
    [self move:'N'];
}

- (IBAction)eastButton:(UIButton *)sender
{
    [self move:'E'];
}

- (IBAction)southButton:(UIButton *)sender
{
    [self move:'S'];
}

- (IBAction)actionButton:(UIButton *)sender
{
    int healthVariation = 0;
    
    // Get the current tile
    CCTile * tile = [self.factory xTile:self.point.x yTile:self.point.y];
    
    if (self.player.health > 0 && (tile.boss == nil || (tile.boss != nil && tile.boss.health > 0)))
    {
    
        if (tile.weapon != nil) {
            self.player.weapon = tile.weapon;
            self.weaponName.text = self.player.weapon.name;
        
            // Weapon modifies the damage value
            self.damageNumber.text = [NSString stringWithFormat:@"%i", self.player.weapon.damage];
        }
    
        if (tile.armor != nil) {
            // Armor modifies health
            healthVariation += - self.player.armor.health + tile.armor.health;
        
            self.player.armor = tile.armor;
            self.armorName.text = self.player.armor.name;
        }
    
        if (tile.healthEffect != 0) {
            healthVariation += tile.healthEffect;
        }
    
        // Check if any health variation has happened
        if (healthVariation != 0) {
            self.player.health += healthVariation;
            self.healthNumber.text = [NSString stringWithFormat:@"%i", self.player.health];
        }
        
        if (tile.boss != nil) {
            tile.boss.health -= self.player.weapon.damage;
        }
    }

    // Check if we've died
    if (self.player.health <= 0)
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died reset the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [myAlertView show];
    }
    else if (tile.boss != nil && tile.boss.health <= 0)
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"You won" message:@"You won the boss please reset" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [myAlertView show];
    }
}

- (void)move:(char)where
{
    // Get the current tile
    CCTile * tile = [self.factory xTile:self.point.x yTile:self.point.y];
    
    if (self.player.health > 0 && (tile.boss == nil || (tile.boss != nil && tile.boss.health > 0)))
    {
        // Check if we've died
        if (self.player.health < 0) {
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died reset the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [myAlertView show];
        }
        
        switch (where) {
            case 'N':
            case 'n':
                self.point = CGPointMake(self.point.x, self.point.y + 1);
                break;
                
            case 'S':
            case 's':
                self.point = CGPointMake(self.point.x, self.point.y - 1);
                break;
                
            case 'E':
            case 'e':
                self.point = CGPointMake(self.point.x + 1, self.point.y);
                break;
                
            case 'W':
            case 'w':
                self.point = CGPointMake(self.point.x - 1, self.point.y);
                break;
                
                // Update current position's values
            default:
                break;
        }
        
        // Update the view
        [self updateView];
    }
    
    // Check if we've died
    else if (self.player.health <= 0)
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Death" message:@"You have died reset the game!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [myAlertView show];
    }
    
    else if (tile.boss != nil && tile.boss.health <= 0)
    {
        UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"You won" message:@"You won the boss please reset" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [myAlertView show];
    }
}

- (void)updateButtonsStatus
{
    // Hide left or right button
    if (self.point.x == 0)
    {
        // No left button
        self.westButton.hidden = YES;
        self.eastButton.hidden = NO;
    }
    else if (self.point.x + 1 == [[self.factory tiles] count])
    {
        // No right button
        self.eastButton.hidden = YES;
        self.westButton.hidden = NO;
    }
    else
    {
        // Show left and right button
        self.westButton.hidden = NO;
        self.eastButton.hidden = NO;
    }
    
    // Hide top or bottom button
    if (self.point.y + 1 == [[self.factory xTile:self.point.x] count])
    {
        // No top button
        self.northButton.hidden = YES;
        self.southButton.hidden = NO;
    }
    else if (self.point.y == 0)
    {
        // No bottom button
        self.southButton.hidden = YES;
        self.northButton.hidden = NO;
    }
    else
    {
        // Show top and bottom button
        self.southButton.hidden = NO;
        self.northButton.hidden = NO;
    }
}

- (void)updateView
{
    // Update the buttons' status
    [self updateButtonsStatus];
    
    // Get the current tile
    CCTile * tile = [self.factory xTile:self.point.x yTile:self.point.y];
    
    // Assign values to UI elements
    self.backgroundImage.image = tile.backgroundImage;
    [self.actionButton setTitle:tile.actionButtonName forState:UIControlStateNormal];
    self.storyLabel.text = tile.story;
    
    // Player values
    self.weaponName.text = self.player.weapon.name;
    self.armorName.text = self.player.armor.name;
    self.damageNumber.text = [NSString stringWithFormat:@"%i", self.player.weapon.damage];
    
    // Assign player values to get health
    self.healthNumber.text = [NSString stringWithFormat:@"%i", self.player.health];
}

@end
