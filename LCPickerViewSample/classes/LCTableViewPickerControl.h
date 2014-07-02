//
//  LCTableViewPickerControl.h
//  InsurancePig
//
//  Created by Leo Chang on 10/21/13.
//  Copyright (c) 2013 Good-idea Consunting Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kPickerControlWidth 320
#define kPickerControlAgeHeight 300
#define kAnimationDuration 0.4
#define kPickerTitleBarColor [UIColor redColor]

@class LCTableViewPickerControl;
@protocol LCItemPickerDelegate <NSObject>

- (void)selectControl:(LCTableViewPickerControl*)view didSelectWithItem:(id)item;
- (void)selectControl:(LCTableViewPickerControl *)view didCancelWithItem:(id)item;

@end


@interface LCTableViewPickerControl : UIView <UITableViewDataSource, UITableViewDelegate>

@property (weak) id <LCItemPickerDelegate> delegate;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, strong) NSString *key;

- (id)initWithFrame:(CGRect)frame title:(NSString*)title value:(id)value items:(NSArray*)array offset:(CGPoint)offset;

- (void)show;
- (void)dismiss;

@end
