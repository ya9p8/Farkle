//
//  Round.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "Round.h"

@implementation Round

-(BOOL)checkForFarkle
{
    
    return NO;
}

-(int)scoreRound:(NSMutableArray *)diceArray
{
    // Variables for this method are declared here
    bool fourOfAKind = NO;
    int singleCounter = 0;
    int pairCounter = 0;
    int tripleCounter = 0;
    
    [self countMultiples:diceArray];
    
    for (int i=0; i<self.multiplesArray.count; i++)
    {
        
        int multipleOfI = self.multiplesArray[i].intValue;
        NSLog(@"Checking for multiples of: %i", i+1);
        switch(multipleOfI)
        {
                // One of...
            case 1:
                if(i == 0) // if the dice was one
                {
                    singleCounter++;
                    self.score = self.score + 100; // One 1 in the array
                    NSLog(@"You have a 1. Your round score is: %i. Your single counter is %i",self.score, singleCounter);
                    break;
                }
                else if(i == 4) // if the dice was five
                {
                    singleCounter++;
                    self.score = self.score +50; // One 5 in the array
                    NSLog(@"You have a 5. Your round score is: %i. Your single counter is: %i",self.score, singleCounter);
                    break;
                }
                else
                {
                    singleCounter++;
                    NSLog(@"You have a one of %i, but it doesn't count for anything, but your single counter is %i", i+1, singleCounter);
                    break;
                }
                
                // Two of ...
            case 2:
                if(i  == 0) // One
                {
                    self.score = self.score + 200; // Two 1's in the array
                    NSLog(@"You have two ones so you get 200 points. Your round score is: %i",self.score);
                    pairCounter++;
                    NSLog(@"You have pair of: %i. Your pair counter is: %i", i+1, pairCounter);
                    break;
                }
                else if(i == 4) // Five
                {
                    self.score = self.score +100; // Two 5's in the array
                    NSLog(@"You have two fives so you get 100 points. Your round score is: %i",self.score);
                    pairCounter++;
                    NSLog(@"You have pair of: %i. Your pair counter is: %i", i+1, pairCounter);
                    break;
                }
                else
                {
                    pairCounter++;
                    NSLog(@"You have pair of: %i's. Your pair counter is: %i", i+1, pairCounter);
                    
                }
                break;
                // Three of....
            case 3:
                // Check what kind of triple it is and if there are others.
                switch (i+1)
            {
                case 1:
                    self.score = self.score + 1000;
                    //NSLog(@"You have a triple of %i's. Your round score is: %i", i+1, self.roundScore);
                    break;
                case 2:
                    self.score = self.score + 200;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 3:
                    self.score = self.score + 300;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 4:
                    self.score = self.score + 400;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 5:
                    self.score = self.score+ 500;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 6:
                    self.score = self.score + 600;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                default:
                    break;
            }
                tripleCounter++;
                NSLog(@"You have a triple of: %i. Your triple counter is: %i. Your round score is: %i",i+1, tripleCounter, self.score);
                break;
                // Four of....
            case 4:
                // Check for a pair as well
                self.score = self.score + 1000;
                NSLog(@"You have 4 of a kind. Your round score is: %i",self.score);
                fourOfAKind = YES;
                break;
                // Five of....
            case 5:
                self.score = self.score + 2000;
                NSLog(@"You have 5 of a kind. Your round score is: %i",self.score);
                break;
                // Six of ...
            case 6:
                self.score = self.score + 3000;
                NSLog(@"You have 6 of a kind. Your round score is: %i",self.score);
                break;
            default:
                NSLog(@"You have no %i's at all", i+1);
                break;
        }
        
    }
    
    //Special cases!!!!
    if (tripleCounter == 2) // Two triples case
    {
        self.score = 2500;
        NSLog(@"You have 2 triples! Your score for this round is: %i", self.score);
    }
    
    if (pairCounter == 3) // Three pairs case
    {
        self.score = 1500;
        NSLog(@"You have 3 pairs! Your score for this round is: %i", self.score);
    }
    
    if(pairCounter == 1 && fourOfAKind == YES) // Four of a kind and a pair
    {
        self.score = 1500;
        NSLog(@"You have 4 of a kind and a pair! Your score for this round is: %i", self.score);
    }
    if(singleCounter == 6) // Straight
    {
        self.score = 1500;
        NSLog(@"You have a straight! Your score for this round is: %i", self.score);
    }
    
    //self.scoreLabel.text = [NSString stringWithFormat:@"Round score: %i", self.score];
    return self.score;
}

-(BOOL)checkForFarkle:(NSMutableArray*)arrayOfDice
{
    // You have farkled
    if(![self scoreRound:arrayOfDice])
        return YES;
    else
        return NO;
}

// Count multiple for each dice
// Pass in yourDice array
// increments count of every number
-(void) countMultiples:(NSMutableArray<DieLabel*>*)yourDice
{
    for (int i=0; i < yourDice.count; i++)
    {
        if([yourDice objectAtIndex:i].text.intValue == 1) // hey future yemi don't forget to add text when you replace these.
        {
            self.multiplesArray[0] = @(self.multiplesArray[0].intValue+1);
            //NSLog(@"Number of ones in your array: %@",[self.multiplesArray objectAtIndex:0]);
        }
        else if([yourDice objectAtIndex:i].text.intValue == 2)
        {
            self.multiplesArray[1] = @(self.multiplesArray[1].intValue+1);
            //NSLog(@"Number of twos in your array: %@",[self.multiplesArray objectAtIndex:1]);
        }
        else if([yourDice objectAtIndex:i].text.intValue == 3)
        {
            self.multiplesArray[2] = @(self.multiplesArray[2].intValue+1);
            //NSLog(@"Number of threes in your array: %@",[self.multiplesArray objectAtIndex:2]);
        }
        else if([yourDice objectAtIndex:i].text.intValue == 4)
        {
            self.multiplesArray[3] = @(self.multiplesArray[3].intValue+1);
            //NSLog(@"Number of fours in your array: %@",[self.multiplesArray objectAtIndex:3]);
        }
        else if([yourDice objectAtIndex:i].text.intValue == 5)
        {
            self.multiplesArray[4] = @(self.multiplesArray[4].intValue+1);
            //NSLog(@"Number of fives in your array: %@",[self.multiplesArray objectAtIndex:4]);
        }
        else if([yourDice objectAtIndex:i].text.intValue == 6)
        {
            self.multiplesArray[5] = @(self.multiplesArray[5].intValue+1);
            //NSLog(@"Number of sixs in your array: %@",[self.multiplesArray objectAtIndex:5]);
        }
    }
    NSLog(@"%@@", self.multiplesArray);
    
}




@end
