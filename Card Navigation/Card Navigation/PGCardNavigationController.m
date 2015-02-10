//
//  PGCardNavigationController.m
//  Card Navigation
//
//  Created by Henry on 2/9/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import "PGCardNavigationController.h"
#import "UIView+Utility.h"

@interface PGCardNavigationController()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *hScrollView;
@end

@implementation PGCardNavigationController

- (UIScrollView*)hScrollView{
    if(!_hScrollView) {
        _hScrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
        _hScrollView.delegate = self;
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
}

- (void)setup {
    // debug
    [self.view addSubview:self.hScrollView];
    self.hScrollView.backgroundColor = [UIColor orangeColor];
    self.hScrollView.pagingEnabled = YES;
}

- (void)layoutContent {
    self.hScrollView.frame = self.view.bounds;
    NSUInteger numberOfViewControllers = [self.dataSource numberOfViewControllersInCardNavigationController:self];
    if (self.dataSource && numberOfViewControllers > 0){
        self.hScrollView.contentSize = CGSizeMake(self.view.bounds.size.width * numberOfViewControllers, self.view.bounds.size.height);
    } else {
        self.hScrollView.contentSize = self.view.bounds.size;
    }
    
    for ( NSUInteger i = 0 ; i < [self.dataSource numberOfViewControllersInCardNavigationController:self] ; i++) {
        UIViewController *viewController = [self.dataSource cardNavigationController:self viewControllerForRowAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        [self.hScrollView addSubview:viewController.view];
        viewController.view.autoresizingMask = UIViewAutoresizingNone;
        viewController.view.frame = CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self layoutContent];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x >= 0  && scrollView == self.hScrollView ) {
        NSUInteger moveFromIndex = floor(scrollView.contentOffset.x / self.hScrollView.frame.size.width);
        NSUInteger moveToIndex = ceil(scrollView.contentOffset.x / self.hScrollView.frame.size.width);
        if (moveFromIndex != moveToIndex && moveToIndex < [self.dataSource numberOfViewControllersInCardNavigationController:self]){
            UIView *moveFromView = [self.dataSource cardNavigationController:self viewControllerForRowAtIndexPath:[NSIndexPath indexPathForItem:moveFromIndex inSection:0]].view;
            moveFromView.left = scrollView.width * moveFromIndex + (scrollView.contentOffset.x - scrollView.width * moveFromIndex) * 0.8;
        } else if (((NSInteger)scrollView.contentOffset.x % (NSInteger)scrollView.width) == 0) {
            UIView *moveFromView = [self.dataSource cardNavigationController:self viewControllerForRowAtIndexPath:[NSIndexPath indexPathForItem:moveFromIndex inSection:0]].view;
            moveFromView.left = scrollView.width * moveFromIndex;
        }
    }
}
@end
