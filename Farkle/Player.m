//
//  Player.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}



@end
