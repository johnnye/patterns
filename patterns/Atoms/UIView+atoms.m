//
//  UIView+atoms.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "UIView+atoms.h"

@implementation UIView (atoms)

-(void)newOrigin:(CGPoint)newOrigin {
    CGRect frame = self.frame;
    frame.origin = newOrigin;
    
    [self setFrame:frame];
}

@end
