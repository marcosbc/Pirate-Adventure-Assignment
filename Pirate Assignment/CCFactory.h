//
//  CCFactory.h
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCTile.h"
#import "CCCharacter.h"
#import "CCBoss.h"

@interface CCFactory : NSObject

@property (strong, nonatomic) NSArray * tilesArray;
@property (strong, nonatomic) NSArray * weaponsArray;
@property (strong, nonatomic) NSArray * armorsArray;
@property (strong, nonatomic) CCCharacter * characterObject;
@property (strong, nonatomic) CCBoss * bossObject;

// Self implemented methods
- (NSArray *)tiles;
- (NSArray *)weapons;
- (NSArray *)armors;
- (CCCharacter *)character;
- (CCBoss *)boss;
- (NSArray *)xTile:(CGFloat)x;
- (CCTile *)xTile:(CGFloat)x yTile:(CGFloat)y;
- (void)reset;

@end
