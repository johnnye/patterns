//
//  NYELabelAtom.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "NYELabelAtom.h"

@implementation NYELabelAtom

-(UILabel *)plainLableWithTitle:(NSString *)title {
    if (!title) {
        title = @"plain label";
    }
    UIFont * customFont = [UIFont fontWithName:@"Zapfino" size:12]; //custom font
    
    CGSize maximumLabelSize = CGSizeMake(310, 40);
    CGRect textRect = [title boundingRectWithSize:maximumLabelSize
                                             options:(NSStringDrawingUsesFontLeading)
                                          attributes:@{NSFontAttributeName: customFont}
                                             context:nil];
        
        UILabel *fromLabel = [[UILabel alloc]initWithFrame:CGRectMake(91, 15, textRect.size.width, textRect.size.height)];
        fromLabel.text = title;
        fromLabel.font = customFont;
        fromLabel.numberOfLines = 1;
        fromLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines; // or UIBaselineAdjustmentAlignCenters, or UIBaselineAdjustmentNone
        fromLabel.adjustsFontSizeToFitWidth = YES;
        fromLabel.minimumScaleFactor = 10.0f/12.0f;
        fromLabel.clipsToBounds = YES;
        fromLabel.backgroundColor = [UIColor clearColor];
        fromLabel.textColor = [UIColor blackColor];
        fromLabel.textAlignment = NSTextAlignmentLeft;
    
    return fromLabel;

}

@end
