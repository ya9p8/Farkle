//
//  DieLabel.h
//  Farkle
//
//  Created by Yemi Ajibola on 1/22/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DieLabelDelegate <NSObject>

-(void)dieLabelWasTapped:(id)die;

@end

@interface DieLabel : UILabel

-(void)onDieLabelTapped;
-(void)roll;
@property (nonatomic, assign)id <DieLabelDelegate> delegate;

@end
