//
//  DetailViewController.h
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NYEPatternData.h"
#import "UIView+atoms.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic, retain) NYEPatternData *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

