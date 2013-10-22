//
//  LCNumberInputControl.m
//  InsurancePig
//
//  Created by leo.chang on 13/10/22.
//  Copyright (c) 2013年 Good-idea Consunting Inc. All rights reserved.
//

#import "LCNumberInputControl.h"
#import "MathFunction.h"

@interface LCNumberInputControl() <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *maskView;

@end

@implementation LCNumberInputControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        _currentInput = [NSMutableString stringWithCapacity:0];
        [self initializeControl];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)initializeControl
{   
    //add UIPanGesture
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(move:)];
    [panRecognizer setMinimumNumberOfTouches:1];
    [panRecognizer setMaximumNumberOfTouches:1];
    [panRecognizer setDelegate:self];
    [self addGestureRecognizer:panRecognizer];
}

#pragma mark - handle PanGesture
- (void)move:(UIPanGestureRecognizer *)gestureRecognizer
{
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged)
    {
        CGPoint translation = [gestureRecognizer translationInView:self];
        
        if(translation.y < 0)
            return;
        
        CGPoint translatedCenter = CGPointMake([self center].x, [self center].y + translation.y);
        NSLog(@"y:%f", translation.y);
        [self setCenter:translatedCenter];
        [gestureRecognizer setTranslation:CGPointZero inView:self];
    }
    if ([gestureRecognizer state] == UIGestureRecognizerStateEnded)
    {
        CGPoint translation = [gestureRecognizer translationInView:self];
        if(translation.y < 0)
            return;
        [self.delegate numberControl:self didCancelWithNumber:[NSNumber numberWithInteger:0]];
    }
}

- (void)show
{
    UIViewController *parentView = (UIViewController*)_delegate;
    //add mask
    self.maskView = [[UIView alloc] initWithFrame:parentView.view.bounds];
    [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
    [parentView.view insertSubview:_maskView atIndex:2];
    
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self setFrame:CGRectMake(0, parentView.view.frame.size.height - kNumberControlHeight, kNumberControlWidth, kNumberControlHeight)];
        [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6]];
    } completion:^(BOOL finished){
        //scroll to currentValue
        if (_inputResult)
        {
            [_numberField setText:[NSString stringWithFormat:@"%@", _inputResult]];
        }
    }];
}

- (void)dismiss
{
    UIViewController *parentView = (UIViewController*)_delegate;
    
    //animation to dismiss
    [UIView animateWithDuration:kAnimationDuration delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        [self setFrame:CGRectMake(0, parentView.view.frame.size.height, kNumberControlHeight, kNumberControlWidth)];
        [_maskView setBackgroundColor:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0]];
    } completion:^(BOOL finished){
        [self removeFromSuperview];
        [_maskView removeFromSuperview];
    }];
}

- (IBAction)numberButtonPress:(UIButton*)sender
{
    NSString *str = nil;
    if ([sender tag] == 11)
    {
        str = [NSString stringWithFormat:@"00"];
    }
    else
    {
        str = [NSString stringWithFormat:@"%i", [sender tag]];
    }
    
    if ([self checkIsIntegerOrFloat:str])
    {
        [_currentInput appendString:str];
    }
    [_numberField setText:_currentInput];
}
- (IBAction)dotButtonPress:(UIButton*)sender
{
    NSString *str = [NSString stringWithFormat:@"."];
    if ([self checkIsIntegerOrFloat:str])
    {
        [_currentInput appendString:str];
    }
    [_numberField setText:_currentInput];
}
- (IBAction)clearButtonPress:(UIButton*)sender
{
    [_currentInput setString:@""];
    [_numberField setText:_currentInput];
}
- (IBAction)cancelButtonPress:(UIButton*)sender
{
    [self.delegate numberControl:self didCancelWithNumber:[NSNumber numberWithInteger:0]];
}
- (IBAction)confirmButonPress:(UIButton*)sender
{
    [self.delegate numberControl:self didInputWithNumber:[NSNumber numberWithDouble:[_currentInput doubleValue]]];
}

- (BOOL)checkIsIntegerOrFloat:(NSString*)str
{
    BOOL success = YES;
    if (_inputType == 0)
    {
        if (![[MathFunction mathFunctionInstance] isPureInt:[NSString stringWithFormat:@"%@%@",_currentInput, str]])
        {
            success = NO;
        }
    }
    else
    {
        if (![[MathFunction mathFunctionInstance] isPureFloat:[NSString stringWithFormat:@"%@%@",_currentInput, str]])
        {
            success = NO;
        }
    }
    return success;
}
@end
