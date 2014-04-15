//
//  CCBoss.m
//  Pirate Assignment
//
//  Created by Marcos on 15/04/14.
//  Copyright (c) 2014 Marcos. All rights reserved.
//

#import "CCBoss.h"

@implementation CCBoss

- (CCBoss *)init
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
}

@end
