//
//  AnotherCollectionViewFlowLayout.swift
//  UICollectionView
//
//  Created by FrankLiu on 15/11/12.
//  Copyright © 2015年 刘大帅. All rights reserved.
//

import UIKit

class AnotherCollectionViewFlowLayout: UICollectionViewFlowLayout {

    override init() {
        
        super.init()
        
        // 单元格尺寸
        self.itemSize                = CGSize(width: 150, height: 200)
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
