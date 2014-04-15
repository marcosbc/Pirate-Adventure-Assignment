//
//  CCTile.m
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import "CCTile.h"
#import "CCBoss.h"

@implementation CCTile

- (void)setValues:(NSString *)story background:(UIImage *)backgroundImage action:(NSString *)actionButtonName weapon:(CCWeapon *)weapon armor:(CCArmor *)armor effect:(int)healthEffect boss:(CCBoss *)boss
{
    self.story = story;
    self.backgroundImage = backgroundImage;
    self.actionButtonName = actionButtonName;
    self.weapon = weapon;
    self.armor = armor;
    self.healthEffect = healthEffect;
    self.boss = boss;
}

@end
