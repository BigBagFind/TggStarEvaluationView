//
//  TggAppraiseView.m
//  StarAppraiseDemo
//
//  Created by 铁哥哥 on 16/7/15.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import "TggStarEvaluationView.h"

typedef void(^EvaluateViewDidChooseStar)(NSUInteger count);
@interface TggStarEvaluationView ()

@property (assign ,nonatomic)   NSUInteger index;
@property (copy ,nonatomic)     EvaluateViewDidChooseStar evaluateViewChooseStarBlock;

@end


@implementation TggStarEvaluationView

/**************初始化TggEvaluationView*************/
+ (instancetype)evaluationViewWithChooseStarBlock:(void(^)(NSUInteger count))evaluateViewChoosedStarBlock{
    TggStarEvaluationView *evaluationView = [[TggStarEvaluationView alloc]init];
    evaluationView.backgroundColor = [UIColor clearColor];
    evaluationView.evaluateViewChooseStarBlock = ^(NSUInteger count){
        evaluateViewChoosedStarBlock(count);
    };
    return evaluationView;
}

- (void)setStarCount:(NSUInteger)starCount{
    if (starCount == 0) {
        return;
    }
    if (_starCount != starCount) {
        _starCount = starCount;
        if (starCount > 5) {
            starCount = 5;
        }
        self.index = starCount;
        [self setNeedsDisplay];
        if (self.evaluateViewChooseStarBlock) {
            self.evaluateViewChooseStarBlock(self.index);
        }
    }
}


- (void)setTapEnabled:(BOOL)tapEnabled{
    _tapEnabled = tapEnabled;
    self.userInteractionEnabled = tapEnabled;
}

- (void)setSpacing:(CGFloat)spacing{
    if (_spacing != spacing) {
        _spacing = spacing;
        [self setNeedsDisplay];
    }
}

/**************重写*************/
- (void)drawRect:(CGRect)rect{
    UIImage *norImage = [UIImage imageNamed:@"star_nor"];
    UIImage *selImage = [UIImage imageNamed:@"star_sel"];
    // 图片没间隙自己画
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 默认间隙为星星一半
    CGFloat spacing = self.frame.size.width / 20;
    CGFloat top = 0;
    CGFloat starWidth = spacing * 2;
    if (self.spacing != 0) {
        if (self.spacing > 1) {
            self.spacing = 1;
        }
        starWidth = self.frame.size.width / (self.spacing * 10 + 5);
        spacing = starWidth * self.spacing;
    }
    // 如果高度过高则居中
    if (self.frame.size.height > starWidth) {
        top = (self.frame.size.height - starWidth) / 2;
    }
    // 画图
    for (NSInteger i = 0; i < 5; i ++) {
        UIImage *drawImage;
        if (i < self.index) {
            drawImage = selImage;
        }else{
            drawImage = norImage;
        }
        [self drawImage:context CGImageRef:drawImage.CGImage CGRect:CGRectMake((i == 0)?spacing:2 * i *spacing + spacing + starWidth * i, top, starWidth, starWidth)];
        //NSLog(@"left:%lf\nwidth:%lf",2 * i *spacing + spacing + starWidth * i,starWidth);
    }
    // 瞬间画满,需要图片有间隙
    //CGContextDrawTiledImage(context, CGRectMake(0, 0, 30, 30), image.CGImage);
}

/**************将坐标翻转画图*************/
- (void)drawImage:(CGContextRef)context
       CGImageRef:(CGImageRef)image
           CGRect:(CGRect) rect{
        CGContextSaveGState(context);
    
        CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
        CGContextTranslateCTM(context, 0, rect.size.height);
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
        CGContextDrawImage(context, rect, image);
    
        CGContextRestoreGState(context);
}

/**************捕捉触摸*************/
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    self.index = point.x / (self.frame.size.width / 5) + 1;
    if (self.index == 6) {
        self.index --;
    }
    [self setNeedsDisplay];
    if (self.evaluateViewChooseStarBlock) {
        self.evaluateViewChooseStarBlock(self.index);
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self touchesEnded:touches withEvent:event];
}
















@end
