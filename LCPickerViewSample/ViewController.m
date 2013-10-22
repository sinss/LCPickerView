//
//  ViewController.m
//  LCPickerViewSample
//
//  Created by Leo Chang on 10/21/13.
//  Copyright (c) 2013 MountainStar Inc. All rights reserved.
//

#import "ViewController.h"
#import "LCNumberInputControl.h"

@interface ViewController () <LCNumberInputDelegate>

@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) NSNumber *pickValue;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)show:(id)sender
{
    LCNumberInputControl *inputView = [[[NSBundle mainBundle] loadNibNamed:@"LCNumberInputControl" owner:self options:nil] objectAtIndex:0];
    [inputView setFrame:CGRectMake(0, self.view.frame.size.height, kNumberControlWidth, kNumberControlHeight)];
    [inputView setDelegate:self];
    [inputView setTag:0];
    [inputView setInputType:numberInputTypeInteger];
    //current pick value
    [inputView setInputResult:[NSNumber numberWithInteger:[_resultLabel.text integerValue]]];
    [inputView.titleBar.topItem setTitle:[NSString stringWithFormat:@"Please input a number"]];
    [inputView.numberField setPlaceholder:[NSString stringWithFormat:@"Input you number"]];
    [self.view addSubview:inputView];
    
    [inputView show];
}

- (void)dismissPickerControl:(LCNumberInputControl*)view
{
    [view dismiss];
}

#pragma mark - LCTableViewPickerDelegate


- (void)numberControl:(LCNumberInputControl *)view didInputWithNumber:(NSNumber *)number
{
    self.pickValue = number;
    [_resultLabel setText:[NSString stringWithFormat:@"%@", number]];
    
    [self dismissPickerControl:view];
}

- (void)numberControl:(LCNumberInputControl *)view didCancelWithNumber:(NSNumber *)number
{
    [self dismissPickerControl:view];
}
@end
