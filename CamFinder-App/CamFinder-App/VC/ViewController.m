//
//  ViewController.m
//  CamFinder-App
//
//  Created by Chicken-little on 5/30/2558 BE.
//  Copyright (c) 2558 chicken-little. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray * mArrData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
     self.navigationItem.leftBarButtonItem = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)finderStart:(id)sender {
    NSLog(@"isSetted: %hhd", self.isSetted);
    NSLog(@"strHeight: %@", self.strHeight);
    NSLog(@"strBName: %@", self.strBName);
    //     NSLog(@"finderStart");
    
    if(_isSetted == TRUE )
    {
        //post height&BName
        
        //get (x,y,img)
    }
    else
    {
        //Alertview + move to setting view
        [self alertStatus:@"Please click setting to fill yor information" :@"Information does not exist" :0];
        
        
        
    }
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}

@end
