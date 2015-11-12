//
//  ViewController.swift
//  UICollectionView
//
//  Created by FrankLiu on 15/11/10.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let sourceUrl = "http://www.duitang.com/album/1733789/masn/p/0/100/"

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var collectionView: UICollectionView?
    var dataArray:      [AnyObject]?
    var flowLayout:     LargeUICollectionViewFlowLayout?
    var anotherLayout:  AnotherCollectionViewFlowLayout?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初始化数据源
        dataArray = [AnyObject]()

        flowLayout = LargeUICollectionViewFlowLayout()
        anotherLayout = AnotherCollectionViewFlowLayout()
        
        // 初始化UICollectionView并指定一个UICollectionViewFlowLayout
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: flowLayout!)
        collectionView?.registerClass(ShowCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: identifier)
        collectionView?.dataSource = self
        collectionView?.delegate   = self
        
        view.addSubview(collectionView!)
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) { () -> Void in
            
            // 获取json数据
            let data = NSData(contentsOfURL: NSURL(string: sourceUrl)!)
            
            // 转换数据
            if let dataDic = try? NSJSONSerialization.JSONObjectWithData(data!, options: [.MutableContainers, .MutableLeaves]) as! [String : AnyObject]{
            
                let array = dataDic["data"]!["blogs"] as! [AnyObject]
                
                for value in array {
                
                    let temp = value as! [String : AnyObject]
                    
                    print(temp["isrc"])
                    self.dataArray?.append(temp["isrc"]!)
                    
                }
            }
            
            // 主线程更新
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.collectionView?.reloadData()
                
                let delayInSeconds: Double = 2
                let delayTime: dispatch_time_t = dispatch_time(DISPATCH_TIME_NOW, Int64(UInt64(delayInSeconds) * NSEC_PER_SEC))
                
                dispatch_after(delayTime, dispatch_get_main_queue(), { () -> Void in
                    
                    // 先让一种布局失效
                    self.flowLayout?.invalidateLayout()
                    
                    // 重新设置一种布局
                    self.collectionView?.setCollectionViewLayout(self.anotherLayout!, animated: true)
                    
                })
            })
        }
        
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
        return (self.dataArray?.count)!
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as! ShowCollectionViewCell
        
        cell.showImageView?.sd_setImageWithURL(NSURL(string: self.dataArray![indexPath.row] as! String))
        
        return cell
    }


}

