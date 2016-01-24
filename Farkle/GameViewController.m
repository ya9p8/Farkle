//
//  ViewController.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/22/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "GameViewController.h"
#import "DieLabel.h"
#import "Player.h"

@interface GameViewController () <DieLabelDelegate, GameDelegate>
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelOne;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelTwo;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelThree;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFour;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelFive;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabelSix;
@property (weak, nonatomic) IBOutlet UILabel *userScore;
@property NSMutableArray* boardDice;
@property NSMutableArray<DieLabel *>* yourDice;
@property NSMutableArray<NSNumber*>* testArray;
@property (weak, nonatomic) IBOutlet UILabel *roundScoreLabel;



@end

@implementation GameViewController


-(void)viewWillAppear:(BOOL)animated
{
    self.game.delegate = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.boardDice = [NSMutableArray arrayWithObjects:self.dieLabelOne, self.dieLabelTwo, self.dieLabelThree, self.dieLabelFour, self.dieLabelFive, self.dieLabelSix, nil];
//    self.yourDice = [NSMutableArray new];
//    
//    for (DieLabel* die in self.boardDice)
//    {
//        die.delegate = self;
//    }
    
    NSLog(@"I have %i of player(s) to deal with.", self.game.numberOfPlayers);
    
    //self.game = [[Game alloc]initWithNumberOfPlayers:self.game.numberOfPlayers];
    //self.game.delegate = self;
    
    
    
    
    
    
}
- (IBAction)onRollButtonPressed:(UIButton *)sender
{
    
    for (DieLabel* die in self.boardDice)
    {
        [die roll];
    }
    
    //After you roll your score is counted so you don't need the objects anymore.
    [self.yourDice removeAllObjects];
}

-(void)dieLabelWasTapped:(DieLabel *)selectedDie
{
    //self.multiplesArray = [NSMutableArray arrayWithObjects:@0,@0,@0,@0,@0,@0, nil];
    //self.roundScore = 0;
    // Check if die was in array already
    if(![self.yourDice containsObject:selectedDie])
    {
        [self.boardDice removeObject:selectedDie];
        [self.yourDice addObject:selectedDie];
    }
    
    else // Remove die
    {
        selectedDie.backgroundColor = [UIColor lightGrayColor];
        [self.yourDice removeObject:selectedDie];
        [self.boardDice addObject:selectedDie];
    }
    
     //self.turnScore = [self scoreRound:self.yourDice];
}

// Ask if they want to bank or roll again.
-(void)playRound
{
    //UIAlertController*
}

-(void)gameWasCreated:(Game*)game
{
    game.players = [NSMutableArray new];
    
    for(int i=0; i < game.numberOfPlayers; i++)
    {
        UIAlertController* enterName = [UIAlertController alertControllerWithTitle:@"Enter your name" message:[NSString stringWithFormat:@"Player %i enter your name.", i] preferredStyle:UIAlertControllerStyleAlert];
        
        [enterName addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
            textField.placeholder = @"Enter name here.";
        }];
        
        UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action)
                                   {
                                       Player* newPlayer = [[Player alloc]initWithName:enterName.textFields.firstObject.text];
                                       [game.players addObject:newPlayer];
                                   }];
        
        [enterName addAction:okAction];
        [self presentViewController:enterName animated:YES completion:nil];
        
        
    }
    
    
}


// Returns yes if you have farkled and no if you haven't


- (IBAction)onPlayRoundButtonTapped:(id)sender {
    
    [self playRound];
}

@end
