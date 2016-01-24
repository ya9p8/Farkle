//
//  Game.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@protocol GameDelegate <NSObject>

-(void)gameWasCreated:(id)game;

@end

@interface Game : NSObject
@property NSMutableArray<Player*>* players;
@property int numberOfPlayers;
@property (nonatomic, assign)id <GameDelegate> delegate;

- (instancetype)initWithNumberOfPlayers:(int) numOfPlayers;



@end


