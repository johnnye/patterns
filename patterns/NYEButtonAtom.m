//
//  NYEButtonAtom.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "NYEButtonAtom.h"
#import <QuartzCore/QuartzCore.h>
#import "NYEColorsAtom.h"

@implementation NYEButtonAtom

- (UIButton *)positiveActionWithTitle:(NSString *)title {
    
    if (!title) {
        title = NSLocalizedString(@"YES!", @"Default title for positive action");
    }
    
    UIButton *this = [self defaultButtonWith:[[NYEColorsAtom new ]positiveColor]];
    
    [this setTitle:title forState:UIControlStateNormal];
    [this setTitleColor:[[NYEColorsAtom new]negativeColor] forState:UIControlStateHighlighted];
    
    return this;
}

- (UIButton *)negativeActionWithTitle:(NSString *)title {
    if (!title) {
        title = NSLocalizedString(@"NO!", @"Default title for negative action");
    }
    
    UIButton *negative = [self defaultButtonWith:[[NYEColorsAtom new]negativeColor]];
    [negative setTitle:title forState:UIControlStateNormal];
    return negative;
}

- (UIButton*)disclosureButton {
    UIButton *disclosure = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [disclosure setTintColor:[[NYEColorsAtom new]neutralColor]];
    return disclosure;
}

- (UIButton *)passiveActionWithTitle:(NSString *)title {
    if (!title) {
        title = NSLocalizedString(@"Maybe", @"Passive title for negative action");
    }
    UIButton *passive = [self defaultButtonWith:[[NYEColorsAtom new]neutralColor]];
    [passive setTitle:title forState:UIControlStateNormal];
    return passive;
}

- (UIButton *)defaultButtonWith:(UIColor *)mainColor {
    if (!mainColor) {
        mainColor = [UIColor blackColor];
    }
    CGRect rect = CGRectMake(100, 100, 100, 30);
    UIButton *newButton = [[UIButton alloc] initWithFrame:rect];
    
    [newButton setTitle:NSLocalizedString(@"shrug", @"Deafult Button Title") forState:UIControlStateNormal];
    
    [newButton setTintColor:mainColor];
    [newButton setTitleColor:mainColor forState:UIControlStateNormal];
    
    newButton.backgroundColor = [UIColor whiteColor];
    newButton.opaque = YES;
    
    newButton.layer.borderColor = mainColor.CGColor;
    newButton.layer.borderWidth = 1.0;
    newButton.layer.cornerRadius = 8;
    
    return newButton;
}

-(UIButton *)settingsButton {
    UIButton *settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    UIColor *blue = [[NYEColorsAtom new] positiveBlue];
    [settingsButton setTintColor:blue];
    [settingsButton setTitle:NSLocalizedString(@"Settings", @"Settings") forState:UIControlStateNormal];
    [settingsButton setTitleColor:blue forState:UIControlStateNormal];
    return settingsButton;
}

@end
