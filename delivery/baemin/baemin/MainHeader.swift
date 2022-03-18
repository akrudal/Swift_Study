//
//  MainHeader.swift
//  baemin
//
//  Created by 마경미 on 2022/03/17.
//

import UIKit

class MainHeader: UICollectionReusableView {

    @IBOutlet var headerCV: UICollectionView!
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    
    static let mainHeaderId = "mainHeader"
    let tabItem = [ "배민1", "배달", "포장", "B마트", "배민스토어", "쇼핑라이브", "선물하기", "전국별미"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        headerCV.collectionViewLayout = createLayout()
        addSubview(headerCV)
        print("rorkxdk")
        addSubview(headerCV)
        headerCV.delegate = self
        headerCV.dataSource = self
        headerCV.backgroundColor = .systemMint
        headerCV.register(MainHeaderCell.self, forCellWithReuseIdentifier: MainHeaderCell.mainHeaderCellId)
    }
    required init?(coder: NSCoder) {
        fatalError()
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
        print("안되는거지?")
        cell.backgroundColor = .black
        cell.setData(with: tabItem[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabItem.count
    }
}
