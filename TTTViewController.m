//
//  TTTViewController.m
//  Tac
//
//  Created by Arthur Boia on 7/29/14.
//  Copyright (c) 2014 Arthur Boia. All rights reserved.
//

#import "TTTViewController.h"
#import "TTTTouchSpot.h"

@interface TTTViewController ()

@end

@implementation TTTViewController
{
    NSMutableArray* spots;
    BOOL player1Turn;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)   {
        
                spots = [@[] mutableCopy];
                player1Turn = YES;
        
                }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int spotWH = 80;
    int padding = 20;
    int gridWH = (spotWH*3) + (padding* 2);
    float spacingW = (SCREEN_WIDTH - gridWH) / 2;
    float spacingH = (SCREEN_HEIGHT - gridWH) / 2;
    
    
    for (int row = 0; row < 3; row++)
    {
        for (int col = 0; col < 3; col++)
        {
            int x =(spotWH + padding) * col + spacingW;
            int y =(spotWH + padding) * row + spacingH;
            
            
            UIView* spot = [[UIView alloc] initWithFrame: CGRectMake(x, y, spotWH, spotWH)];
            spot.backgroundColor = [UIColor lightGrayColor];
            [self.view addSubview:spot];
            [spots addObject:spot];
            
        }
        
    }
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"touched");
    
    UITouch* touch= [touches allObjects][0];
    
    NSLog(@"%d", spots.count);
    int spotWH = 80;
    
    for (UIView* spot in spots)
    {
        CGPoint location = [touch locationInView:spot];

    
        // x >=0
        // y >=0
        // x <+ spotWH
        // y <=spotWH
        if (location.x >=0 && location.y >= 0)
            if (location.x <= spotWH && location.y <= spotWH)
        {
            if ([spot.backgroundColor isEqual:[UIColor lightGrayColor]])
            {
                NSLog(@"%@", spot);
                UIColor* color = (player1Turn)? [UIColor cyanColor] : [UIColor magentaColor];
                spot.backgroundColor = color;
                player1Turn = !player1Turn;
                [self checkForWinner];
            }
          
        }
    
//        NSLog(@"x: %f y : %f", location.x, location.y);
    }
}

-(void)checkForWinner
{
    // if 0,1,2 = same color, then color wins
    
    UIView* spot0 = spots[0];
    UIView* spot1 = spots[0];
    UIView* spot2 = spots[0];
    
    if ([spot0.backgroundColor isEqual:spot1.backgroundColor] && [spot1.backgroundColor isEqual:spot2.backgroundColor])
    {
        //change to spot.player
        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]])
        {
            NSLog(@"player 1 wins");
        } else {
            NSLog(@"player 2 wins");
            
                }//UIAlertView for winner or draw
    }
    //make it work for every case
    
    UIView* spot3 = spots[0];
    UIView* spot4 = spots[0];
    UIView* spot5 = spots[0];
    
    if ([spot3.backgroundColor isEqual:spot4.backgroundColor] && [spot4.backgroundColor isEqual:spot5.backgroundColor])
    {
        //change to spot.player
        if ([spot2.backgroundColor isEqual:[UIColor cyanColor]])
        {
            NSLog(@"player 1 wins");
        } else {
            NSLog(@"player 2 wins");
            
        }//UIAlertView for winner or draw
    }
    
    UIView* spot6 = spots[0];
    UIView* spot7 = spots[0];
    UIView* spot8 = spots[0];
    
    if ([spot6.backgroundColor isEqual:spot7.backgroundColor] && [spot7.backgroundColor isEqual:spot8.backgroundColor])
    {
        //change to spot.player
        if ([spot6.backgroundColor isEqual:[UIColor cyanColor]])
        {
            NSLog(@"player 1 wins");
        } else {
            NSLog(@"player 2 wins");
            
        }//UIAlertView for winner or draw
    }
    
        if ([spot0.backgroundColor isEqual:spot5.backgroundColor] && [spot5.backgroundColor isEqual:spot8.backgroundColor])
    {
        //change to spot.player
        if ([spot0.backgroundColor isEqual:[UIColor cyanColor]])
        {
            NSLog(@"player 1 wins");
        } else {
            NSLog(@"player 2 wins");
            
        }//UIAlertView for winner or draw
    }
    if ([spot0.backgroundColor isEqual:spot3.backgroundColor] && [spot3.backgroundColor isEqual:spot6.backgroundColor])
    {
        //change to spot.player
        if ([spot3.backgroundColor isEqual:[UIColor cyanColor]])
        {
            NSLog(@"player 1 wins");
        } else {
            NSLog(@"player 2 wins");
            
        }//UIAlertView for winner or draw
    }
    

    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
