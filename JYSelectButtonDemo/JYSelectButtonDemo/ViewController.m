//
//  ViewController.m
//  JYSelectButtonDemo
//
//  Created by  李辉 on 15/7/13.
//  Copyright (c) 2015年 lh. All rights reserved.
//

#import "ViewController.h"
#import "JYSelectButton.h"


#define JYUnvMagin 1.0

@interface ViewController ()

/** 充值客户端整体 */
@property (nonatomic, strong)  UIView *payClientView;

/** 客户端按钮 */
@property (nonatomic, strong)  UIButton *clintBtn;

/** 客户端按钮数组 */
@property (nonatomic, strong) NSMutableArray *clintBtnArr;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    
    /** 设置内部控件 */
    [self setupView];
    
    

}


/** 设置内部控件 */
- (void)setupView
{
    self.view.backgroundColor = JYUnvColor_Hex_f1f0eb;// 乳白色;
    
    /** 充值客户端整体 */
    
    NSString *titleAttriStrZFB = @"支付宝支付";
    NSString *titleAttriStrWX = @"微信支付";
    
    NSArray *clintArr;
    NSArray *clintImgArr;
    
    // 支付宝
    clintArr = [NSArray arrayWithObjects:titleAttriStrZFB, titleAttriStrWX,titleAttriStrZFB,titleAttriStrWX,nil];
    clintImgArr = [NSArray arrayWithObjects:@"order_zhifubao",@"order_weixin",@"order_zhifubao",@"order_weixin", nil];
    
    // 按钮的高度 和间距
    CGFloat clintBtnH = 44.0;
    CGFloat clintBtnM = JYUnvMagin; //间距

    CGFloat payClientViewH = clintBtnH * clintArr.count + JYUnvMagin * (clintArr.count - 1);
    self.payClientView = [[UIView alloc] initWithFrame:CGRectMake(0, 100,self.view.width, payClientViewH)];
    [self.view addSubview:self.payClientView];
    self.payClientView.backgroundColor = JYUnvColor_White;
    
    // 创建 客户端按钮
    CGFloat clintBtnX = 0;
    CGFloat clintBtnY = 0;
    CGFloat clintBtnW = self.payClientView.width;
    
    // 初始化数组
    self.clintBtnArr = [NSMutableArray array];

    for (NSInteger i = 0; i < clintArr.count; i++) {
        
        JYSelectButton *btn = [[JYSelectButton alloc] initWithFrame:CGRectMake(clintBtnX, clintBtnY + ((clintBtnM + clintBtnH) * i), clintBtnW, clintBtnH)];
        [self.payClientView addSubview:btn];

        // 设置
        NSString *title = clintArr[i];
        [btn setTitle:title forState:UIControlStateNormal];
        NSString *imageStr = clintImgArr[i];
        [btn setImage:[UIImage imageNamed:imageStr] forState:UIControlStateNormal];
        [btn setTitleColor:JYUnvColor_Hex_333333 forState:UIControlStateNormal];
        
        
        // 按钮点击
        [btn addTarget:self action:@selector(clintBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.selected = NO;
        
        if (i == 0) {
            self.clintBtn = btn;
            self.clintBtn.selected = YES;
            
            
        } else {
            btn.selected = NO;
        }
        
        [self.clintBtnArr addObject:btn];
        
        // 添加间隔线
        if (i < (clintArr.count - 1)) {
            UIView *btnMidLine =  [[UIView alloc] initWithFrame:CGRectMake(JYSelectButtonMargin14,((clintBtnM + clintBtnH) * (i+1)) - clintBtnM / 2, self.payClientView.width - JYSelectButtonMargin14, JYUnvMagin_1)];
            btnMidLine.backgroundColor = JYUnvColor_Gray_226;
            [self.payClientView addSubview:btnMidLine];
            
            
        }
    }
    

}




/** 客户端按钮的点击 */
- (void)clintBtnClick:(UIButton *)btn
{
    
    [self.view endEditing:YES];
    
    if (self.clintBtn != btn) {
        if (self.clintBtn) {
            [self.clintBtn setSelected:NO];
        }
        self.clintBtn = btn;
        [self.clintBtn setSelected:YES];
    } else { // 点击自己
        self.clintBtn.selected = !self.clintBtn.isSelected;
    }
    
    NSInteger index = [self.clintBtnArr indexOfObject:self.clintBtn];
    
    if (index == 0) { // 支付宝
        NSLog(@"%s------%zd--%@", __func__, index,btn.titleLabel.text);

    } else if (index == 1) { // 微信
        NSLog(@"%s------%zd--%@", __func__, index,btn.titleLabel.text);

    }

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
