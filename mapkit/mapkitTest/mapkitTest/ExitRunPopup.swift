//
//  ExitRunPopup.swift
//  mapkitTest
//
//  Created by 마경미 on 2022/04/29.
//

import UIKit

class ExitRunPopup: UIViewController {
    
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var mainView: UIView!

    override func viewDidLoad() {
        setBorder(temp: [exitButton,cancelButton])
        mainView.layer.cornerRadius = 12
    }
    
    @IBAction func ExitRun(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func clickCancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func setBorder(temp: [AnyObject]) {
        for value in temp {
            value.layer?.cornerRadius = 4.0
            value.layer.borderWidth = 1.0
            value.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.7).cgColor
        }
    }
}
