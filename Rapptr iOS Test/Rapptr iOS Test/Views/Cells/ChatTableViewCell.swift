//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak private var header: UILabel!
    @IBOutlet weak private var body: UILabel!
    @IBOutlet weak private var avatarImageView: UIImageView!
    @IBOutlet weak private var chatBubbleView: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareView()
    }
    
    // MARK: - Supporiting Methods
    private func setupLabels() {
        header.font = .chatHeader
        body.font = .message
    }
    
    private func prepareView() {
        selectionStyle = .none
        avatarImageView.makeRound()
        chatBubbleView.cornerRadius = 8
        chatBubbleView.layer.borderColor = UIColor.chatBubbleLayerColor.cgColor
        chatBubbleView.layer.borderWidth = 1
        setupLabels()
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.name
        body.text = message.message
        avatarImageView.downloadImage(with: message.avatarURL)
    }
}
