//
//  JYSelectButton.m
//  mingshi
//
//  Created by  李辉 on 15/2/22.
//  Copyright (c) 2015年 绩优堂. All rights reserved.
//

#import "JYSelectButton.h"




@interface JYSelectButton ()

/** normalColor */
@property (nonatomic, strong) UIColor *normalColor;
/** highlightedColor */
@property (nonatomic, strong) UIColor *highlightedColor;
/** disabledColor */
@property (nonatomic, strong) UIColor *disabledColor;
/** selectedColor */
@property (nonatomic, strong) UIColor *selectedColor;

/** 右边的对号 */
@property (nonatomic, weak) UIImageView *selectIcon;

/** 按钮的状态 */
@property (nonatomic, assign)  NSInteger myBtnState;

@end

@implementation JYSelectButton


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setExclusiveTouch:YES];
        self.backgroundColor = [UIColor whiteColor];
        self.myBtnState = self.state;
        // 设置字体各个状态的的颜色
        [self setTitleColor:JYBtnTitleNormalColor forState:UIControlStateNormal]; // 0
        [self setTitleColor:JYBtnTitleSelectedColor forState:UIControlStateSelected]; // 4
        [self setTitleColor:JYBtnTitleDisableColor forState:UIControlStateDisabled]; // 2
        
        // 高亮的字体颜色 和选中时一样
        [self setTitleColor:[self titleColorForState:UIControlStateSelected] forState:UIControlStateHighlighted]; // 1
        // 状态为5 时, 为高亮颜色
        [self setTitleColor:[self titleColorForState:UIControlStateHighlighted] forState:5]; // 5
        
        // 禁止图片变灰色
        self.adjustsImageWhenHighlighted = NO;
        
        // 右边的对勾
        UIImageView *selectIcon = [[UIImageView alloc] init];
        [self addSubview:selectIcon];
        self.selectIcon = selectIcon;
        self.selectIcon.image = [UIImage imageNamed:JYBtnImgNormal];
        self.selectIcon.contentMode = UIViewContentModeCenter;
        self.selectIcon.hidden = NO;
        self.titleLabel.font = JYUnvFont_14;
        
        // 设置按钮的内容左对齐
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内边距
        UIEdgeInsets btnContentEdgeInsets = self.contentEdgeInsets;
        btnContentEdgeInsets.left = JYSelectButtonMargin14;
        self.contentEdgeInsets = btnContentEdgeInsets;
        
        // 无用代码
        UIEdgeInsets btnTitleEdgeInsets = self.titleEdgeInsets;
        btnTitleEdgeInsets.left = JYSelectButtonMargin14;
        self.titleEdgeInsets = btnTitleEdgeInsets;
        
        // 设置按钮内部的imageView的内容模式为居中
        self.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        self.imageView.clipsToBounds = NO;
        
//        self.imageView.backgroundColor = JYUnvColor_Random;
//        self.titleLabel.backgroundColor = JYUnvColor_Random;
//        self.backgroundColor = JYUnvColor_Random;
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    [self setBackgroundColor:JYBtnBgNormalColor forState:UIControlStateNormal];
    [self setBackgroundColor:JYBtnBgSelectedColor forState:UIControlStateSelected];
    [self setBackgroundColor:JYBtnBgHighlightedColor forState:UIControlStateHighlighted];
    [self setBackgroundColor:JYBtnBgHighlightedColor forState:5];
    
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // self.width > self.height情况下
    
    // 设置对号frame
    CGFloat selectIconW = self.selectIcon.image.size.width;
    CGFloat selectIconH = self.selectIcon.image.size.height;
    if (!(self.height > selectIconH && self.width > selectIconW)) {
        selectIconH = self.height;
        selectIconW = selectIconH;
    }
    CGFloat selectIconX = self.width - selectIconW - JYSelectButtonMargin14;
    CGFloat selectIconY = (self.height - selectIconH) / 2;
    self.selectIcon.frame = CGRectMake(selectIconX, selectIconY, selectIconW, selectIconH);
    // 设置按钮的内边距, 右边有图片了,就不应该有内容了,所以剪掉.
    UIEdgeInsets btnContentEdgeInsets = self.contentEdgeInsets;
    btnContentEdgeInsets.right = self.width - selectIconX;
    self.contentEdgeInsets = btnContentEdgeInsets;
    
    
//    self.imageView.backgroundColor = JYUnvColor_Random;
//    self.titleLabel.backgroundColor = JYUnvColor_Random;
    self.titleLabel.numberOfLines = 2;
}


- (void)setSelected:(BOOL)selected
{
    [super setSelected:selected];
//    self.selectIcon.hidden = !selected;
    if (selected) {
        self.selectIcon.image = [UIImage imageNamed:JYBtnImgSelected];
    } else {
        self.selectIcon.image = [UIImage imageNamed:JYBtnImgNormal];
    }

}

- (void)setHighlighted:(BOOL)highlighted
{
    if (self.myBtnState != self.state) {
        // 如果开始是正常状态, 字体颜色还是正常颜色
        if (self.state == UIControlStateNormal) {
            // 高亮的字体颜色 和选中时一样
            [self setTitleColor:[self titleColorForState:UIControlStateNormal] forState:UIControlStateHighlighted]; // 1
            // 状态为5 时, 为高亮颜色
            [self setTitleColor:[self titleColorForState:UIControlStateHighlighted] forState:5]; // 5

        }
        // 如果开始是高亮状态, 字体颜色还是高亮状态
        if (self.state == UIControlStateSelected) {
            // 高亮的字体颜色 和选中时一样
            [self setTitleColor:[self titleColorForState:UIControlStateSelected] forState:UIControlStateHighlighted]; // 1
            // 状态为5 时, 为高亮颜色
            [self setTitleColor:[self titleColorForState:UIControlStateHighlighted] forState:5]; // 5
        }
        self.myBtnState = self.state;
    }
    
    [super setHighlighted:highlighted];

}




//通过颜色来生成一个纯色图片
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    if (state == UIControlStateNormal) {
        self.normalColor = backgroundColor;
    } else if (state == UIControlStateHighlighted) {
        self.highlightedColor = backgroundColor;
    } else if (state == UIControlStateDisabled) {
        self.disabledColor = backgroundColor;
    } else if (state == UIControlStateSelected) {
        self.selectedColor = backgroundColor;
    }
    CGRect rect = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [backgroundColor CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self setBackgroundImage:img forState:state];
    
}



@end
