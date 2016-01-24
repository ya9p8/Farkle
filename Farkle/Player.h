//
//  Player.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Turn.h"

@interface Player : NSObject
@property NSString* name;
@property int score;
@property Turn* currentTurn;

- (instancetype)initWithName:(NSString* )name;

@end
