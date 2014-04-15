//
//  CCViewController.h
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCharacter.h"
#import "CCFactory.h"

@interface CCViewController : UIViewController

// Own properties
@property (nonatomic) CGPoint point;
@property (strong, nonatomic) NSArray * map;
@property (strong, nonatomic) CCCharacter * player;
@property (strong, nonatomic) CCFactory * factory;

// UI properties
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *healthNumber;
@property (weak, nonatomic) IBOutlet UILabel *damageNumber;
@property (weak, nonatomic) IBOutlet UILabel *weaponName;
@property (weak, nonatomic) IBOutlet UILabel *armorName;
@property (weak, nonatomic) IBOutlet UIButton *actionButton; // e.g. for when game has ended
@property (weak, nonatomic) IBOutlet UILabel *storyLabel;
@property (weak, nonatomic) IBOutlet UIButton *northButton;
@property (weak, nonatomic) IBOutlet UIButton *westButton;
@property (weak, nonatomic) IBOutlet UIButton *eastButton;
@property (weak, nonatomic) IBOutlet UIButton *southButton;

// Own actions/methods
- (void)move:(char)where;

// UI actions
- (IBAction)restartButton:(UIButton *)sender;
- (IBAction)westButton:(UIButton *)sender;
- (IBAction)northButton:(UIButton *)sender;
- (IBAction)eastButton:(UIButton *)sender;
- (IBAction)southButton:(UIButton *)sender;
- (IBAction)actionButton:(UIButton *)sender;

@end
