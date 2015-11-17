//
//  MasterViewController.m
//  patterns
//
//  Created by John Nye on 17/11/2015.
//  Copyright © 2015 John Nye. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NYEPatternData.h"
#import "UIView+atoms.h"

#import <objc/runtime.h>
#import <dlfcn.h>
#import <mach-o/ldsyms.h>

@interface MasterViewController ()

@property NSMutableArray *objects;
@property NSMutableArray *atoms;
@property NSMutableArray *molecules;
@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (!self.objects){
        self.objects = [[NSMutableArray alloc] init];
    }
    [self classNames];
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
    self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
    [super viewWillAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NYEPatternData *object = self.objects[indexPath.row];
    cell.textLabel.text = object.methodName;
    cell.textLabel.textAlignment = NSTextAlignmentRight;
    if ([object.object isKindOfClass:[UIView class]]){
        UIView *sub = (UIView *)object.object;
        [sub newOrigin:CGPointMake(10, 10)];
        [cell addSubview:sub];
    }
    
    if ([object.object isKindOfClass:[UIColor class]]) {
        cell.backgroundColor = (UIColor*)object.object;
    }
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}


/**
 * http://stackoverflow.com/questions/15149505/ios-getting-all-classes-in-a-bundle-or-loaded-app
 */
- (void)classNames {
    
    unsigned int count;
    const char **classes;
    Dl_info info;
    
    dladdr(&_mh_execute_header, &info);
    classes = objc_copyClassNamesForImage(info.dli_fname, &count);
    
    for (int i = 0; i < count; i++) {
        NSLog(@"Class name: %s", classes[i]);
        NSString *className = [NSString stringWithUTF8String:classes[i]];
        
        if([className containsString:@"Atom"]){
            Class class = NSClassFromString(className);
            
            //
            //http://stackoverflow.com/questions/2094702/get-all-methods-of-an-objective-c-class-or-instance
            //
            unsigned int methodCount = 0;
            Method *methods = class_copyMethodList(class, &methodCount);
            
            printf("Found %d methods on '%s'\n", methodCount, class_getName(class));
            
            for (unsigned int i = 0; i < methodCount; i++) {
                Method method = methods[i];
                
                NSString *methodName = [NSString stringWithUTF8String:sel_getName(method_getName(method))];
                
                id obj = [[NSClassFromString(className) alloc] init];
                
                NSObject *objectToDecide = [obj performSelector:NSSelectorFromString(methodName) withObject:nil];
                if ([objectToDecide isKindOfClass:[UIView class]] ||
                    [objectToDecide isKindOfClass:[UIColor class]]) {
                    NYEPatternData *newData = [NYEPatternData new];
                    newData.className = className;
                    //TODO: Turn this into a nice thing with methodSignatureForSelector:
                    newData.methodName = methodName;
                    newData.object = objectToDecide;
                    [self.objects addObject:newData];
                }
            }
        }
    }
}

@end
