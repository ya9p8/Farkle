//
//  ViewController.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/22/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"
#import "DiceImageView.h"
#import "Player.h"

@interface GameViewController () <DiceImageViewDelegate>
@property NSMutableArray* boardDice;
@property NSMutableArray<DiceImageView *>* yourDice;
@property NSMutableArray<NSNumber*>* testArray;
@property (weak, nonatomic) IBOutlet UILabel *roundScoreLabel;
@property int roundScore;
@property NSMutableArray<NSNumber*>* multiplesArray;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageOne;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageTwo;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageThree;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageFour;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageFive;
@property (weak, nonatomic) IBOutlet DiceImageView *diceImageSix;
@property (weak, nonatomic) IBOutlet UILabel *bankScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gatherDice;




@end

@implementation GameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.boardDice = [NSMutableArray arrayWithObjects:self.diceImageOne, self.diceImageTwo, self.diceImageThree, self.diceImageFour, self.diceImageFive, self.diceImageSix, nil];
    self.yourDice = [NSMutableArray new];
    
    for (DiceImageView* die in self.boardDice)
    {
        die.delegate = self;
    }
    
//    for (int i=0; i<self.numberOfPlayers; i++)
//    {
//        UIAlertController* enterName = [UIAlertController alertControllerWithTitle:@"Enter your name" message:[NSString stringWithFormat:@"Player %i enter your name.", i+1] preferredStyle:UIAlertControllerStyleAlert];
//        
//        [enterName addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//            textField.placeholder = @"Enter name here.";
//        }];
//        
//        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
//                                   {
//                                       Player* newPlayer = [[Player alloc]initWithName:enterName.textFields.firstObject.text];
//                                       [self.players addObject:newPlayer];
//                                   }];
//        
//        [enterName addAction:okAction];
//        [self presentViewController:enterName animated:YES completion:nil];
//    }
    
    
    //UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self.gatherDice action:@selector(onGatherDiceLabelTap)];
    //self.gatherDice.userInteractionEnabled = YES;
    
    
    
    for (int i=0; i<self.numberOfPlayers; i++)
    {
        while (![self checkForFarkle:self.boardDice])
        {
            [self playRound];
        }
    }
    
}


-(void)onGatherDiceLabelTap
{
    NSLog(@"Gather Dice was tapped.");
}

- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    
    for (DiceImageView* die in self.boardDice)
    {
        [die roll];
    }
    
    //After you roll your score is counted so you don't need the objects anymore.
    [self.yourDice removeAllObjects];
}

-(void)diceImageViewWasTapped:(DiceImageView *)selectedDie
{
    self.multiplesArray = [NSMutableArray arrayWithObjects:@0,@0,@0,@0,@0,@0, nil];
    self.roundScore = 0;
    
    // Check if die was in array already
    if(![self.yourDice containsObject:selectedDie])
    {
        [self.boardDice removeObject:selectedDie];
        [self.yourDice addObject:selectedDie];
        [self scoreRound:self.yourDice];
    }
    
    else // Remove die
    {
        [self.yourDice removeObject:selectedDie];
        [self.boardDice addObject:selectedDie];
        [self scoreRound:self.yourDice];
    }
    
     //self.turnScore = [self scoreRound:self.yourDice];
}

// Ask if they want to bank or roll again.
-(void)playRound
{
    
    [self scoreRound:self.yourDice];
}


