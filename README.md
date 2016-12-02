####  TggStarEvaluationView 星星评价视图，指哪打哪。(如果对你有一点点的帮助，那就来个Star吧)
####[迅速使用一步上手](http://www.jianshu.com/p/f05a08b6b612)
####[查看代码简单思路和解析](http://www.jianshu.com/p/f05a08b6b612)
####[本篇相关文章](http://www.jianshu.com/p/f05a08b6b612)
##### 功能：
####  1.用于5星手动点击评价
####  2.用于5星评价展示
##### 如何添加到工程
#### 1. 直接把TggStarEvaluationView文件夹拖进去
#### 2. 文件夹里面SupportingFile附带空的星星icon和实心星星icon各一张（如果你自己需要用自己样式的星星，那么拉进来后，名字改成和原来那个一样的就好了）
##### 使用方法:
#### 1.自己看Demo
#### 2.0.import "TggStarEvaluationView"
#### 2.1.复制下面的代码
    // 注意weakSelf
    __weak __typeof(self)weakSelf = self;
    // 初始化
    self.tggStarEvaView = [TggStarEvaluationView evaluationViewWithChooseStarBlock:^(NSUInteger count) {
        // 做评星后点处理
        [weakSelf something];
    }];
    self.tggStarEvaView.frame = (CGRect){self.view.frame.size.width / 2 - 23 * 5,280,23 * 10,45};
    [self.view addSubview:self.tggStarEvaView];

    // 设置展示的星星数量
    // self.tggStarEvaView.starCount = 3;
    
    // 星星之间的间距，默认0.5
    // self.tggStarEvaView.spacing = 0.5;
    
    // 星星的点击事件使能,默认YES
    // self.tggStarEvaView.tapEnabled = NO;

#### 效果gif如下，请等待加载👇👇👇
![image](https://github.com/BigBagFind/TggStarEvaluationViewDemo/raw/master/ScreenShots/starViewAnimation.gif)


    
