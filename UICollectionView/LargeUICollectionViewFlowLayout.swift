//
//  LargeUICollectionViewFlowLayout.swift
//  UICollectionView
//
//  Created by FrankLiu on 15/11/10.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

class LargeUICollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override init() {
        
        super.init()
        
        // 单元格尺寸
        self.itemSize                = CGSize(width: 70, height: 70)
        // section 内间距
        self.sectionInset            = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        // 横排单元格最小间距
        self.minimumInteritemSpacing = 40
        // 单元格最小行间距
        self.minimumLineSpacing      = 5
        // CollectionView滚动方向
        self.scrollDirection         = .Vertical
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

