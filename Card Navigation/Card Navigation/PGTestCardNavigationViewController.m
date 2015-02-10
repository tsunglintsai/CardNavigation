//
//  PGTestCardNavigationViewController.m
//  Card Navigation
//
//  Created by Henry on 2/9/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import "PGTestCardNavigationViewController.h"
#import "PGCardNavigationController.h"

@interface PGTestCardNavigationViewController ()<PGCardNavigationControllerDataSource>
@property (nonatomic,strong) PGCardNavigationController *cardNavigationController;
@property (nonatomic,strong) NSArray *viewControllers;
@end

@implementation PGTestCardNavigationViewController


- (NSArray*)viewControllers{
    if(!_viewControllers){
        
        _viewControllers = @[[[UIViewController alloc]init],[[UIViewController alloc]init],[[UIViewController alloc]init]];
    }
    return _viewControllers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cardNavigationController = [[PGCardNavigationController alloc]init];
    self.cardNavigationController.view.frame = self.view.bounds;
    self.cardNavigationController.dataSource = self;
    [self.view addSubview:self.cardNavigationController.view];
    [self addChildViewController:self.cardNavigationController];
    
    for (UIViewController *controller in self.viewControllers){
        controller.view.frame = self.view.bounds;
        if ([self.viewControllers indexOfObject:controller] == 0){
            controller.view.backgroundColor = [UIColor greenColor];
            UIView *view = [[UIView alloc]initWithFrame:controller.view.frame];
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iron man1"]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.frame = controller.view.frame;
            [view addSubview:imageView];
            view.clipsToBounds = YES;
            [controller.view addSubview:view];
        } else if ([self.viewControllers indexOfObject:controller] == 1){
            controller.view.backgroundColor = [UIColor yellowColor];
            UIView *view = [[UIView alloc]initWithFrame:controller.view.frame];
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iron man2"]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.frame = controller.view.frame;
            [view addSubview:imageView];
            view.clipsToBounds = YES;
            [controller.view addSubview:view];
        } else if ([self.viewControllers indexOfObject:controller] == 2){
            controller.view.backgroundColor = [UIColor blueColor];
            UIView *view = [[UIView alloc]initWithFrame:controller.view.frame];
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"iron man3"]];
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.frame = controller.view.frame;
            [view addSubview:imageView];
            view.clipsToBounds = YES;
            [controller.view addSubview:view];
        }
    }

    
}

#pragma mark - PGCardNavigationControllerDataSource datasource

- (UIViewController *)cardNavigationController:(PGCardNavigationController *)cardNavigationController viewControllerForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self viewControllers][indexPath.item];
}
- (NSInteger)numberOfViewControllersInCardNavigationController:(PGCardNavigationController *)cardNavigationController{
    return [[self viewControllers]count];
}



@end
