//
//  TodayDetailsControlelr.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/8/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayDetailsController: UITableViewController {
    
    private static let todayDetailsCellID = "todayDetailsCellID"
    private static let todayDetailsHeaderCellID = "todayDetailsHeaderCellID"
    
    var dismissDetailsHandler: (() -> ())?
    var todayItem: TodayItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    func tableViewSetup() {
        view.backgroundColor = .white
        tableView.tableFooterView = UIView()
        tableView.register(TodayDetailsCell.self, forCellReuseIdentifier: TodayDetailsController.todayDetailsCellID)
        tableView.separatorStyle = .none
        tableView.register(TodayDetailsHeaderCell.self, forCellReuseIdentifier: TodayDetailsController.todayDetailsHeaderCellID)
    }
}

extension TodayDetailsController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TodayDetailsController.todayDetailsHeaderCellID, for: indexPath) as! TodayDetailsHeaderCell
            cell.closeButton.addTarget(self, action: #selector(handleDismissDetails), for: .touchUpInside)
            cell.todayCell.imageView.image = self.todayItem?.image
            cell.todayCell.categoryLabel.text = self.todayItem?.category
            cell.todayCell.descriptionLabel.text = self.todayItem?.description
            cell.todayCell.titleLabel.text = self.todayItem?.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TodayDetailsController.todayDetailsCellID, for: indexPath) as! TodayDetailsCell
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 450
        } else {
            return super.tableView(tableView, heightForRowAt: indexPath)
        }
    }
    
    @objc func handleDismissDetails(button: UIButton) {
        button.isHidden = true
        self.dismissDetailsHandler?()
    }
}
