//
//  ViewController.swift
//  YHHeadScrollView
//
//  Created by SR on 16/4/29.
//  Copyright © 2016年 游辉. All rights reserved.
//

import UIKit
import YHHeadScrollView

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubViews()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK: - =LoadSubViews=
    func loadSubViews(){
        

        self.view.addSubview(tableView!)
        self.tableView?.tableHeaderView = self.tableViewHeadView
       
    }
    
    //MARK: - =Delegate=
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = dataArray![indexPath.row] as? String
        return cell!
    }
    
    
    //MARK: - =Setter/Getter/lazy=
    //tableView
    lazy var tableView:UITableView? = {
        let tableView =  UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.showsVerticalScrollIndicator = false
        tableView.delaysContentTouches = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    //tableView头部视图
    lazy var tableViewHeadView:YHHeadScrollView? =  {
        let tableViewHeadView = YHHeadScrollView.init(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))
        tableViewHeadView.placeImageStr = "placeImageStr"
        tableViewHeadView.timeScrollInterval = 3
        //3,4
         tableViewHeadView.imageUrlStrArr = ["http://pic33.nipic.com/20130928/4420504_005335593000_2.jpg","http://pic.58pic.com/58pic/13/43/94/88258PICeV4_1024.jpg","http://pic26.nipic.com/20130127/9391931_094607395166_2.jpg","http://pic61.nipic.com/file/20150311/20613793_172336144198_2.png","http://pic.58pic.com/10/20/29/99bOOOPIC77.jpg","http://pic15.nipic.com/20110630/6322714_105943746342_2.jpg","http://pic26.nipic.com/20130127/9391931_094607395166_2.jpg"]
        tableViewHeadView.yHHeadScrollViewClosure = {(dataTag) in
            print(dataTag)
        }
        return tableViewHeadView
    }()
    
    //tableView数据(懒加载)
    lazy var dataArray:[AnyObject]? = {
        var array = [AnyObject]()
        for i in 0  ..< 10 {
            array.append(String.init(format: "%i", i) as AnyObject)
        }
        return array;
    }()
    
    
    //MARK: - =Private=
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

