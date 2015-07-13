//
//  JYConst.h
//  JYSelectButtonDemo
//
//  Created by  李辉 on 15/7/13.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#ifndef JYSelectButtonDemo_JYConst_h
#define JYSelectButtonDemo_JYConst_h


#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height

// 常用颜色 可变色
#define JYUnvColor_VarA(r, g, b,a) [UIColor colorWithRed: r/255.0 green: g/255.0 blue:b/255.0 alpha:a/1.0] // RGBA 透明颜色
#define JYUnvColor_Var(r, g, b) (JYUnvColor_VarA(r, g, b,1.0))// RGB 不透明颜色

// 常用颜色 随机色 不透明
#define JYUnvColor_Random (JYUnvColor_Var(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256)))

// 常用颜色 灰色颜色
#define JYUnvColor_VarGrayA(r, a) (JYUnvColor_VarA(r, r, r, a))// 灰色透明颜色
#define JYUnvColor_VarGray(r) (JYUnvColor_VarGrayA(r, 1.0)) // 灰色 透明颜色


// 常用颜色 固定色
#define JYUnvColor_Clear [UIColor clearColor] // 透明色
#define JYUnvColor_White [UIColor whiteColor] // 白色
#define JYUnvColor_Black [UIColor blackColor] // 黑色
#define JYUnvColor_Red [UIColor redColor] // 红色

// 常用颜色 16位色
#define JYUnvColor_Hex_000000 [UIColor colorWithHexString:@"#000000"] // 灰色1
#define JYUnvColor_Hex_333333 [UIColor colorWithHexString:@"#333333"] // 灰色1
#define JYUnvColor_Hex_666666 [UIColor colorWithHexString:@"#666666"] // 灰色1
#define JYUnvColor_Hex_999999 [UIColor colorWithHexString:@"#999999"] // 灰色2
#define JYUnvColor_Hex_dddddd [UIColor colorWithHexString:@"#dddddd"] // 灰色1
#define JYUnvColor_Hex_ffffff [UIColor colorWithHexString:@"#ffffff"] // 白色
#define JYUnvColor_Hex_f1f0eb [UIColor colorWithHexString:@"#f1f0eb"] // 背景乳白色
#define JYUnvColor_Hex_00b459 [UIColor colorWithHexString:@"#00b459"] // 绿色
#define JYUnvColor_Hex_ff5951 [UIColor colorWithHexString:@"#ff5951"] // 红色
#define JYUnvColor_Gray_226 JYUnvColor_VarGray(226) // 灰白色 分割线


#define JYUnvScale [[UIScreen mainScreen] scale] // 屏幕分辨率比例
#define JYUnvZero 0.0
#define JYUnvMagin_1 (1.0 / JYUnvScale) // 线宽
#define JYUnvMagin_2 2.0
#define JYUnvMagin_4 4.0 // layer cornerRadius
#define JYUnvMagin_5 5.0
#define JYUnvMagin_10 10.0 // 上面的间距
#define JYUnvMagin_12 12.0 // leftbuton的坐标
#define JYUnvMagin_14 14.0 // 左边的间距 一般的间距
#define JYUnvMagin_15 15.0 // 左边的间距 一般的间距
#define JYUnvMagin_16 16.0
#define JYUnvMagin_17 17.0
#define JYUnvMagin_20 20.0 // 电池条的高度 或间距
#define JYUnvMagin_22 22.0 // leftbutton的大小
#define JYUnvMagin_25 25.0 // leftbutton的大小
#define JYUnvMagin_30 30.0
#define JYUnvMagin_34 34.0
#define JYUnvMagin_44 44.0 // 导航条的高度
#define JYUnvMagin_49 49.0 // tabbar的高度
#define JYUnvMagin_64 64.0 // 导航条加电池条的高度
#define JYUnvMagin_75 75.0


#endif
