//
//  CCCharacter.h
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWeapon.h"
#import "CCArmor.h"

@interface CCCharacter : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (strong, nonatomic) CCWeapon * weapon;
@property (strong, nonatomic) CCArmor * armor;

- (CCCharacter *)init;
- (void)reset;

@end
