//
//  ChattingTableViewCell.swift
//  travel_chatting
//
//  Created by Sammy Jung on 2024/01/14.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {
    static let identifier: String = "ChattingTableViewCell"
    
    @IBOutlet var oneProfileImage: UIImageView!
    
    @IBOutlet var groupProfileView: UIView!
    @IBOutlet var chattingRoomName: UILabel!
    
    @IBOutlet var recentChatLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        chattingRoomName.font = .systemFont(ofSize: 16)
        chattingRoomName.font = .boldSystemFont(ofSize: 12)
        
        recentChatLabel.numberOfLines = 0
        recentChatLabel.font = .systemFont(ofSize: 12)
        recentChatLabel.textColor = .gray
        
        dateLabel.font = .systemFont(ofSize: 11)
        dateLabel.textColor = .gray
//        backgroundColor = .clear
        
//        oneProfileImage.contentMode = .scaleAspectFill
        oneProfileImage.contentMode = .scaleAspectFit
        oneProfileImage.backgroundColor = .white
        groupProfileView.backgroundColor = .clear
    }

    override func draw(_ rect: CGRect) {
        oneProfileImage.layer.cornerRadius = oneProfileImage.layer.frame.width / 2
        oneProfileImage.clipsToBounds =  true
    }
    
}
