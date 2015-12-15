//
//  ViewController.m
//  Test_8.15
//
//  Created by 李涛 on 15/8/15.
//  Copyright (c) 2015年 敲代码的小毛驴. All rights reserved.
//

#import "ViewController.h"
#import "CustomLabel.h"
@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *str = @"sss wwww ee";
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString: str];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:1];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [self convertToInt:str])];

    
//    NSDictionary *attributeStr = @{NSFontAttributeName:[UIFont fontWithName:@"DBLCDTempBlack" size:17]};
    
    [attributedString addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"DBLCDTempBlack" size:17] range:NSMakeRange(0, [self convertToInt:str])];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    label.attributedText = attributedString;
    label.numberOfLines = 0;
    [label sizeToFit];
    [self.view addSubview:label];
    NSLog(@"%f",label.frame.size.height);
    
    UILabel *label1= [[UILabel alloc] initWithFrame:CGRectMake(200, 50, 100, 100)];
    label1.font = [UIFont fontWithName:@"DBLCDTempBlack" size:17];
    label1.numberOfLines = 0;
    label1.text = str;
    [label1 sizeToFit];
    [self.view addSubview:label1];
    NSLog(@"%f",label1.frame.size.height);
    ;
    CGRect reck = [str boundingRectWithSize:CGSizeMake(100, 200) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    NSLog(@"%f",reck.size.height);
    
    
    CustomLabel *label2 = [[CustomLabel alloc] initWithFrame:CGRectMake(50, 200, 100, 1000) lineSpace:3];
    label2.text = str;
    [label2 sizeToFit];
    CGFloat hei = [label2 heightofCostomLabel];
    [self.view addSubview:label2];
    
    
    
    

    
}
/**
 *  根据字符串算出长度
 */
-  (NSInteger)convertToInt:(NSString*)string {
    
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < string.length; i++) {
        
        unichar uc = [string characterAtIndex: i];
        
        asciiLength += isascii(uc) ? 2 : 2;
    }
    NSUInteger unicodeLength = asciiLength / 2 ;
    if(asciiLength % 2) {
        unicodeLength++;
    }
    return unicodeLength;
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
