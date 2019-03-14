//
//  CustomIndexBannerSubview.m
//  ArtistSky
//
//  Created by NGE on 2019/1/14.
//  Copyright © 2019年 YDF. All rights reserved.
//

#import "CustomIndexBannerSubview.h"

@implementation CustomIndexBannerSubview

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
//         [self addSubview:self.coverView];
//        [self.coverView addSubview:self.mainImageView];
//        [self.coverView addSubview:self.nameLabel];
        [self addSubview:self.mainImageView];
       
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleCellTapAction:)];
        [self addGestureRecognizer:singleTap];
    }
    
    return self;
}

- (void)singleCellTapAction:(UIGestureRecognizer *)gesture {
    if (self.didSelectCellBlock) {
        self.didSelectCellBlock(self.tag, self);
    }
}

- (void)setSubviewsWithSuperViewBounds:(CGRect)superViewBounds {
    
    if (CGRectEqualToRect(self.mainImageView.frame, superViewBounds)) {
        return;
    }
    
   
//    self.coverView.frame = superViewBounds;
    
    self.mainImageView.frame = superViewBounds;
//    self.nameLabel.frame = CGRectMake((superViewBounds.size.width - 80)/2, CGRectGetMaxY(self.mainImageView.frame) + 10, 80, 60);
}

- (UIImageView *)mainImageView {
    
    if (_mainImageView == nil) {
        _mainImageView = [[UIImageView alloc] init];
        _mainImageView.userInteractionEnabled = YES;
        _mainImageView.contentMode =  UIViewContentModeScaleAspectFit;
    }
    return _mainImageView;
}

- (UIView *)coverView {
    if (_coverView == nil) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor colorWithWhite:255/255.0 alpha:1];
        _coverView.layer.masksToBounds = YES;
        _coverView.layer.cornerRadius = 8;
//        _coverView.layer.borderWidth = 1;
        
    }
    return _coverView;
}


- (UILabel *)nameLabel{
    if(!_nameLabel){
        _nameLabel = [[UILabel alloc]init];
//        UIFontDescriptor *attributeFontDescriptor = [UIFontDescriptor fontDescriptorWithFontAttributes:
//                                                     @{UIFontDescriptorFamilyAttribute: @"Marion",
//                                                       UIFontDescriptorNameAttribute:@"Marion-Regular",
//                                                       UIFontDescriptorSizeAttribute: @25.0,
//                                                       UIFontDescriptorMatrixAttribute:[NSValue valueWithCGAffineTransform:CGAffineTransformMakeRotation(M_1_PI*1.5)
//                                                                                        ]}];
//        _nameLabel.font = [UIFont fontWithDescriptor:attributeFontDescriptor size:0.0];
        _nameLabel.textColor = [UIColor colorWithWhite:51/255.0 alpha:1];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _nameLabel;
}
@end
