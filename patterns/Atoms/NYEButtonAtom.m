//
//  UIButton+pattern.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "NYEButtonAtom.h"
#import <QuartzCore/QuartzCore.h>


@implementation NYEButtonAtom

+ (UIButton *)positiveActionWith:(NSString *)title {
    
    UIButton *this = [[self new] defaultButtonWith:[UIColor greenColor]];
    
    [this setTitle:title forState:UIControlStateNormal];
    [this setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    
    return this;
}

+ (UIButton *)negativeActionWith:(NSString *)title {
    UIButton *negative = [[self new] defaultButtonWith:[UIColor redColor]];
    [negative setTitle:title forState:UIControlStateNormal];
    return negative;
}

- (UIButton *)defaultButtonWith:(UIColor *)mainColor {
    CGRect rect = CGRectMake(0, 0, 100, 30);
    UIButton *newButton = [[UIButton alloc] initWithFrame:rect];
    
    [newButton setTintColor:mainColor];
    [newButton setTitleColor:mainColor forState:UIControlStateNormal];
    
    newButton.backgroundColor = [UIColor whiteColor];
    newButton.opaque = YES;
    
    newButton.layer.borderColor = mainColor.CGColor;
    newButton.layer.borderWidth = 1.0;
    newButton.layer.cornerRadius = 8;
    
    return newButton;
}

@end
