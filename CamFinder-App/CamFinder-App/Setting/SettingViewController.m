//
//  SettingViewController.m
//  CamFinder-iOS
//
//  Created by Chicken-little on 4/23/2558 BE.
//  Copyright (c) 2558 chicken-little. All rights reserved.
//

#import "SettingViewController.h"
//#import <RestKit/RestKit.h>
#import "ViewController.h"

//#define kCLIENTID "QSLZSSRW2EZADTOQVMZ1HBYFEYGZURUQYQ1XVL2O01AJGWRU"
//#define kCLIENTSECRET "RNDI3L4PZP4ZY3KAWJKDL4I2YTHHYLM4TPELJRNGIF1ID3CO"
@interface SettingViewController ()
{
    NSMutableArray *_objects;
    //User *u;
    ViewController *mainVC;
    NSArray* mBuildingArray2;
    
    
}
@property (nonatomic, strong) NSArray *mBuildingArray;
//@property (nonatomic, strong) NSArray *mBuildingArray3;

@end

@implementation SettingViewController
@synthesize mBuildingPicker, mHeightTextField,mBuildingArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mainVC = (ViewController*)[self.storyboard instantiateViewControllerWithIdentifier:@"mainVC"];
    mainVC.navigationItem.hidesBackButton = YES;
    
    
    mBuildingArray2 = [[NSArray alloc]initWithObjects:@"fifty-fifth",@"Pra-tep", @"stedium" ,nil];
    //NSLog(@"The content of arry is%@",mBuildingArray2);
        //mHeightTextField.text = @"150";
//    User *u = [User alloc];
    
    //User *user = [mBuildingArray objectAtIndex:0];
    //NSLog(@"user.name: %@",user.name);
    
    self.mBuildingPicker.delegate = self;
    self.mBuildingPicker.dataSource = self;
    //[self.mBuildingPicker reloadAllComponents];
    //NSLog(@"The content of arry is%@",mBuildingArray2);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}








#pragma textFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    
    return YES;
}




#pragma mark - UIPickerView
// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return mBuildingArray2.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return mBuildingArray2[row];
}




//return 0;


- (IBAction)backgroundTap:(id)sender {
    //NSLog(@"backgroundTap");
    [self.view endEditing:YES];
}

- (IBAction)settingCancel:(id)sender {
    
    //NSLog(@"settingCancel");
   [self.navigationController pushViewController:mainVC animated:YES];
    
}

- (IBAction)settingDone:(id)sender {
    //Variable
    NSInteger row;
    row = [mBuildingPicker selectedRowInComponent:0];
    NSString * strSelectedBName = [mBuildingArray2 objectAtIndex:row];
    NSString * strFieldHeight = [self.mHeightTextField text];
    double valHeight = [strFieldHeight doubleValue];
    
    //isInputValid
    if([strFieldHeight isEqualToString:@""]||[strSelectedBName isEqualToString:@""])
    {
        //AlertView
        [self alertStatus:@"Please fill your information again" :@"Invalid Information" :0];
    }
    else
    {
        BOOL valid;
        NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
        NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:strFieldHeight];
        valid = [alphaNums isSupersetOfSet:inStringSet];
        if (valid) // numeric
        {
            if (100 < valHeight && valHeight < 200) {
                //sent hight & bName to mainVC
            
                
                
                mainVC.isSetted = TRUE;
                mainVC.strBName = strSelectedBName;
                mainVC.strHeight = strFieldHeight;
                [self.navigationController pushViewController:mainVC animated:YES];
                
                
            }
            else
            {
                //alertView Hight invalid
                [self alertStatus:@"Please fill your height again" :@"Invalid Information" :0];
            }
            
            
            
        }
        else
        {
            //Alertview not numeric
            [self alertStatus:@"Please fill your height with number" :@"Invalid Information Type" :0];
            
        }
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
