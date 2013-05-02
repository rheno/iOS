//
//  ViewController.h
//  PagingScrollView
//
//  Created by Rheno Budiasa on 5/2/13.
//  Copyright (c) 2013 rheno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate>

//ScrollView from storyboard
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

//PageControl from storyboard
@property (retain, nonatomic) IBOutlet UIPageControl *pageControl;

//Action when UIPageControl click
- (IBAction)onChange:(id)sender;
@end
