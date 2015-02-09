//
//  PGCardNavigationController.m
//  Card Navigation
//
//  Created by Henry on 2/9/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import "PGCardNavigationController.h"

@interface PGCardNavigationController()
@property (nonatomic,strong) UIScrollView *hScrollView;
@end

@implementation PGCardNavigationController

- (UIScrollView*)hScrollView{
    if(!_hScrollView) {
        _hScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    }
    return _hScrollView;
}

- (instancetype)init {
    if (self = [super init]){
        self.view = [[UIView alloc]init];
        [self setup];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setup];
    NSLog(@"test");
}

- (void)setup {
    // debug
    self.hScrollView.backgroundColor = [UIColor orangeColor];
}

- (void)layoutContent {
    self.hScrollView.frame = self.view.bounds;
    NSUInteger numberOfViewControllers = [self.dataSource numberOfViewControllersInCardNavigationController:self];
    if (self.dataSource && numberOfViewControllers > 0){
        self.hScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * numberOfViewControllers, self.view.bounds.size.height);
    } else {
        self.hScrollView.contentSize = self.view.bounds.size;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self layoutContent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


@end
