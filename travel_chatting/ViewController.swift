//
//  ViewController.swift
//  travel_chatting
//
//  Created by Sammy Jung on 2024/01/14.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var chattingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableCell()
        
        chattingTableView.rowHeight = 70
        chattingTableView.separatorStyle = .none
        
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func configureTableCell() {
        
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        let xib = UINib(nibName: ChattingTableViewCell.identifier, bundle: nil)
        
        chattingTableView.register(xib, forCellReuseIdentifier: ChattingTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.identifier, for: indexPath) as! ChattingTableViewCell
        
        cell.oneProfileImage.image =  UIImage(named: mockChatList[indexPath.row].chatroomImage[0])
        
        cell.chattingRoomName.text = mockChatList[indexPath.row].chatroomName
        
        let lastCount = mockChatList[indexPath.row].chatList.count - 1
        
        cell.recentChatLabel.text = mockChatList[indexPath.row].chatList[lastCount].message
        
        let date: String = mockChatList[indexPath.row].chatList[lastCount].date
        
        let dateFormartter = DateFormatter()
        dateFormartter.dateFormat = "yyyy-MM-dd HH:mm"
        let convertDate = dateFormartter.date(from: date)
        
        dateFormartter.dateFormat = "yy.MM.dd"
        let resultDate = dateFormartter.string(from: convertDate!)
        
        cell.dateLabel.text = resultDate
        
        return cell
    }
    
    
}

