//
//
//  Created by Rheno Budiasa
//  rhenobudiasa@yahoo.com
//  Copyright (c) 2015 Rheno Budiasa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set notificationcenter when keyboard show
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    
    
}


- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    // remove notificationcenter when keyboard show
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(void)keyboardDidShow:(NSNotification*)notif{
    
    //Check Keyboard size
    CGSize keyboardSize = [[[notif userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    
    // set position for textField relative to keyboard size
    self.view.frame = CGRectMake(0,keyboardSize.height-_textField.frame.origin.y+30,self.view.frame.size.width, self.view.frame.size.height);
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    // set textField position to origin
    self.view.frame = CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height);
    [_textField resignFirstResponder];
}




@end
