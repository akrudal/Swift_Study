//
//  RoomController.swift
//  SocketTest
//
//  Created by 마경미 on 2022/07/11.
//

import UIKit
import StompClientLib

class RoomController: UIViewController {
    
    @IBOutlet var roomNameLabel: UILabel!
    @IBOutlet var memberStack: UIStackView!
    @IBOutlet var joinButton: UIButton!
    @IBOutlet var startButton: UIButton!
    let stompManager: StompManager = StompManager()
    var roomId: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        searchRoomDetail()
        stompManager.setRoomId(id: roomId)
        stompManager.registerSocket()
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
        
        memberStack.removeAllArrangedSubview()
        for value in data.roomMembers {
            let label = UILabel()
            label.text = value.name
            memberStack.addArrangedSubview(label)
        }
    }
    
    func isJoin(members: [User]) -> Bool {
        for user in members {
            if user.memberId == UserDefaults.standard.integer(forKey: "memberId") {
                return true
            }
        }
        return false
    }
    
    func searchRoomDetail() {
        let request: RoomDetailRequest = RoomDetailRequest(accessToken: UserDefaults.standard.string(forKey: "accessToken")!, roomId: roomId)
        let repository: RoomRepository = RoomRepository()
        
        repository.inquiryRoomDetail(request: request) { [self] result in
            switch result {
            case .success(let response):
                print(response)
                self.setData(data: response)
                if self.isJoin(members: response.roomMembers) {
                    self.joinButton.isHidden = true
                    self.startButton.isHidden = false
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    @IBAction func clickJoin(_ sender: Any) {
        let request: JoinRoomRequest = JoinRoomRequest(accessToken: UserDefaults.standard.string(forKey: "accessToken")!, roomId: roomId)
        let repository: RoomRepository = RoomRepository()
        
        repository.inquiryJoinRoom(request: request) { result in
            switch result {
            case.success(let response):
                print(response)
                self.searchRoomDetail()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func clickStart(_ sender: Any) {
        let type: String = "READY"
        let senderId: CLong = UserDefaults.standard.integer(forKey: "memberId")
        stompManager.subscribeForMember(memberId: senderId)
        stompManager.sendMessage(type: type, senderId: senderId)
        
        let storyboard = UIStoryboard(name: "Ready", bundle: nil)
                let viewController = storyboard.instantiateViewController(withIdentifier: "ready")
                viewController.modalPresentationStyle = .overFullScreen
                self.present(viewController, animated: true)
    }
}

extension UIStackView {
    func removeAllArrangedSubview() {
        self.arrangedSubviews.forEach({ child in
            self.removeArrangedSubview(child)
            child.removeFromSuperview()
        })
    }
}
