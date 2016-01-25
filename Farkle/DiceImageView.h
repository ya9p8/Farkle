//
//  DiceImageView.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DiceImageViewDelegate <NSObject>

-(void)diceImageViewWasTapped:(id)die;

@end

@interface DiceImageView : UIImageView
-(void)onDiceImageViewTapped;
-(void)roll;

@property (nonatomic, assign)id <DiceImageViewDelegate> delegate;
@property NSString* imageName;

@end
