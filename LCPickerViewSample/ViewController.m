//
//  ViewController.m
//  LCPickerViewSample
//
//  Created by Leo Chang on 10/21/13.
//  Copyright (c) 2013 MountainStar Inc. All rights reserved.
//

#import "ViewController.h"
#import "LCTableViewPickerControl.h"

@interface ViewController () <LCItemPickerDelegate>

@property (nonatomic, strong) UIView *maskView;
@property (weak) id pickValue;

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
    //add mask
    //self.maskView = [[UIView alloc] initWithFrame:self.navigationController.view.frame];
    self.maskView = [[UIView alloc] initWithFrame:self.view.bounds];
    [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
    [self.view addSubview:_maskView];
    LCTableViewPickerControl *selectAgeView = [[LCTableViewPickerControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, kPickerControlWidth, kPickerControlAgeHeight) title:@"Please pick a item" value:_pickValue items:@[@"item1",@"item2",@"item3",@"item4",@"item5",@"item6"]];
    [selectAgeView setDelegate:self];
    
    
    [self.view addSubview:selectAgeView];
    
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [selectAgeView setFrame:CGRectMake(0, self.view.frame.size.height - kPickerControlAgeHeight, kPickerControlWidth, kPickerControlAgeHeight)];
        [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6]];
    } completion:^(BOOL finished){
        
    }];
}

- (void)dismissPickerControl:(UIView*)view
{
    //animation to dismiss
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [view setFrame:CGRectMake(0, self.view.frame.size.height, kPickerControlAgeHeight, kPickerControlWidth)];
        [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
    } completion:^(BOOL finished){
        [view removeFromSuperview];
        [_maskView removeFromSuperview];
    }];
}

#pragma mark - LCTableViewPickerDelegate


- (void)selectControl:(LCTableViewPickerControl*)view didSelectWithItem:(id)item
{
    /*
     Check item is NSString or NSNumber , if it is necessary
     */
    if ([item isKindOfClass:[NSString class]])
    {
        
    }
    else if ([item isKindOfClass:[NSNumber class]])
    {
        
    }
    self.pickValue = item;
    [_resultLabel setText:[NSString stringWithFormat:@"%@", item]];
    
    [self dismissPickerControl:view];
}

- (void)selectControl:(LCTableViewPickerControl *)view didCancelWithItem:(id)item
{
    
    [self dismissPickerControl:view];
}
@end
