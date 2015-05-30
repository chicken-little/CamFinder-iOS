//
//  SettingViewController.h
//  CamFinder-iOS
//
//  Created by Chicken-little on 4/23/2558 BE.
//  Copyright (c) 2558 chicken-little. All rights reserved.
//
@class SettingViewController;
#import <UIKit/UIKit.h>


@protocol SettingViewControllerDelegate <NSObject>


- (void)settingDidCancle:(SettingViewController *)controller;
- (void)settingDidDone:(SettingViewController *)controller;
@end

@interface SettingViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>


@property (nonatomic, weak) id <SettingViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UITextField *mHeightTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *mBuildingPicker;


- (IBAction)backgroundTap:(id)sender;
- (IBAction)settingCancel:(id)sender;
- (IBAction)settingDone:(id)sender;
- (void)configureRestKit;
- (void)loadInfo;
@end
