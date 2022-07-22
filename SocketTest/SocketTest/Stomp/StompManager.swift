//
//  StompManager.swift
//  SocketTest
//
//  Created by 마경미 on 2022/05/20.
//

import StompClientLib

class StompManager {
//    static let shared:StompManager = StompManager()
    private var socketClient = StompClientLib()
    private let url = URL(string: "ws://15.164.169.48:4000/ws")!
    private var roomId: Int = 0
    
    // connection
    func registerSocket() {
        socketClient.openSocketWithURLRequest(
            request: NSURLRequest(url: url),
            delegate: self
        )
    }
    
    // subscribe
    func subscribeForMember(memberId: Int) {
        socketClient.subscribe(destination: "/sub/member/\(memberId)")
    }
    
    func subscribeForRoom() {
        socketClient.subscribe(destination: "/sub/chat/\(roomId)")
    }
    
    // public message
    func sendMessage(type: String, senderId: CLong) {
        let payloadObject : [String : Any] = [ "type" : type , "senderId" : senderId]

        socketClient.sendJSONForDict(
            dict: payloadObject as AnyObject,
            toDestination: "/pub/ready/\(roomId)")
    }
    
    func setRoomId(id: Int) {
        self.roomId = id
    }
    
    func disconnect() {
        socketClient.disconnect()
    }
}

extension StompManager : StompClientLibDelegate {
    func stompClient(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: AnyObject?, akaStringBody stringBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
//        print("Destination : \(destination)")
//        print("JSON Body : \(String(describing: jsonBody))")
//        print("String Body : \(stringBody ?? "nil")")
        
        let string = stringBody ?? "nil"
        var dicData: Dictionary<String, Any> = [String: Any]()
        do {
            dicData = try JSONSerialization.jsonObject(with: Data(string.utf8), options: []) as! [String: Any]
        } catch {
            print(error.localizedDescription)
        }
        
        if dicData["type"] as! String != "ERROR" {
            subscribeForRoom()
        }
        
    }
    
    func stompClientJSONBody(client: StompClientLib!, didReceiveMessageWithJSONBody jsonBody: String?, withHeader header: [String : String]?, withDestination destination: String) {
        print("DESTINATION : \(destination)")
        print("String JSON BODY : \(String(describing: jsonBody))")
    }
    
    // Unsubscribe Topic
    func stompClientDidDisconnect(client: StompClientLib!) {
        print("Socket is Disconnected")
    }
    
    // Subscribe Topic after Connection
    func stompClientDidConnect(client: StompClientLib!) {
        print("Socket is connected")
    }
    
    // Error - disconnect and reconnect socket
    func serverDidSendError(client: StompClientLib!, withErrorMessage description: String, detailedErrorMessage message: String?) {
        print("Error Send : \(String(describing: message))")
        disconnect()
    }
    
    func serverDidSendPing() {
        print("Server ping")
    }
    
    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) {
      print("Receipt : \(receiptId)")
    }
}

