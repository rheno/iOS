//
//  ViewController.m
//  Calculator
//
//  Created by rheno budiasa on 6/13/12.
//  Copyright (c) 2012 digirabel@yahoo.com. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
{
    UIButton *buttonArray[SUM_OF_BUTTON];
    NSMutableString* theString;
    float sum;
    NSInteger buffer;
    NSInteger status;

}
@end

@implementation ViewController
@synthesize editText;


- (void)viewDidLoad
{
    [super viewDidLoad];

	// Do any additional setup after loading the view, typically from a nib.
    CGRect buttonPosition[SUM_OF_BUTTON] = {CGRectMake(30, 60, 70, 40),CGRectMake(120, 60, 70, 40),CGRectMake(210, 60, 70, 40),CGRectMake(30, 110, 70, 40),CGRectMake(120, 110, 70, 40),CGRectMake(210, 110, 70, 40),CGRectMake(30, 160, 70, 40),CGRectMake(120, 160, 70, 40),CGRectMake(210, 160, 70, 40),CGRectMake(30, 210, 70, 40),CGRectMake(120, 210, 70, 40),CGRectMake(210, 210, 70, 40),CGRectMake(30, 260, 70, 40),CGRectMake(120, 260, 70, 40),CGRectMake(210, 260, 70, 40),CGRectMake(120, 310, 70, 40)};    
    
    [editText setEnabled:NO];
     theString = [[NSMutableString alloc] initWithString:@""];
   
    for (int index=0; index<SUM_OF_BUTTON; index++) {
        
        buttonArray[index] = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        buttonArray[index].frame = buttonPosition[index];
            
        [buttonArray[index] setTitle:[NSString stringWithFormat:@"%d",index+1] forState:UIControlStateNormal];
        [buttonArray[index] setTag:index];
        [buttonArray[index] addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchDown];        
        if(index==9)
        {[buttonArray[index] setTitle:@"+" forState:UIControlStateNormal];
        }
        if(index==11)
        {[buttonArray[index] setTitle:@"-" forState:UIControlStateNormal];
        }
        if(index==10)
        {[buttonArray[index] setTitle:@"0" forState:UIControlStateNormal];
        }
        if(index==12)
        {[buttonArray[index] setTitle:@"*" forState:UIControlStateNormal];
        }
        
        if(index==13)
        {[buttonArray[index] setTitle:@"=" forState:UIControlStateNormal];
        }
        if(index==14)
        {[buttonArray[index] setTitle:@"/" forState:UIControlStateNormal];
        }
        if(index==15)
        {[buttonArray[index] setTitle:@"clear" forState:UIControlStateNormal];
        }
        [self.view addSubview:buttonArray[index]];
      
    }
    
}

- (void)viewDidUnload
{
    [self setEditText:nil];
    [super viewDidUnload];
    [theString release];
    // Release any retained subviews of the main view.
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) onClick:(id)sender{
    
    @try {            
    switch ([sender tag]) {
        case 0:            
            [theString appendString:@"1"];
            [editText setText:theString];
            break;
        case 1:
            [theString appendString:@"2"];
            [editText setText:theString];
            break;
        case 2:
            [theString appendString:@"3"];
            [editText setText:theString];
            break;
        case 3:
            [theString appendString:@"4"];
            [editText setText:theString];
            break;
        case 4:
            [theString appendString:@"5"];
            [editText setText:theString];
            break;
        case 5:
            [theString appendString:@"6"];
            [editText setText:theString];
            break;
        case 6:
            [theString appendString:@"7"];
            [editText setText:theString];
            break;
        case 7:
            [theString appendString:@"8"];
            [editText setText:theString];
            break;
        case 8:
            [theString appendString:@"9"];
            [editText setText:theString];
            break;
        case 9:
            //Plus                            
            [self setStatus:9];
            break;
        case 10:            
            [theString appendString:@"0"];
            [editText setText:theString];
            break;
        case 11:
            //Substract
            [self setStatus:11];
            break;
        case 12:
            //Multiply
            [self setStatus:12];
            break;        
        case 13:
            //Sum
            if(status==9)
            {
            sum = buffer+[[editText text] floatValue];                        
            }
            if(status==11)
            {
                sum = buffer-[[editText text] floatValue];                        
            }
            if(status==12)
            {
                sum = buffer*[[editText text] floatValue];                        
            }
            if(status==14)
            {
                sum = buffer/[[editText text] floatValue];                        
            }
            [editText setText:[NSString stringWithFormat:@"%f",sum]];                        
            break;
        case 14:
            //Divide
            [self setStatus:14];            
            break;
        case 15:
            //CLEAR
            [theString deleteCharactersInRange:[theString rangeOfString:theString]];
            [editText setText:theString];
            sum=0;
            break;                  
        default:
            break;
        }
    }        
    @catch (NSException *exception) {
    }
    @finally {
    }
    
}


-(void) setStatus:(int)bufferValue{
    buffer = [[editText text] floatValue];
    [theString deleteCharactersInRange:[theString rangeOfString:theString]];
    [editText setText:theString];
    status = bufferValue;
}

- (void)dealloc {
    [editText release];
    [super dealloc];
}
@end
