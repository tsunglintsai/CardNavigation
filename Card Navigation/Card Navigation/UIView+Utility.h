//
//  UIView+Utility.h
//  PyrogustoFoundation
//
//  Created by Henry on 2/4/15.
//  Copyright (c) 2015 Pyrogusto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Utility)
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat x;
@property (nonatomic) CGFloat y;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;
- (UIImage *)takeScreenShotWidth:(CGFloat)width height:(CGFloat)height;
- (UIImage *)takeScreenShot;
@end
