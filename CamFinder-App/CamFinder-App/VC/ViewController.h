//
//  ViewController.h
//  CamFinder-App
//
//  Created by Chicken-little on 5/30/2558 BE.
//  Copyright (c) 2558 chicken-little. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//Attribute
@property (strong, nonatomic) NSArray *array_building;
@property  BOOL isSetted;
@property (strong, nonatomic) NSString *strHeight;
@property (strong, nonatomic) NSString *strBName;

- (IBAction)finderStart:(id)sender;

@end

