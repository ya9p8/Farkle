//
//  DiceImageView.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "DiceImageView.h"


@interface DiceImageView ()<UIGestureRecognizerDelegate>

@end

@implementation DiceImageView

-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self)
    {
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onDiceImageViewTapped)];
        
        self.userInteractionEnabled = YES;
        
        self.gestureRecognizers = @[tapGesture];
        
        for (UIGestureRecognizer* gesture in self.gestureRecognizers) {
            gesture.delegate = self;
        }
        
    }
    
    return self;
}

-(void)onDiceImageViewTapped
{
    [self.delegate diceImageViewWasTapped:self];
}

-(void)roll
{
    
    int randomNumber = arc4random()%6+1;
    self.image =[UIImage imageNamed:[NSString stringWithFormat:@"%i", randomNumber]];
    self.imageName = [NSString stringWithFormat:@"%i", randomNumber];
}



@end
