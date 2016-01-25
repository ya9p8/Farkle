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
    destinationVC.numberOfPlayers = (int)sender.tag;
    //NSLog(@"The number of players is: %i", destinationVC.numberOfPlayers);
    
}




@end
