//
//  CCBoss.h
//  Pirate Assignment
//
//  Created by Marcos on 15/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCBoss : NSObject

@property (nonatomic) int health;

- (CCBoss *)init;
- (void)reset;

@end
