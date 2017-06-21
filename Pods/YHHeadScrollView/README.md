# YHHeadScrollView
仿mac网页云音乐的头部滚动视图

Demo
----

The code to make this jpg is in the `ExampleProject/` directory:

<p align="center">
<img src="http://i.imgur.com/xrB0iQZ.gif">
</p>

Installation
------------

The simplest way to use YHHeadScrollView in your application is with [CocoaPods](http://cocoapods.org). See the ["Getting Started" guide for more information](http://guides.cocoapods.org/using/using-cocoapods.html).

#### Podfile

```ruby
source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!
pod "YHHeadScrollView", "~> 1.0.2"
```

You could instead clone the project and copy the YHHeadScrollView/YHHeadScrollView.{h,swift} files into your project.

Initialization
--------------
Both OC&Swift Tips:

If YHHeadScrollView's superView is scrollView/tableView/collectionView.You must let YHHeadScrollView's superView.delaysContentTouches = false/NO.

####Objective-C
You Must Notice Follow Tips:
- If your project is buid by objective-c ,you must new a file by named "yourobjectName-Bridging-Header.h"
- And then copy the file Path of "yourobjectName-Bridging-Header.h" to your targert's Build Settings  -> Objective-C Bridging Header 
- At last add "#import "yourobjectName-Swift.h"" into the file of you use, and you can init like the follow code 

``` objc
- (void)viewDidLoad{
    [super viewDidLoad];
    ...
    YHHeadScrollView *topImgView = [[YHHeadScrollView alloc]init];
    topImgView.imageUrlStrArr = @[@"http://pic33.nipic.com/20130928/4420504_005335593000_2.jpg",@"http://pic.58pic.com/58pic/13/43/94/88258PICeV4_1024.jpg",@"http://pic26.nipic.com/20130127/9391931_094607395166_2.jpg"];
    topImgView.placeImageStr = @"placeImageStr"
    topImgView.timeScrollInterval = 3
    topImgView.yHHeadScrollViewClosure = ^(NSInteger dataTag){
        //call on the Correspondence's View be touch
    };
    [self.view addSubview:topImgView];
    ...
}
```

####Swift
On The Swift,If you have a tableView, You can do like this
``` swift
func loadSubViews(){
    ...
    self.view.addSubview(tableView!)
    self.tableView?.tableHeaderView = self.tableViewHeadView
    ... 
}

lazy var tableViewHeadView:YHHeadScrollView? =  {
    let tableViewHeadView = YHHeadScrollView.init(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, 150))
    tableViewHeadView.imageUrlStrArr = ["http://pic33.nipic.com/20130928/4420504_005335593000_2.jpg","http://pic.58pic.com/58pic/13/43/94/88258PICeV4_1024.jpg","http://pic26.nipic.com/20130127/9391931_094607395166_2.jpg","http://pic61.nipic.com/file/20150311/20613793_172336144198_2.png","http://pic.58pic.com/10/20/29/99bOOOPIC77.jpg","http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg","http://pic26.nipic.com/20130127/9391931_094607395166_2.jpg"]
    tableViewHeadView.placeImageStr = "placeImageStr"
    tableViewHeadView.timeScrollInterval = 3
    tableViewHeadView.yHHeadScrollViewClosure = {(dataTag) in
        //call on the Correspondence's View be touch
        ...
        print(dataTag)
        ...
    }
    return tableViewHeadView
}()
```

Property
-------

###Requrid
####imageUrlStrArr:

The images urlStrs array.
- If imageUrlStrArr.count = 0,there is a default imageView that can't touch full of view.
- If imageUrlStrArr.count = 1,there is only a imageView full of view that can touch.
- If imageUrlStrArr.count = 2,it will scroll like the demo gif,but a same imageView  will be copyed automatic to imageUrlStrArr to reach 3 counts.
- If imageUrlStrArr.count >=3,it will scroll like the demo gif


####placeImageStr:

You must give a imageName of your bundle, It will be used when the imageUrl if useless

###Optonal
####timeScrollInterval: --defalut:2

Interval of the imageViews Scroll,defalut time is 2 seconds
 
####yHHeadScrollViewClosure(Nsinteger dataTag):

The closure of imageView touchEvent,it retrun dataTag,so you know witch imageView be touched. 

Developer
-------------------
Author:developeryh

Email:developer_yh@163.com

It's so friendly,Right? So if you has everything doubt,Please contact me,and don't forgert star if you like




