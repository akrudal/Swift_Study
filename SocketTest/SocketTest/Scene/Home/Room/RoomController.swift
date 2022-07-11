//
//  RoomController.swift
//  SocketTest
//
//  Created by 마경미 on 2022/07/11.
//

import UIKit

class RoomController: UIViewController {
    
    @IBOutlet var roomNameLabel: UILabel!
    @IBOutlet var memberStack: UIStackView!
    
    var roomId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        searchRoomDetail()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func setRoomId(id: Int) {
        roomId = id
    }
    
    func setData(data: RoomDetailResponse) {
        roomNameLabel.text = data.roomName
        roomNameLabel.sizeToFit()
        
        for value in data.roomMembers {
            let label = UILabel()
            label.text = value.name
            memberStack.addArrangedSubview(label)
        }
    }
    
    func searchRoomDetail() {
        let request: RoomDetailRequest = RoomDetailRequest(accessToken: UserDefaults.standard.string(forKey: "accessToken")!, roomId: roomId)
        let repository: RoomRepository = RoomRepository()
        
        repository.inquiryRoomDetail(request: request) { result in
            switch result {
            case .success(let response):
                print(response)
                self.setData(data: response)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func clickJoin(_ sender: Any) {
    }
}
