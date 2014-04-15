//
//  CCTile.h
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCarmor.h"
#import "CCBoss.h"

@interface CCTile : NSObject

@property (strong, nonatomic) NSString * story;
@property (strong, nonatomic) UIImage * backgroundImage;
@property (strong, nonatomic) NSString * actionButtonName;
@property (strong, nonatomic) CCWeapon * weapon;
@property (strong, nonatomic) CCArmor * armor;
@property (strong, nonatomic) CCBoss * boss;
@property (nonatomic) int healthEffect;

- (void)setValues:(NSString *)story background:(UIImage *)backgroundImage action:(NSString *)actionButtonName weapon:(CCWeapon *)weapon armor:(CCArmor *)armor effect:(int)healthEffect boss:(CCBoss *)boss;

@end
