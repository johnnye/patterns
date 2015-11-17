//
//  NYEButtonAtom.h
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NYEButtonAtom : NSObject

- (UIButton *)positiveActionWithTitle:(NSString *)title;
- (UIButton *)negativeActionWithTitle:(NSString *)title;
- (UIButton *)passiveActionWithTitle:(NSString *)title;
- (UIButton*)disclosureButton;

@end
