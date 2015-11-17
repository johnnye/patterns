//
//  DetailViewController.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "DetailViewController.h"
#import "NYEButtonAtom.h"
#import <objc/runtime.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }

}


- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [[NYEButtonAtom new] positiveActionWithTitle:@"title"];
    
    [self.view addSubview:button];
    self.view.backgroundColor = [UIColor darkGrayColor];
    [self.view bringSubviewToFront:button];

    self.detailDescriptionLabel.text = NSStringFromSelector(@selector(positiveActionWithTitle:));
    
    // Do any additional setup after loading the view, typically from a nib.
    //[self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
