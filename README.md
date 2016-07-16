##  TggStarEvaluationView 5星评价视图，你可以随便给出星星评价，指哪打哪。

### 特别简单一个一个星星评价图，5星好评，顺便可以调整下星星的间距！
### 使用方法:
## 1.自己看Demo
## 2.0.import "TggStarEvaluationView"
## 2.1.复制下面的代码
    // 注意weakSelf
    __weak __typeof(self)weakSelf = self;
    // 初始化
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithChooseStarBlock:^(NSUInteger count) {
        // 做评星后点处理
        [weakSelf something];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,280,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];
    // 设置星星点间隙，默认不设0.5 ，范围为0 ～ 1
    //self.tggStarEvaView.spacing = 0.1;

## 效果gif如下，请等待加载👇👇👇
![image](https://raw.githubusercontent.com/BigBagFind/TggStarEvaluationViewDemo/master/ScreenShots/tggStarEvaMovie.gif)


    
