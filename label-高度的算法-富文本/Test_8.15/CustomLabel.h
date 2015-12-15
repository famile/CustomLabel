//
//  CustomLabel.h
//  Test_8.15
//
//  Created by 李涛 on 15/12/15.
//  Copyright © 2015年 敲代码的小毛驴. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomLabel : UILabel

@property (nonatomic, assign) NSInteger numOfline;

/**
 *  自定义行间距的label
 *
 *  @param frame     <#frame description#>
 *  @param lineSpace <#lineSpace description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithFrame:(CGRect)frame lineSpace:(CGFloat)lineSpace;

/**
 *  求label的高度
 *
 *  @return 当前label的高度
 */
- (CGFloat)heightofCostomLabel;

@end
