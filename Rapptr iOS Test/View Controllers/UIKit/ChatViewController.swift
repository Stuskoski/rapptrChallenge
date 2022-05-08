//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Make the UI look like it does in the mock-up.
     *
     * 2) Using the following endpoint, fetch chat data
     *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
     *
     * 3) Parse the chat data using 'Message' model
     *
     **/
    
    // MARK: - Properties
    private var client: ChatClient?
    private var messages = [Message]()
        
    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Chat"
        
        configureTable(tableView: chatTable)
        loadMessages()
    }
}

// MARK: - Table view
extension ChatViewController {
    
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatTableViewCell", bundle: nil), forCellReuseIdentifier: "ChatTableViewCell")
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: ChatTableViewCell? = nil
        if cell == nil {
            let nibs = Bundle.main.loadNibNamed("ChatTableViewCell", owner: self, options: nil)
            cell = nibs?[0] as? ChatTableViewCell
        }
        cell?.setCellData(message: messages[indexPath.row])
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 145.0
    }
}

// MARK: - Service Calls
extension ChatViewController {
    
    /// Loads messages and displays them in tableview,
    /// will display failure alert if any error is thrown in service
    private func loadMessages() {
        Task.init(priority: .userInitiated) {
            do {
                let messageResponse = try await ChatClient.shareInstance.fetchChatData()
                self.messages = messageResponse.messages
                chatTable.reloadData()
            } catch {
                displayChatMessageFailure(error: error)
            }
        }
    }
}

// MARK: - Alerts
extension ChatViewController {
    
    /// Displays failure alert with server error response or generalized error
    /// - Parameters:
    ///   - error: thrown generalized alert
    func displayChatMessageFailure(error: Error) {
        let alert = UIAlertController(title: "Chat Failure",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
