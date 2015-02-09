//
//  PGCardNavigationController.h
//  Card Navigation
//
//  Created by Henry on 2/9/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PGCardNavigationController;

@protocol PGCardNavigationControllerDataSource <NSObject>
- (UIViewController *)cardNavigationController:(PGCardNavigationController *)cardNavigationController viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath;
- (NSInteger)numberOfViewControllersInCardNavigationController:(PGCardNavigationController *)cardNavigationController;
@end

@interface PGCardNavigationController : UIViewController
@property (nonatomic,weak) id<PGCardNavigationControllerDataSource> dataSource;
@end