// Returns yes if you have farkled and no if you haven't

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
                    self.roundScore = self.roundScore + 100; // One 1 in the array
                    NSLog(@"You have a 1. Your round score is: %i. Your single counter is %i",self.roundScore, singleCounter);
                    break;
                }
                else if(i == 4) // if the dice was five
                {
                    singleCounter++;
                    self.roundScore = self.roundScore +50; // One 5 in the array
                    NSLog(@"You have a 5. Your round score is: %i. Your single counter is: %i",self.roundScore, singleCounter);
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
                    self.roundScore = self.roundScore + 200; // Two 1's in the array
                    NSLog(@"You have two ones so you get 200 points. Your round score is: %i",self.roundScore);
                    pairCounter++;
                    NSLog(@"You have pair of: %i. Your pair counter is: %i", i+1, pairCounter);
                    break;
                }
                else if(i == 4) // Five
                {
                    self.roundScore = self.roundScore +100; // Two 5's in the array
                    NSLog(@"You have two fives so you get 100 points. Your round score is: %i",self.roundScore);
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
                    self.roundScore = self.roundScore + 1000;
                    //NSLog(@"You have a triple of %i's. Your round score is: %i", i+1, self.roundScore);
                    break;
                case 2:
                    self.roundScore = self.roundScore + 200;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 3:
                    self.roundScore = self.roundScore + 300;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 4:
                    self.roundScore = self.roundScore + 400;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 5:
                    self.roundScore = self.roundScore+ 500;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                case 6:
                    self.roundScore = self.roundScore + 600;
                    //NSLog(@"You have a triple of %i's", i+1);
                    break;
                default:
                    break;
            }
                tripleCounter++;
                NSLog(@"You have a triple of: %i. Your triple counter is: %i. Your round score is: %i",i+1, tripleCounter, self.roundScore);
                break;
                // Four of....
            case 4:
                // Check for a pair as well
                self.roundScore = self.roundScore + 1000;
                NSLog(@"You have 4 of a kind. Your round score is: %i",self.roundScore);
                fourOfAKind = YES;
                break;
                // Five of....
            case 5:
                self.roundScore = self.roundScore + 2000;
                NSLog(@"You have 5 of a kind. Your round score is: %i",self.roundScore);
                break;
                // Six of ...
            case 6:
                self.roundScore = self.roundScore + 3000;
                NSLog(@"You have 6 of a kind. Your round score is: %i",self.roundScore);
                break;
            default:
                NSLog(@"You have no %i's at all", i+1);
                break;
        }
    }
    
    //Special cases!!!!
    if (tripleCounter == 2) // Two triples case
    {
        self.roundScore = 2500;
        NSLog(@"You have 2 triples! Your score for this round is: %i", self.roundScore);
    }
    
    if (pairCounter == 3) // Three pairs case
    {
        self.roundScore = 1500;
        NSLog(@"You have 3 pairs! Your score for this round is: %i", self.roundScore);
    }
    
    if(pairCounter == 1 && fourOfAKind == YES) // Four of a kind and a pair
    {
        self.roundScore = 1500;
        NSLog(@"You have 4 of a kind and a pair! Your score for this round is: %i", self.roundScore);
    }
    if(singleCounter == 6) // Straight
    {
        self.roundScore = 1500;
        NSLog(@"You have a straight! Your score for this round is: %i", self.roundScore);
    }
    
    self.roundScoreLabel.text = [NSString stringWithFormat:@"Round score: %i", self.roundScore];
    return self.roundScore;
}

-(BOOL)checkForFarkle:(NSMutableArray*)arrayOfDice
{
    // You have farkled
    if(![self scoreRound:arrayOfDice])
    {
        
        return YES;
    }
    else
        return NO;
}

// Count multiple for each dice
// Pass in yourDice array
// increments count of every number
-(void) countMultiples:(NSMutableArray<DiceImageView*>*)yourDice
{
    for (int i=0; i < yourDice.count; i++)
    {
        if([yourDice objectAtIndex:i].imageName.intValue == 1) // hey future yemi don't forget to add text when you replace these.
        {
            self.multiplesArray[0] = @(self.multiplesArray[0].intValue+1);
            //NSLog(@"Number of ones in your array: %@",[self.multiplesArray objectAtIndex:0]);
        }
        else if([yourDice objectAtIndex:i].imageName.intValue == 2)
        {
            self.multiplesArray[1] = @(self.multiplesArray[1].intValue+1);
            //NSLog(@"Number of twos in your array: %@",[self.multiplesArray objectAtIndex:1]);
        }
        else if([yourDice objectAtIndex:i].imageName.intValue == 3)
        {
            self.multiplesArray[2] = @(self.multiplesArray[2].intValue+1);
            //NSLog(@"Number of threes in your array: %@",[self.multiplesArray objectAtIndex:2]);
        }
        else if([yourDice objectAtIndex:i].imageName.intValue == 4)
        {
            self.multiplesArray[3] = @(self.multiplesArray[3].intValue+1);
            //NSLog(@"Number of fours in your array: %@",[self.multiplesArray objectAtIndex:3]);
        }
        else if([yourDice objectAtIndex:i].imageName.intValue == 5)
        {
            self.multiplesArray[4] = @(self.multiplesArray[4].intValue+1);
            //NSLog(@"Number of fives in your array: %@",[self.multiplesArray objectAtIndex:4]);
        }
        else if([yourDice objectAtIndex:i].imageName.intValue == 6)
        {
            self.multiplesArray[5] = @(self.multiplesArray[5].intValue+1);
            //NSLog(@"Number of sixs in your array: %@",[self.multiplesArray objectAtIndex:5]);
        }
    }
    NSLog(@"%@@", self.multiplesArray);
    
}


@end
