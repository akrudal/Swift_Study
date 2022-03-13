//
//  StoreHeaderCell.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/13.
//

import UIKit

struct CategoryData {
    var category:String
}

class StoreHeaderCell: UICollectionViewCell {
    var data:CategoryData?{
        didSet{
            guard let data = data else { return }
            categoryL.text = data.category
        }
    }
    
    let categoryL:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)

        return label
    }()
    
    override var isSelected: Bool {
      didSet {
        if isSelected {
          let backgroundColor: UIColor = UIColor(red: 236/255, green: 230/255, blue: 204/255, alpha: 1)
          categoryL.backgroundColor = backgroundColor
          categoryL.textColor = .systemBrown
          categoryL.font = .systemFont(ofSize: 14, weight: .bold)
        } else {
          categoryL.backgroundColor = .white
          categoryL.textColor = .systemGray
          categoryL.font = .systemFont(ofSize: 14, weight: .regular)
        }
      }
    }
    
    override init(frame:CGRect){
        super.init(frame:frame)
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 20.0
        contentView.addSubview(categoryL)
    }
    
    required init?(coder aDecoder : NSCoder) {
        super.init(coder : aDecoder)
    }
    
    override func layoutSubviews() {
      super.layoutSubviews()
      makeConstraints()
    }

    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
      super.preferredLayoutAttributesFitting(layoutAttributes)
      layoutIfNeeded()
      let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
      var frame = layoutAttributes.frame
      frame.size.width = ceil(size.width) + 20
      layoutAttributes.frame = frame
      return layoutAttributes
    }
    
    func makeConstraints() {
      categoryL.sizeToFit()
    }
    func configure(with text: String) {
      categoryL.text = text
    }
}


