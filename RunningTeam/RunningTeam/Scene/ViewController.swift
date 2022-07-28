//
//  ViewController.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    let imageNames: [String] = ["karina.jpeg","ningning.jpeg","winter.jpeg","giselle.jpeg"]
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    let runningInfo: [Running] = [
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06")
    ]
    
    @IBOutlet weak var barCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        let alignedFlowLayout = barCollectionView?.collectionViewLayout as? AlignedCollectionViewFlowLayout
        alignedFlowLayout?.verticalAlignment = .bottom
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BarCell.barCellId, for: indexPath) as? BarCell else { return UICollectionViewCell() }
        cell.setImage(with: imageNames[indexPath.row])
        cell.setData(with: runningInfo[indexPath.row])
        cell.layer.cornerRadius = cell.frame.size.width / 2
        cell.layer.shadowColor = UIColor.black.cgColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        let height = collectionView.frame.height
        let itemsPerRow: CGFloat = CGFloat(imageNames.count)
        let widthPadding = sectionInsets.left * (itemsPerRow + 1)
        let cellWidth = (width - widthPadding) / itemsPerRow
        let cellHeight = height
        return CGSize(width: cellWidth, height: cellHeight-200)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}
