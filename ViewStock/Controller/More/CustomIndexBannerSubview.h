//
//  CustomIndexBannerSubview.h
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomIndexBannerSubview : UIView

@property (nonatomic, strong) UIImageView *mainImageView;

@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, strong)UILabel *nameLabel;

@property (nonatomic, copy) void (^didSelectCellBlock)(NSInteger tag, CustomIndexBannerSubview *cell);

- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds;

@end

NS_ASSUME_NONNULL_END
