//
//  MainHeaderCell.swift
//  baemin
//
//  Created by 마경미 on 2022/03/17.
//

import UIKit

class MainHeaderCell: UICollectionViewCell {
    @IBOutlet var tabL: UILabel!
    static let mainHeaderCellId = "mainHeaderCell"

    override var isSelected: Bool {
        didSet {
          if isSelected {
            let backgroundColor: UIColor = UIColor(red: 236/255, green: 230/255, blue: 204/255, alpha: 1)
            contentView.backgroundColor = backgroundColor
            tabL.textColor = .systemBrown
            tabL.font = .systemFont(ofSize: 14, weight: .bold)
          } else {
            contentView.backgroundColor = .white
            tabL.textColor = .systemGray
            tabL.font = .systemFont(ofSize: 14, weight: .regular)
          }
        }
      }
    func setData(with text: String) {
        tabL.text = text
        print(tabL.text)
    }
    override init(frame:CGRect){
        super.init(frame: frame)
        print("왜안대애앵")
        contentView.addSubview(tabL)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
