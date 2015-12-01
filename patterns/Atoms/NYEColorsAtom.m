//
//  NYEColors.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "NYEColorsAtom.h"

@implementation NYEColorsAtom
-(UIColor *)positiveColor {
    return [UIColor greenColor];
}
-(UIColor *)negativeColor {
    return [UIColor redColor];
}
-(UIColor *)neutralColor {
    return [UIColor lightGrayColor];
}

-(UIColor *)positiveBlue {
    return [UIColor colorWithRed:0.25 green:0.53 blue:1 alpha:1];
}


@end
