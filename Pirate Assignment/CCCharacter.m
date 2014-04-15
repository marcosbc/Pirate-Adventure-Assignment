//
//  CCCharacter.m
//  Pirate Assignment
//
//  Created by Marcos on 14/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import "CCCharacter.h"

@implementation CCCharacter

- (CCCharacter *)init
{
    self = [super init];
    
    if (self)
    {
        // Initialize self
        [self reset];
    }
    
    return self;
}

- (void)reset
{
    self.health = 100;
    self.damage = 0;
    self.weapon = 0;
    self.armor = nil;
}

@end
