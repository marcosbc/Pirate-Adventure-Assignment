//
//  CCFactory.m
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import "CCFactory.h"
#import "CCTile.h"
#import "CCWeapon.h"
#import "CCArmor.h"

@implementation CCFactory

// Initialize the factory
- (CCFactory *) init
{
    self = [super init];
    
    if (self)
    {
        // Initialize self
        [self reset];
    }
    
    return self;
}

// Weapons
- (NSArray *) weapons
{
    if (self.weaponsArray == nil)
    {
        // Blunted sword (tile 0)
        CCWeapon * fists = [[CCWeapon alloc] init];
        fists.name = @"Fists";
        fists.damage = 10;
        
        // Blunted sword (tile 1)
        CCWeapon * bluntedSword = [[CCWeapon alloc] init];
        bluntedSword.name = @"Blunted sword";
        bluntedSword.damage = 12;
        
        // Pistol (tile 2)
        CCWeapon * pistol = [[CCWeapon alloc] init];
        pistol.name = @"Pistol";
        pistol.damage = 20;
        
        self.weaponsArray = [[NSArray alloc] initWithObjects:fists, bluntedSword, pistol, nil];
    }
    
    return self.weaponsArray;
}

// Armors
- (NSArray *) armors
{
    if (self.armorsArray == nil)
    {
        // Cloak (armor 0)
        CCArmor * cloak = [[CCArmor alloc] init];
        cloak.name = @"Cloak";
        cloak.health = 5;
        
        // Steel armor (tile 2)
        CCArmor * steelArmor = [[CCArmor alloc] init];
        steelArmor.name = @"Steel armor";
        steelArmor.health = 8;
        
        // Parrot armor (tile 4)
        CCArmor * parrotArmor = [[CCArmor alloc] init];
        parrotArmor.name = @"Parrot";
        parrotArmor.health = 20;
        
        self.armorsArray = [[NSArray alloc] initWithObjects:cloak, steelArmor, parrotArmor, nil];
    }
    
    return self.armorsArray;
}

