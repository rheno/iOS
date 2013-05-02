//
//  ViewController.m
//  PagingScrollView
//
//  Created by Rheno Budiasa on 5/2/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self initViews];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initViews{
    
    //Array of colors
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
    
    //Loop for Array of Colors
    for (int i = 0; i < colors.count; i++) {
        
        //Set frame for UIView (in scrollview)
        CGRect frame;
        frame.origin.x = self.view.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.view.frame.size;
        /////////////////////////////////////////
        
        //Add UIView to ScrollView
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = [colors objectAtIndex:i];
        [_scrollView addSubview:subview];
        [subview release];
        //////////////////////////
    }
    
    
    //Set ScrollView size after add with UIView
    
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * [colors count], self.view.frame.size.height);
    
    
}

- (void)dealloc {
    [_scrollView release];
    [_pageControl release];
    [super dealloc];
}


- (IBAction)onChange:(id)sender {
    
    //Action After user click the UIPageControl
    CGRect frame;
    frame.origin.x = _scrollView.frame.size.width * _pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = _scrollView.frame.size;
	[_scrollView scrollRectToVisible:frame animated:YES];
	
    
}
@end
