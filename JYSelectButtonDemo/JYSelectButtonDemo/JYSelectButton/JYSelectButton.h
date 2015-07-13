//
//  JYSelectButton.h
//  mingshi
//
//  Created by  李辉 on 15/2/22.
//  Copyright (c) 2015年 绩优堂. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommmonTools/JYConst.h"
#import "CommmonTools/UIColor+JYHex.h"
#import "CommmonTools/UIView+JYExtension.h"
#import "CommmonTools/NSString+JYExtension.h"



#define JYSelectButtonMargin14 14

#define JYUnvFont_14 [UIFont systemFontOfSize:14]

// 按钮的背景颜色
#define JYBtnBgNormalColor JYUnvColor_VarGray(255) // 正常背景颜色 白色颜色
#define JYBtnBgHighlightedColor  JYUnvColor_VarGray(255) // 高亮背景颜色 可以设置成其他值
#define JYBtnBgSelectedColor  JYUnvColor_VarGray(255) // 选中背景 白色颜色

// 按钮的文字颜色
#define JYBtnTitleNormalColor JYUnvColor_Black // 正常字体颜色 黑色颜色
#define JYBtnTitleSelectedColor  JYUnvColor_Var(27, 158, 237) // 选中字体背景  蓝色 颜色
#define JYBtnTitleDisableColor  JYUnvColor_Red // 高亮字体颜色  红色 可以设置成其他值


// 按钮的图片
#define JYBtnImgNormal @"order_item_normal"
#define JYBtnImgSelected @"order_item_select"


@interface JYSelectButton : UIButton

@end
