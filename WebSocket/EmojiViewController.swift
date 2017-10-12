//
//  EmojiViewController.swift
//  WebSocket
//
//  Created by saul ulises urias guzmàn on 11/10/17.
//  Copyright © 2017 saul ulises urias guzmàn. All rights reserved.
//

import UIKit
import Starscream

final class EmojiViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    
    //MARK: - Varailabels And Constants
    var username = ""
    var socket = WebSocket(url: URL(string: "ws://localhost:1337/")!, protocols: ["chat"])
    
    //MARK: - View Life
    override func viewDidLoad() {
        super.viewDidLoad()
        socket.delegate = self
        socket.connect()
        
        navigationItem.hidesBackButton = true
    }
    
        deinit {
            socket.disconnect(forceTimeout: 0)
            socket.delegate = nil
    }
    
    @IBAction func sendNewMessage(_ sender: Any) {
        sendMessage("😱")
    }
    
}

// MARK: - FilePrivate
extension EmojiViewController {
    
    fileprivate func sendMessage(_ message: String) {
        socket.write(string: message)
    }
    
    fileprivate func messageReceived(_ message: String, senderName: String) {
        emojiLabel.text = message
        usernameLabel.text = senderName
    }
}

// MARK: - WebSocketDelegate
extension EmojiViewController : WebSocketDelegate {
    func websocketDidConnect(socket: WebSocketClient) {
        socket.write(string: username)
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        performSegue(withIdentifier: "websocketDisconnected", sender: self)
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        guard let data = text.data(using: .utf16),
            let jsonData = try? JSONSerialization.jsonObject(with: data),
            let jsonDict = jsonData as? [String: Any],
            let messageType = jsonDict["type"] as? String else {
                return
        }
        
        if messageType == "message",
            let messageData = jsonDict["data"] as? [String: Any],
            let messageAuthor = messageData["author"] as? String,
            let messageText = messageData["text"] as? String {
            
            messageReceived(messageText, senderName: messageAuthor)
        }
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        
    }
}
