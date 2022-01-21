//
//  ViewController.swift
//  Hello
//
//  Created by 마경미 on 2022/01/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBOutlet var uiTitle: UILabel!
    @IBAction func sayHello(_ sender: Any) {
        self.uiTitle.text="Hello, World!"
    }
}

