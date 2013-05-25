//
//  DetailController.m
//  EditTableView
//
//  Created by Rheno Budiasa on 5/25/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import "DetailController.h"

@interface DetailController ()
- (void)configureView;
@end

@implementation DetailController

- (void)dealloc
{
    [_detailItem release];
   
    [super dealloc];
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        [_detailItem release];
        _detailItem = [newDetailItem retain];
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        NSLog(@"%@",[[self.detailItem valueForKey:@"username"] description]);
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
