//
//  MenuViewController.m
//  Farkle
//
//  Created by Yemi Ajibola on 1/24/16.
//  Copyright © 2016 Yemi Ajibola. All rights reserved.
//

#import "MenuViewController.h"
#import "GameViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender
{
    GameViewController* destinationVC = segue.destinationViewController;
    Game *game = [[Game alloc]initWithNumberOfPlayers:(int)sender.tag];
    //NSLog(@"Headed to the GameView Controller with: %i player(s)", destinationVC.game.numberOfPlayers);
    game.delegate = segue.destinationViewController;
    destinationVC.game = game;
    
    
}




@end
