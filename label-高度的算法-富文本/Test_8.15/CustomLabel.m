//
//  CustomLabel.m
//  Test_8.15
//
//  Created by 李涛 on 15/12/15.
//  Copyright © 2015年 敲代码的小毛驴. All rights reserved.
//

#import "CustomLabel.h"

@interface CustomLabel ()
{
    /**
     *  行间距
     */
    CGFloat _lineSpace;
}


@end

@implementation CustomLabel

- (instancetype)initWithFrame:(CGRect)frame lineSpace:(CGFloat)lineSpace{
    if ([super initWithFrame:frame]) {
        _lineSpace = lineSpace;
        [self initUI];
    }
    return self;
}

- (instancetype)init{
    if ([super init]) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    
    if ([super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI{
    
    self.numberOfLines = 0;

}

- (CGFloat)heightofCostomLabel{
    
    CGRect rect = [self.text boundingRectWithSize:self.frame.size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil];
    
    CGFloat height = rect.size.height;
   
    if (_lineSpace) {
        
        NSInteger lineCount = (NSInteger)(height * 1.0 / self.font.pointSize);
        
        if (lineCount > 1) {
            return rect.size.height + (lineCount-1) * _lineSpace;
        }
    }
    
    return rect.size.height;
}

- (void)setNumOfline:(NSInteger)numOfline{
    _numOfline = numOfline;
    
    self.numberOfLines = numOfline;
}

- (void)setText:(NSString *)text{

    if (_lineSpace) {
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
        
        NSMutableParagraphStyle *paragraph = [[NSMutableParagraphStyle alloc] init];
        
        [paragraph setLineSpacing:_lineSpace];
        
        [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraph range:NSMakeRange(0, text.length)];
        
        [self AttributedText:attributeString];
    }
}

- (void)AttributedText:(NSMutableAttributedString *)string{
    self.attributedText = string;
}

@end
