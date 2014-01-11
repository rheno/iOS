//
//  ViewController.m
//  SimpleDatabase
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dismissKeyboard {
    [_studentNoText resignFirstResponder];
    [_nameStudentText resignFirstResponder];
    [_departmentText resignFirstResponder];
    [_yearText resignFirstResponder];
    [_findText resignFirstResponder];
}

- (IBAction)saveData:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Data Insertion failed";
    if (_studentNoText.text.length>0 &&_nameStudentText.text.length>0 &&
        _departmentText.text.length>0 &&_yearText.text.length>0 )
    {
        success = [[DBManager getSharedInstance] saveData:
                   _studentNoText.text name:_nameStudentText.text department:
                   _departmentText.text year:_yearText.text];
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Insert Success" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
}

- (IBAction)updateData:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Update failed";
    if (_studentNoText.text.length>0 &&_nameStudentText.text.length>0 &&
        _departmentText.text.length>0 &&_yearText.text.length>0 )
    {
        success = [[DBManager getSharedInstance] updateData:
                   _studentNoText.text name:_nameStudentText.text department:
                   _departmentText.text year:_yearText.text];
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Update Success" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
    
    
}

- (IBAction)deleteData:(id)sender {
    BOOL success = NO;
    NSString *alertString = @"Update failed";
    if (_studentNoText.text.length>0 &&_nameStudentText.text.length>0 &&
        _departmentText.text.length>0 &&_yearText.text.length>0 )
    {
        success = [[DBManager getSharedInstance] deleteData:_studentNoText.text];
        
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Delete Success" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
    else{
        alertString = @"Enter all fields";
    }
    if (success == NO) {
        
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              alertString message:nil
                                                      delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        [self clearText];
    }
    
    
}
- (IBAction)findData:(id)sender {
    NSArray *data = [[DBManager getSharedInstance]findByRegisterNumber:
                     _findText.text];
    if (data == nil) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:
                              @"Data not found" message:nil delegate:nil cancelButtonTitle:
                              @"OK" otherButtonTitles:nil];
        [alert show];
        
        [self clearText];
    }
    else{
        _studentNoText.text = _findText.text;
        _nameStudentText.text =[data objectAtIndex:0];
        _departmentText.text = [data objectAtIndex:1];
        _yearText.text =[data objectAtIndex:2];
    }
}

-(void)clearText{
    _studentNoText.text = @"";
    _nameStudentText.text =@"";
    _departmentText.text = @"";
    _yearText.text =@"";
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [_scrollView setFrame:CGRectMake(10, 50, 300, 200)];
    [_scrollView setContentSize:CGSizeMake(300, 200)];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
    [_scrollView setFrame:CGRectMake(10, 50, 300, 350)];
    
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

@end
