//
//  ChatViewController.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    private var client: ChatClient = ChatClient()
    private var messages: [Message] = []
    private var tableViewIdentifier = "ChatTableViewCell"

    // MARK: - Outlets
    @IBOutlet weak var chatTable: UITableView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
    }
    
    // MARK: - Supporting Methods
    private func prepareView() {
        title = "Chat"
        setupBackgroundImage(with: nil)
        configureTable(tableView: chatTable)
        getMessages()
    }
    
    private func getMessages() {
        self.view.startActivityIndicator()
        client.fetchChatData(completion: {[weak self] result in
            switch result {
            case .success(let chat):
                self?.messages = chat.message
                DispatchQueue.main.async {[weak self] in
                    self?.view.stopActivityIndicator()
                    self?.chatTable.reloadData()
                }
            case .failure(let error):
                self?.createAlert(title: error.localizedDescription)
            }
        })
    }
    
    // MARK: - Private
    private func configureTable(tableView: UITableView) {
        tableView.delegate = self
        tableView.dataSource = self
        chatTable.rowHeight = UITableView.automaticDimension
        chatTable.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: tableViewIdentifier, bundle: nil), forCellReuseIdentifier: tableViewIdentifier)
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.backgroundColor = .baseViewBackgroundColor
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewIdentifier) as? ChatTableViewCell else { return UITableViewCell() }
        cell.setCellData(message: messages[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
