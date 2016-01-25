//
//  Player.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
@property NSString* name;
@property int score;

- (instancetype)initWithName:(NSString* )name;

@end
