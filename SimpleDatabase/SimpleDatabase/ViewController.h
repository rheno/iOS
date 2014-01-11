//
//  ViewController.h
//  SimpleDatabase
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBManager.h"

@interface ViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *findText;
@property (weak, nonatomic) IBOutlet UIButton *findBtn;
@property (weak, nonatomic) IBOutlet UITextField *studentNoText;
@property (weak, nonatomic) IBOutlet UITextField *nameStudentText;
@property (weak, nonatomic) IBOutlet UITextField *departmentText;
@property (weak, nonatomic) IBOutlet UITextField *yearText;
@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *updateBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;


-(void)clearText;
- (IBAction)findData:(id)sender;
- (IBAction)saveData:(id)sender;
- (IBAction)updateData:(id)sender;
- (IBAction)deleteData:(id)sender;
@end
