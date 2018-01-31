//
//  CGXPickerUIBaseView.m
//  CGXPickerView
//
//  Created by 曹贵鑫 on 2017/8/22.
//  Copyright © 2017年 曹贵鑫. All rights reserved.
//

#import "CGXPickerUIBaseView.h"


@interface CGXPickerUIBaseView ()


@end
@implementation CGXPickerUIBaseView

- (void)initUI {
    self.frame = SCREEN_BOUNDS;
    // 背景遮罩图层
    [self addSubview:self.backgroundView];
    // 弹出视图
    [self addSubview:self.alertView];
    // 设置弹出视图子视图
    // 添加顶部标题栏
    [self.alertView addSubview:self.topView];
    // 添加左边取消按钮
    [self.topView addSubview:self.leftBtn];
    // 添加右边确定按钮
    [self.topView addSubview:self.rightBtn];
    // 添加中间标题按钮
    [self.topView addSubview:self.titleLabel];
    // 添加分割线
    [self.topView addSubview:self.lineView];
}

- (CGXPickerViewManager *)manager
{
    if (!_manager ) {
        _manager = [CGXPickerViewManager new];
    }
    return _manager;
}
#pragma mark - 背景遮罩图层
- (UIView *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc]initWithFrame:SCREEN_BOUNDS];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.20];
        _backgroundView.userInteractionEnabled = YES;
        UITapGestureRecognizer *myTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(didTapBackgroundView:)];
        [_backgroundView addGestureRecognizer:myTap];
    }
    return _backgroundView;
}

#pragma mark - 弹出视图
- (UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT - self.manager.kTopViewH - self.manager.kPickerViewH, SCREEN_WIDTH, self.manager.kTopViewH + self.manager.kPickerViewH)];
        _alertView.backgroundColor = [UIColor whiteColor];
    }
    return _alertView;
}

#pragma mark - 顶部标题栏视图
- (UIView *)topView {
    if (!_topView) {
        _topView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.manager.kTopViewH + 0.5)];
        _topView.backgroundColor = RGB_HEX(0xFDFDFD, 1.0f);
    }
    return _topView;
}

#pragma mark - 左边取消按钮
- (UIButton *)leftBtn {
    if (!_leftBtn) {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftBtn.frame = CGRectMake(5, 7, 60, self.manager.kTopViewH-14);
        _leftBtn.backgroundColor = self.manager.leftBtnBGColor;
        _leftBtn.layer.cornerRadius = self.manager.leftBtnCornerRadius;;
        _leftBtn.layer.borderColor = self.manager.leftBtnborderColor.CGColor;
        _leftBtn.layer.borderWidth = self.manager.leftBtnBorderWidth;
        _leftBtn.layer.masksToBounds = YES;
        _leftBtn.titleLabel.font = [UIFont systemFontOfSize:self.manager.leftBtnTitleSize];
        [_leftBtn setTitleColor:self.manager.leftBtnTitleColor forState:UIControlStateNormal];
        [_leftBtn setTitle:self.manager.leftBtnTitle forState:UIControlStateNormal];
        [_leftBtn addTarget:self action:@selector(clickLeftBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBtn;
}

#pragma mark - 右边确定按钮
- (UIButton *)rightBtn {
    if (!_rightBtn) {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightBtn.frame = CGRectMake(SCREEN_WIDTH - 65, 7, 60, self.manager.kTopViewH-14);
        _rightBtn.backgroundColor = self.manager.rightBtnBGColor;;
        _rightBtn.layer.cornerRadius = self.manager.rightBtnCornerRadius;
        _rightBtn.layer.masksToBounds = YES;
        _rightBtn.layer.borderWidth = self.manager.rightBtnBorderWidth;
        _rightBtn.layer.borderColor = self.manager.rightBtnborderColor.CGColor;
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:self.manager.rightBtnTitleSize];
        [_rightBtn setTitleColor:self.manager.rightBtnTitleColor forState:UIControlStateNormal];
        [_rightBtn setTitle:self.manager.rightBtnTitle forState:UIControlStateNormal];
        [_rightBtn addTarget:self action:@selector(clickRightBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}

#pragma mark - 中间标题按钮
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(65, 0, SCREEN_WIDTH - 130, self.manager.kTopViewH)];
        _titleLabel.backgroundColor = self.manager.titleLabelBGColor;
        _titleLabel.font = [UIFont systemFontOfSize:self.manager.titleSize];
        _titleLabel.textColor = self.manager.titleLabelColor;
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

#pragma mark - 分割线
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.manager.kTopViewH, SCREEN_WIDTH, 0.5)];
        _lineView.backgroundColor  = self.manager.lineViewColor;
        [self.alertView addSubview:_lineView];
    }
    return _lineView;
}

#pragma mark - 点击背景遮罩图层事件
- (void)didTapBackgroundView:(UITapGestureRecognizer *)sender {
    
}

#pragma mark - 取消按钮的点击事件
- (void)clickLeftBtn {
    
}

#pragma mark - 确定按钮的点击事件
- (void)clickRightBtn {
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
