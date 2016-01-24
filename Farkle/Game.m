//
//  Game.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "Game.h"


@implementation Game

- (instancetype)initWithNumberOfPlayers:(int) numOfPlayers
{
    self = [super init];
    if (self)
    {
        NSLog(@"Creating a new game with %i player(s)", numOfPlayers);
        self.numberOfPlayers = numOfPlayers;
        [self.delegate gameWasCreated:self];
    }
    return self;
}

@end
