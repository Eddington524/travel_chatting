//
//  myCahtTableViewCell.swift
//  travel_chatting
//
//  Created by Sammy Jung on 2024/01/14.
//

import UIKit

class myCahtTableViewCell: UITableViewCell {

    static let identifier:String = "myCahtTableViewCell"
    
    @IBOutlet var myChatDateLabel: UILabel!
    @IBOutlet var myChatTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        myChatTextView.isEditable = false
        
        myChatTextView.layer.borderWidth = 1
        myChatTextView.layer.borderColor = UIColor.gray.cgColor
        myChatTextView.layer.cornerRadius = 10
        
        myChatDateLabel.textColor = .gray
        myChatDateLabel.font = .systemFont(ofSize: 12)
    }

}
