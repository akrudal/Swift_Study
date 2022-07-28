//
//  ViewController.swift
//  RunningTeam
//
//  Created by 마경미 on 2022/07/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var barStackView: UIStackView!

    let dataCount: Int = 4
    let imageNames: [String] = ["karina.jpeg","ningning.jpeg","winter.jpeg","giselle.jpeg"]
    let runningInfo: [Running] = [
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06"),
        Running(distance: "1.5",pace: "6'66''",time: "03:06")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        makeBars()
    }
    
    @objc func onClick(sender: BarButton!) {
        print(sender.getMyData())
    }
    
    func makeBars() {
        for i in 1...dataCount {
            let button = BarButton()
            button.setButtonImage(with: imageNames[i-1])
            button.setData(with: runningInfo[i-1])
            button.addTarget(self, action: #selector(onClick), for: .touchUpInside)
            barStackView.addArrangedSubview(button)
        }
        barStackView.layoutIfNeeded()
    }
}
