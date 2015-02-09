//
//  PGDashBoardViewController.m
//  WatchBuddy
//
//  Created by Henry on 2/8/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import "PGDashBoardViewController.h"
#import "UIView+Utility.h"

@interface PGDashBoardViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIScrollView *verticalScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *vImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *vImageView2;
@property (weak, nonatomic) IBOutlet UIView *vView1;
@property (weak, nonatomic) IBOutlet UIView *vView2;

@end

@implementation PGDashBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.contentSize = CGSizeMake(self.view.width * 3, self.view.height);
    self.verticalScrollView.contentSize = CGSizeMake(self.view.width, self.view.height*3);
    self.scrollView.delegate = self;
    self.verticalScrollView.delegate = self;
    self.view1.left = 0;
    self.view2.left = self.view.width;
    self.view3.left = self.view.width*2;
    
    
    self.view1.layer.borderColor = [UIColor blackColor].CGColor;
    self.view1.layer.borderWidth = 6.0;
    self.view2.layer.borderColor = [UIColor blackColor].CGColor;
    self.view2.layer.borderWidth = 6.0;
    self.view3.layer.borderColor = [UIColor blackColor].CGColor;
    self.view3.layer.borderWidth = 6.0;
    
    self.view1.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.view1.layer.shadowOffset = CGSizeMake(-10,10);
    self.view1.layer.shadowOpacity = 0.5;
    
    self.view2.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.view2.layer.shadowOffset = CGSizeMake(-10,10);
    self.view2.layer.shadowOpacity = 0.5;
    
    self.view3.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.view3.layer.shadowOffset = CGSizeMake(-10,10);
    self.view3 .layer.shadowOpacity = 0.5;
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        if (scrollView.contentOffset.x <= self.view.width){
            self.view1.left = scrollView.contentOffset.x * 0.8;
            self.view2.left = self.view.width;
        } else if (scrollView.contentOffset.x <= self.view.width*2){
            self.view1.left = 0;
            self.view2.left = self.view.width + (scrollView.contentOffset.x - self.view.width ) * 0.8;
        }
    } else if (scrollView == self.verticalScrollView){
        if (scrollView.contentOffset.y <= self.view.height){
            self.vView1.top = scrollView.contentOffset.y * 0.8;
            self.vView2.top = self.view.height;
        } else if (scrollView.contentOffset.x <= self.view.width*2){
            self.vView1.top = 0;
            self.vView2.top = self.view.height + (scrollView.contentOffset.y - self.view.height ) * 0.8;
        }
        
    }
}

@end
