//
//  HeaderTabBar.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/13.
//

import UIKit

class HeaderTabBar: UICollectionReusableView {
    
    static let tabBarHeaderId = "tabBarHeaderId"
    
    let categoryItem = [
        CategoryData(category: "배달 빠른 순"),
        CategoryData(category: "배달팁 낮은 순"),
        CategoryData(category: "기본순"),
        CategoryData(category: "주문 많은 순"),
        CategoryData(category: "별점 높은 순"),
        CategoryData(category: "가까운 순"),
        CategoryData(category: "찜 많은 순"),
        CategoryData(category: "최소주문금액"),
        CategoryData(category: "기타"),
    ]

    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewCompositionalLayout(sectionProvider: {_, _ in
            let size = NSCollectionLayoutSize(widthDimension: .estimated(200), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: size)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets.trailing = 5
            section.interGroupSpacing = 10
            section.orthogonalScrollingBehavior = .continuous
            return section
        })
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        cv.backgroundColor = .systemBackground
        return cv
    }()
    
    override init(frame:CGRect){
        super.init(frame: frame)
        addSubview(collectionView)
        
//        collectionView.backgroundColor = .blue
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(StoreHeaderCell.self, forCellWithReuseIdentifier: StoreHeaderCell.storeHeaderId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}

extension HeaderTabBar: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:StoreHeaderCell.storeHeaderId, for: indexPath) as? StoreHeaderCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .black
        
        cell.data=categoryItem[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryItem.count
    }
}
