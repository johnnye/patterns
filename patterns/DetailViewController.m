//
//  DetailViewController.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "DetailViewController.h"
#import <objc/runtime.h>

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        NSString *call = [NSString stringWithFormat:@"[%@ %@]", self.detailItem.className, self.detailItem.methodName];
        
        id obj = [[NSClassFromString(self.detailItem.className) alloc] init];
        NSObject *displayObject = [obj performSelector:NSSelectorFromString(self.detailItem.methodName) withObject:nil];
        
        self.detailDescriptionLabel.text = call;
        
        if ([displayObject isKindOfClass:[UIView class]]){
            
            [(UIView *)displayObject newOrigin:CGPointMake(100, 100)];
            
            [self.view addSubview:(UIView *)displayObject];
            [self.view bringSubviewToFront:(UIView *)displayObject];
        }
        
        if ([displayObject isKindOfClass:[UIColor class]]){
            self.view.backgroundColor = (UIColor *)displayObject;
        } else {
            self.view.backgroundColor = [UIColor whiteColor];
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