// Tiles
- (NSArray *)tiles
{
    if (self.tilesArray == nil) {
        // Tile 1: Start position
        CCTile * tile1 = [[CCTile alloc] init];
        [tile1 setValues:@"Captain, we need a fearless leader such as yourself to undertake a voyage. You just stop the evil Pirate Boss. Would you like a blunted sword to get started?" background:[UIImage imageNamed:@"PirateStart.jpg"] action:@"Take the sword" weapon:[[self weapons] objectAtIndex:1] armor:nil effect:0 boss:nil];
        
        // Tile 2:
        CCTile * tile2 = [[CCTile alloc] init];
        [tile2 setValues:@"You have come across an armory. Would you like to upgrade your armor to steel armor?" background:[UIImage imageNamed:@"PirateBlacksmith.jpeg"] action:@"Take armor" weapon:nil armor:[[self armors] objectAtIndex:1] effect:0 boss:nil];
        
        // Tile 3:
        CCTile * tile3 = [[CCTile alloc] init];
        [tile3 setValues:@"A mysterious dock appears on the horizon. Should we stop and ask for directions?" background:[UIImage imageNamed:@"PirateFriendlyDock.jpg"] action:@"Stop at the dock" weapon:nil armor:nil effect:12 boss:nil];
    
        // Tile 1:
        CCTile * tile4 = [[CCTile alloc] init];
        [tile4 setValues:@"You have found a parrot. This can be used in your armor slot. Parrots are a great defender and are fiercly loyal to their captain!" background:[UIImage imageNamed:@"PirateParrot.jpg"] action:@"Adopt Parrot" weapon:nil armor:[[self armors] objectAtIndex:2] effect:0 boss:nil];
    
        // Tile 1:
        CCTile * tile5 = [[CCTile alloc] init];
        [tile5 setValues:@"You have stumbled upon a cache of pirate weapons. Would you like to upgrade to a pistol?" background:[UIImage imageNamed:@"PirateWeapons.jpeg"] action:@"Use pistol" weapon:[[self weapons] objectAtIndex:2] armor:nil effect:0 boss:nil];
    
        // Tile 1:
        CCTile * tile6 = [[CCTile alloc] init];
        [tile6 setValues:@"You have been captured by pirates and are ordered to walk the plank" background:[UIImage imageNamed:@"PiratePlank.jpg"] action:@"Show no fear" weapon:nil armor:nil effect:-22 boss:nil];
    
        // Tile 1:You have sighted a pirate battle off the coast. Should we intervene?
        CCTile * tile7 = [[CCTile alloc] init];
        [tile7 setValues:@"You have sighted a pirate battle off the coast. Should we intervene?" background:[UIImage imageNamed:@"PirateShipBattle.jpeg"] action:@"Fight those scum" weapon:nil armor:nil effect:8 boss:nil];
    
        // Tile 1:
        CCTile * tile8 = [[CCTile alloc] init];
        [tile8 setValues:@"The legend of the deep. The mighty kraken appears" background:[UIImage imageNamed:@"PirateOctopusAttack.jpg"] action:@"Abandon ship" weapon:nil armor:nil effect:-46 boss:nil];
    
        // Tile 9:
        CCTile * tile9 = [[CCTile alloc] init];
        [tile9 setValues:@"You have stumbled upon a hidden cave of pirate treasurer" background:[UIImage imageNamed:@"PirateTreasure.jpeg"] action:@"Take treasurer" weapon:nil armor:nil effect:20 boss:nil];
        
        // Tile 10:
        CCTile * tile10 = [[CCTile alloc] init];
        [tile10 setValues:@"A group of pirates attempts to board your ship." background:[UIImage imageNamed:@"PirateAttack.jpg"] action:@"Repel the invaders" weapon:nil armor:nil effect:-15 boss:nil];
        
        // Tile 10:
        CCTile * tile11 = [[CCTile alloc] init];
        [tile11 setValues:@"In the deep of the sea many things live and many things can be found. Will the fortune bring help or ruin?" background:[UIImage imageNamed:@"PirateTreasurer2.jpeg"] action:@"Swim deaper" weapon:nil armor:nil effect:-7 boss:nil];
        
        // Tile 12 (boss):
        CCTile * tile12 = [[CCTile alloc] init];
        [tile12 setValues:@"Your final faceoff with the fearsome pirate boss!" background:[UIImage imageNamed:@"PirateBoss.jpeg"] action:@"Fight" weapon:nil armor:nil effect:-15 boss:[self boss]];
    
        // Group into columns
        NSArray * column1Array = [[NSArray alloc] initWithObjects:tile3, tile2, tile1, nil];
        NSArray * column2Array = [[NSArray alloc] initWithObjects:tile6, tile5, tile4, nil];
        NSArray * column3Array = [[NSArray alloc] initWithObjects:tile9, tile8, tile7, nil];
        NSArray * column4Array = [[NSArray alloc] initWithObjects:tile12, tile11, tile10, nil];
    
        /*
            Group into the map in the following way:
         
                /-------------------------------------------\
                | tile 3 | tile 6 | tile 9 | tile 12 (boss) |
                |-------------------------------------------|
                | tile 2 | tile 5 | tile 8 | tile 11        |
                |-------------------------------------------|
                | tile 1 | tile 4 | tile 7 | tile 10        |
                \-------------------------------------------/
         */
        self.tilesArray = [[NSArray alloc] initWithObjects:column1Array, column2Array, column3Array, column4Array, nil];
    }
    
    return self.tilesArray;
}

- (CCCharacter *)character
{
    if (self.characterObject == nil) {
        self.characterObject = [[CCCharacter alloc] init];
        
        // Set the character's default values
        [self.characterObject reset];
    }
    
    return self.characterObject;
}

- (CCBoss *)boss
{
    if (self.bossObject == nil) {
        self.bossObject = [[CCBoss alloc] init];
        
        // Set the boss' default values
        [self.bossObject reset];
    }
    
    return self.bossObject;
}

- (void)reset
{
    CCCharacter * character = [self character];
    CCBoss * boss = [self boss];
    
    // Reset functions
    [character reset];
    [boss reset];
    
    // Now, set default armor and weapon for player
    character.weapon = [[self weapons] objectAtIndex:0];
    character.armor = [[self armors] objectAtIndex:0];
    character.health = 100 + character.armor.health; // start with 100 + armor health
}

- (NSArray *)xTile:(CGFloat)x
{
    return [[self tiles] objectAtIndex:(int)x];
}

- (CCTile *)xTile:(CGFloat)x yTile:(CGFloat)y
{
    return [[self xTile:x] objectAtIndex:(int)2 - y];
}

@end
