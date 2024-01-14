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
        
        let rowIdx = mockChatList[indexPath.row]
        
        cell.oneProfileImage.image =  UIImage(named: rowIdx.chatroomImage[0])
        
        cell.chattingRoomName.text = rowIdx.chatroomName
        
        let lastCount = rowIdx.chatList.count - 1
        
        cell.recentChatLabel.text = rowIdx.chatList[lastCount].message
        
        cell.dateLabel.text = rowIdx.chatList[lastCount].formatted
        
        return cell
    }

}

extension ViewController{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChatDetailViewController") as! ChatDetailViewController
        
        vc.contentId = mockChatList[indexPath.row].chatroomId
        
        navigationController?.pushViewController(vc, animated: true)
        
        vc.contentId = mockChatList[indexPath.row].chatroomId
    }
}

