//
//  MainHeader.swift
//  baemin
//
//  Created by 마경미 on 2022/03/17.
//

import UIKit

class MainHeader: UICollectionReusableView {

    static let mainHeaderId = "mainHeader"
    let tabItem = [ "배민1", "배달", "포장", "B마트", "배민스토어", "쇼핑라이브", "선물하기", "전국별미"]
    @IBOutlet var headerCV: UICollectionView! {
        didSet {
            headerCV.collectionViewLayout = createLayout()
            headerCV.delegate = self
            headerCV.dataSource = self
        }
    }
    func createLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension MainHeader: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainHeaderCell.mainHeaderCellId, for: indexPath) as? MainHeaderCell else {
            return UICollectionViewCell()
        }
        cell.setData(with: tabItem[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItem.count
    }
}
