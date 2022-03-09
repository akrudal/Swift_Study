//
//  StoreCategoryCell.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/09.
//

import UIKit

struct CategoryData {
    var category:String
}

class StoreCategoryCell: UICollectionViewCell {
    var data:CategoryData?{
        didSet{
            guard let data = data else { return }
            categoryT.text=data.category
            categoryT.sizeToFit()
//            let newSize = categoryT.sizeThatFits( CGSize(width: categoryT.frame.width, height: CGFloat.greatestFiniteMagnitude))
//             categoryT.frame.size.width = newSize.width
//             categoryT.frame.size.height = newSize.height
        }
    }
    
    let categoryT:UILabel = {
        let textView=UILabel()
        textView.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        contentView.addSubview(categoryT)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
}
