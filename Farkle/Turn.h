//
//  Turn.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Round.h"

@interface Turn : NSObject

@property Round* currentRound;
@property NSMutableArray<DieLabel* >* currentRoundDice;


@end
