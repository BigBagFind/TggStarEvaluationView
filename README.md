##  TggStarEvaluationView 5星评价视图，你可以随便给出星星评价，指哪打哪。

### 特别简单一个一个星星评价图，5星好评，顺便可以调整下星星的间距！
### 使用方法:
## 1.import "TggStarEvaluationView"
## 2.复制下面的代码
    // 注意weakSelf
    __weak __typeof(self)weakSelf = self;
    // 初始化
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithEvaluateViewDidChooseStarBlock:^(NSUInteger count) {
        NSLog(@"\n\n给了铁哥哥：%ld星好评！！!\n\n",count);
        // 在这里作出点评后的处理，count为星星数量
        weakSelf.resultLabel.text = [NSString stringWithFormat:@"给了铁哥哥%ld个星星的好评！！！",count];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,280,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];
     // 这个用来调整星星之间的间距,默认0.5,范围为0～1
    //self.tggStarEvaView.spacing = 0.1;

## 效果gif如下，请等待加载👇👇👇
![image](https://raw.githubusercontent.com/BigBagFind/TggStarEvaluationViewDemo/master/ScreenShots/tggStarEvaMovie.gif)


    
