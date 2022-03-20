//
//  MainView.swift
//  baemin
//
//  Created by 마경미 on 2022/03/16.
//

import UIKit

class MainView: UIViewController {
    let headerId = "headerId"
    @IBOutlet var mainCV: UICollectionView! {
        didSet {
            mainCV.collectionViewLayout = createLayout()
        }
    }
    func createLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .topLeading)
        ]
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MainView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemPink
        if indexPath.item % 2 == 0 {
            cell.backgroundColor = .systemPink
        } else {
            cell.backgroundColor = .systemBlue
        }
        return cell
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                               withReuseIdentifier: MainHeader.mainHeaderId, for: indexPath) as? MainHeader else {
            return UICollectionReusableView()
        }
        return headerView
    }
}
