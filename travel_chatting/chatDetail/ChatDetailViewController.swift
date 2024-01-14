//
//  ChatDetailViewController.swift
//  travel_chatting
//
//  Created by Sammy Jung on 2024/01/14.
//

import UIKit

class ChatDetailViewController: UIViewController {
    
    var contentId: Int = 0
    
    var data: [ChatRoom?] = []
    
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.separatorStyle = .none
        data = mockChatList.filter{
            $0.chatroomId == contentId
        }
        navigationItem.title = data[0]?.chatroomName
        
        detailTableView.dataSource = self
        detailTableView.dataSource = self
        configureCell()
        
    }
    
}

extension ChatDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func configureCell() {
        let xib = UINib(nibName: othersChatTableViewCell.identifier, bundle: nil)
        
        detailTableView.register(xib, forCellReuseIdentifier: othersChatTableViewCell.identifier)
        
        let xib2 = UINib(nibName: myCahtTableViewCell.identifier, bundle: nil)
        
        detailTableView.register(xib2, forCellReuseIdentifier: myCahtTableViewCell.identifier)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedlist = mockChatList.filter{
            $0.chatroomId == contentId
        }
        
//        print(selectedlist[0].chatList.count)
        return selectedlist[0].chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let selectedData = data[0]!.chatList
        
        if selectedData[indexPath.row].user.rawValue != "user" {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: othersChatTableViewCell.identifier, for: indexPath) as! othersChatTableViewCell
            
            cell.chatTextView.text = selectedData[indexPath.row].message
            
            let value = selectedData[indexPath.row].user.rawValue
            
            cell.nameLabel.text = value
            cell.otherProfileImage.image = UIImage(named: value)
            
            cell.dateLabel.text = selectedData[indexPath.row].formattedTime
            
            
            return cell
            
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: myCahtTableViewCell.identifier, for: indexPath) as! myCahtTableViewCell
            
        
            cell.myChatTextView.text = selectedData[indexPath.row].message
            
            cell.myChatDateLabel.text = selectedData[indexPath.row].formattedTime
            
            return cell
        }
        
        
    }
    
    
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 100
    //    }
}

