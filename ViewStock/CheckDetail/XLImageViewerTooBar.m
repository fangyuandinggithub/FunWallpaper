//
//  XLImageViewerTooBar.m
//  XLImageViewerDemo
//
//  Created by MengXianLiang on 2017/4/20.
//  Copyright © 2017年 Apple. All rights reserved.
//

#import "XLImageViewerTooBar.h"

@implementation XLImageViewerTooBar{
    
    UILabel *_pageLabel;
    
    UIButton *_saveButton;
    
    VoidBlock _saveBlock;
    
    UIButton *_previewBtton;
    
     UIButton *_editBtton;

}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self buildUI];
    }
    return self;
}

-(void)buildUI{
    //显示分页的label
    CGFloat viewWidth = 50.0f;
    CGFloat viewHeignt = 28.0f;
    CGFloat viewMargin = (SCREENWIDTH - 150)/4;
    _pageLabel = [[UILabel alloc] initWithFrame:CGRectMake(viewMargin, 0, viewWidth, viewHeignt)];
    _pageLabel.center = CGPointMake(_pageLabel.center.x, viewHeignt/2.0f);
    _pageLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _pageLabel.layer.cornerRadius = 5.0f;
    _pageLabel.layer.masksToBounds = true;
    _pageLabel.textColor = [UIColor whiteColor];
    _pageLabel.font = [UIFont systemFontOfSize:16];
    _pageLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_pageLabel];
    
    //保存按钮
    _saveButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _saveButton.frame = CGRectMake(self.bounds.size.width - viewWidth - viewMargin, 0, 30, viewHeignt);
    _saveButton.center = CGPointMake(_saveButton.center.x, viewHeignt/2.0f);
    _saveButton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _saveButton.layer.cornerRadius = 5.0f;
    _saveButton.layer.masksToBounds = true;
    [_saveButton setBackgroundImage:[UIImage imageNamed:@"saveToAlbumNormal"] forState:UIControlStateNormal];
     [_saveButton setBackgroundImage:[UIImage imageNamed:@"saveToAlbumSelected"] forState:UIControlStateSelected];
//    _saveButton.titleLabel.font = [UIFont systemFontOfSize:16];
//    [_saveButton setTitle:@"保存" forState:UIControlStateNormal];
    [_saveButton addTarget:self action:@selector(saveImageMethod) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_saveButton];
    
    //预览
    _previewBtton = [UIButton buttonWithType:UIButtonTypeCustom];
    _previewBtton.frame = CGRectMake(self.bounds.size.width - 2*viewWidth - 2*viewMargin, 0, 30, viewHeignt);
    _previewBtton.center = CGPointMake(_previewBtton.center.x, viewHeignt/2.0f);
    _previewBtton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
    _previewBtton.layer.cornerRadius = 5.0f;
    _previewBtton.layer.masksToBounds = true;
    [_previewBtton setBackgroundImage:[UIImage imageNamed:@"preview"] forState:UIControlStateNormal];
    [_previewBtton addTarget:self action:@selector(previewBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_previewBtton];
    
    //模糊
//
//    _editBtton = [UIButton buttonWithType:UIButtonTypeCustom];
//    _editBtton.frame = CGRectMake(self.bounds.size.width - 3*viewWidth - 3*viewMargin, 0, 30, 30);
//    _editBtton.center = CGPointMake(_editBtton.center.x, viewHeignt/2.0f);
//    _editBtton.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
//    _editBtton.layer.cornerRadius = 5.0f;
//    _editBtton.layer.masksToBounds = true;
//    [_editBtton setBackgroundImage:[UIImage imageNamed:@"goEdit"] forState:UIControlStateNormal];
//    [_editBtton addTarget:self action:@selector(editBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_editBtton];
    
    
    
    

    self.alpha = 0;
}

- (void)editBtnClick{
    if(self.editViewBlock){
        self.editViewBlock();
    }
    
}
- (void)previewBtnClick{
    
    if(self.preViewBlock){
        self.preViewBlock();
    }
    
}
-(void)saveImageMethod{
    _saveButton.selected = !_saveButton.selected;
    _saveBlock();
}

-(void)addSaveBlock:(VoidBlock)saveBlock{
    _saveBlock = saveBlock;
}

-(void)setText:(NSString *)text{
    _pageLabel.text = text;
}

-(void)show{
    [UIView animateWithDuration:0.35 animations:^{
        self.alpha = 1;
    }];
}

-(void)hide{
    [UIView animateWithDuration:0.35 animations:^{
        self.alpha = 0;
    }];
}

@end
