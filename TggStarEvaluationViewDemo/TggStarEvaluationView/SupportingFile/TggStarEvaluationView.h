//
//  TggAppraiseView.h
//  StarAppraiseDemo
//
//  Created by 铁拳科技 on 16/7/15.
//  Copyright © 2016年 铁拳科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TggStarEvaluationView : UIView


/*
 *@pramas  evaluateViewDidChooseStarBlock 点击评价之后回调的星星数量
 */
+ (instancetype)evaluationViewWithEvaluateViewDidChooseStarBlock:(void(^)(NSUInteger count))evaluateViewDidChooseStarBlock;


/*
 *@pramas  spacing 星星之间的间距
 ********  大小为：0～1，超过1则置为1
 ********  spacing = 0.1,则间隙为星星的宽度的0.1倍,默认为0.5(即不设置)
 */
@property (assign ,nonatomic) CGFloat spacing;




@end
