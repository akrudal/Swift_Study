//
//  Delivery1ViewController.swift
//  baemin
//
//  Created by 마경미 on 2022/03/20.
//

import UIKit

class Delivery1View: UIViewController {
    
    @IBOutlet var delivery1CV: UICollectionView! {
        didSet {
            delivery1CV.collectionViewLayout = createLayout()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    let bannerData = [
       CustomData(title: "event1", image: #imageLiteral(resourceName: "banner2")),
       CustomData(title: "event2", image: #imageLiteral(resourceName: "banner8")),
       CustomData(title:"event3", image: #imageLiteral(resourceName: "banner5")),
    ]
    
    let menuData = [
        ImageInfo(name:"1인분",image: #imageLiteral(resourceName: "one")),
        ImageInfo(name:"돈까스,회,일식",image: #imageLiteral(resourceName: "japanese")),
        ImageInfo(name:"중식",image: #imageLiteral(resourceName: "chinese")),
        ImageInfo(name:"치킨",image: #imageLiteral(resourceName: "chicken")),
        ImageInfo(name:"백반,죽,국수",image: #imageLiteral(resourceName: "rice")),
        ImageInfo(name:"맛집랭킹", image: #imageLiteral(resourceName: "rank") ),
        ImageInfo(name:"카페,디저트", image: #imageLiteral(resourceName: "dessert")),
        ImageInfo(name:"분식",image: #imageLiteral(resourceName: "snack")),
        ImageInfo(name:"찜,탕,찌개",image: #imageLiteral(resourceName: "soup")),
        ImageInfo(name:"피자",image: #imageLiteral(resourceName: "pizza")),
        ImageInfo(name:"양식",image: #imageLiteral(resourceName: "italian") ),
        ImageInfo(name:"고기,구이", image: #imageLiteral(resourceName: "meat")),
        ImageInfo(name:"족발,보쌈",image: #imageLiteral(resourceName: "pig")),
        ImageInfo(name:"아시안",image: #imageLiteral(resourceName: "chinese")),
        ImageInfo(name:"버거",image: #imageLiteral(resourceName: "burger")),
    ]
    
    let bestData = [
        BestInfo(image: #imageLiteral(resourceName: "뚜레쥬르"), storeName: "뚜레쥬르", fee: "배달팁 3,000원", time : "29~30분"),
        BestInfo(image: #imageLiteral(resourceName: "이디야"), storeName: "이디야", fee: "배달팁 0원~2,000원", time: "19~19분"),
        BestInfo(image: #imageLiteral(resourceName: "빽다방"), storeName: "빽다방", fee: "배달팁 2,000원~2,900원", time: "20~30분"),
        BestInfo(image: #imageLiteral(resourceName: "BHC치킨"), storeName: "BHC치킨", fee: "배달팁 0원~3,000원", time: "21~31분"),
    ]

    
    
    let storeData = [
        StoreInfo(image1: #imageLiteral(resourceName: "채선당1"), image2: #imageLiteral(resourceName: "채선당2"), image3: #imageLiteral(resourceName: "채선당3"), storeName: "채선당", rate: "4.9", orderFee: "26,000원", distance: "1.2km", fee: "무료"),
        StoreInfo(image1: #imageLiteral(resourceName: "던모스1"), image2: #imageLiteral(resourceName: "던모스2"), image3: #imageLiteral(resourceName: "던모스3"), storeName: "던모스", rate: "5.0", orderFee: "15,000원", distance: "0.5km", fee: "무료"),
        StoreInfo(image1: #imageLiteral(resourceName: "배떡1-1"),image2: #imageLiteral(resourceName: "배떡 2"), image3: #imageLiteral(resourceName: "배떡3-1"), storeName: "배떡 로제떡볶이 공릉점", rate: "4.9", orderFee: "14,000원", distance: "0.3km", fee: "3,000원"),
        StoreInfo(image1: #imageLiteral(resourceName: "서오릉 피자1"), image2: #imageLiteral(resourceName: "서오릉 피자2"), image3: #imageLiteral(resourceName: "서오릉 피자3"), storeName: "서오릉피자 공릉점", rate: "5.0", orderFee: "14,000원", distance: "0.4km", fee: "1,000원"),
    ]
    
    func createLayout() -> UICollectionViewCompositionalLayout{
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                return section
            } else if sectionNumber == 1 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.2), heightDimension: .absolute(80)))
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(300)), subitems: [item])
                //group.contentInsets.leading = 16
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 4
                section.contentInsets.trailing = 4
                
                return section
            } else if sectionNumber == 2 {
                let item = NSCollectionLayoutItem.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.trailing = 8
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.42), heightDimension: .absolute(300)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets.leading = 16
                
                //                section.boundarySupplementaryItems = [
                //                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),elementKind: BestHeader.bestHeaderId,alignment: . topLeading)
                //                ]
                return section
            } else {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                item.contentInsets.leading = 16
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 20
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitems: [item])
                //               pagingheader.pinToVisibleBounds = true
                let section = NSCollectionLayoutSection(group: group)
                //                section.boundarySupplementaryItems = [
                //                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)),elementKind: HeaderTabBar.tabBarHeaderId,alignment: . topLeading)
                //                ]
                return section
            }
        }
    }
}

extension Delivery1View: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 3
        } else if section == 1 {
            return 15
        } else if section == 2 {
            return 4
        } else {
            return 4
        }
    }
    func collectionView(_ collectionView:UICollectionView,cellForItemAt indexPath:IndexPath)->UICollectionViewCell{
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier:BannerCell.bannerCellId,for:indexPath) as! BannerCell
            
            cell.data=self.bannerData[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCell.menuCellId, for: indexPath) as! MenuCell
            
            cell.data=self.menuData[indexPath.row]
            return cell
        } else if indexPath.section == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BestCell.bestCellId, for: indexPath) as! BestCell
            
            cell.data=self.bestData[indexPath.row]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreCell.storeCellId, for: indexPath) as! StoreCell
            
            cell.data=self.storeData[indexPath.row]
            cell.layer.shadowColor = UIColor.black.cgColor
            cell.layer.shadowOpacity = 0.3
            cell.layer.shadowRadius = 5
            return cell
        }
        
//        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//            if indexPath.section == 2{
//                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BheaderId, for: indexPath) as! BestHeader
//
//                return header
//            } else if indexPath.section == 3 {
//                let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SheaderId, for: indexPath) as! HeaderTabBar
//
//                return header
//            } else {
//                let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
//
//                header.backgroundColor = .red
//                return header
//            }
//        }
        
        func numberOfSections(in collectionView: UICollectionView) -> Int {
            4
        }
        
        
    }
}
