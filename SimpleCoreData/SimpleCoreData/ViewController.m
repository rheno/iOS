//
//  ViewController.m
//  SimpleCoreData
//
//  Created by Rheno  Budiasa on 1/5/14.
//  Copyright (c) 2014 Rheno Budiasa. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate createNewStudentWithName:@"Plerrr" studentNumber:5 age:10];
    
    NSLog(@"Before Delete\n");
    [delegate liat];
    NSLog(@"After Update\n");
    [delegate updateStudentAtIndex:1 Name:@"Rheno3" studentNumber:20 age:31];
    [delegate liat];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
