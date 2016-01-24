//
//  DieLabel.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/22/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "DieLabel.h"

@interface DieLabel () <UIGestureRecognizerDelegate>

@end

@implementation DieLabel

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if(self)
    {
        UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onDieLabelTapped)];
        
        self.userInteractionEnabled = YES;
        
        self.gestureRecognizers = @[tapGesture];
        
        for (UIGestureRecognizer* gesture in self.gestureRecognizers) {
            gesture.delegate = self;
        }
       
    }
    
    return self;
}

-(void)onDieLabelTapped
{
    self.backgroundColor = [UIColor blackColor];
    //self.textColor = [UIColor whiteColor];
    [self.delegate dieLabelWasTapped:self];
}

-(void)roll
{

    self.text = [NSString stringWithFormat:@"%i", arc4random()%6+1];
}


@end
