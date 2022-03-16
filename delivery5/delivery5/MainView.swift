//
//  MainView.swift
//  delivery5
//
//  Created by 마경미 on 2022/03/14.
//

import UIKit

class MainView: UICollectionViewFlowLayout{
    
    private let mainId = "mainId"
    
    let mainCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero,collectionViewLayout: layout)
        return cv
    }()
    
    func configureCollectionView() {
        mainCollectionView.register(FoodController.self,forCellWithReuseIdentifier: FoodController.delivery1Id)
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    override init() {
        super.init()
        
        scrollDirection = .horizontal
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension MainView : UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FoodController.delivery1Id , for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 100)
    }
    
//    // 위 아래 간격
//      func collectionView(
//          _ collectionView: UICollectionView,
//          layout collectionViewLayout: UICollectionViewLayout,
//          minimumLineSpacingForSectionAt section: Int
//          ) -> CGFloat {
//          return 5
//      }
//
//      // 옆 간격
//      func collectionView(
//        _ collectionView: UICollectionView,
//        layout collectionViewLayout: UICollectionViewLayout,
//        minimumInteritemSpacingForSectionAt section: Int
//        ) -> CGFloat {
//            return 3
//        }

}

