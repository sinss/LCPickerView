//
//  MathFunction.h
//  MLIproposal
//
//  Created by 張星星 on 12/5/19.
//  Copyright (c) 2012年 Mountant Star Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MathFunction : NSObject

+ (MathFunction*)mathFunctionInstance;
- (BOOL)isPureInt:(NSString*)string;
- (BOOL)isPureFloat:(NSString*)string;
// 四捨五入、無條件捨去、無條件進位
- (NSNumber*)roundWithDigit:(NSUInteger)digit andRoundNumber:(NSNumber*)number;
- (NSNumber*)ceilWithDigit:(NSUInteger)digit andCeilNumber:(NSNumber*)number;
- (NSNumber*)floorWithDigit:(NSUInteger)digit andFloorNumber:(NSNumber*)number;
//display 數字
- (NSString*)displayDefaultNumberWithNumber:(NSNumber*)number;
- (NSString*)displayDefaultNumberWithNumber:(NSNumber *)number andDigit:(NSUInteger)digit;
- (NSString*)displayPercentageWithNumber:(NSNumber*)number;
- (NSString*)displayPercentageWithNumber:(NSNumber*)number andDigit:(NSUInteger)digit;
- (NSString*)displayRateWithNumber:(NSNumber*)number;
//比大小
- (NSNumber*)maxNumberWithNumber:(double)num1 andOther:(double)num2;
@end
