//
//  ShowCollectionViewCell.swift
//  UICollectionView
//
//  Created by FrankLiu on 15/11/10.
//  Copyright © 2015年 刘大帅. All rights reserved.
//
//  https://github.com/yafoolaw
//  http://www.jianshu.com/users/09e77d340dcf/latest_articles
//

import UIKit

let identifier = "Identifier"

class ShowCollectionViewCell: UICollectionViewCell {
    
    var showImageView: UIImageView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        
        var rect: CGRect = self.bounds
        rect.origin.x    += 3
        rect.origin.y    += 3
        rect.size.width  -= 6
        rect.size.height -= 6
        
        showImageView = UIImageView(frame:rect)
        
        showImageView?.contentMode = .ScaleAspectFill
        
        // 自动布局
        showImageView?.autoresizingMask    = [.FlexibleHeight, .FlexibleWidth]
        showImageView?.layer.masksToBounds = true
        
        
        self.addSubview(showImageView!)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
