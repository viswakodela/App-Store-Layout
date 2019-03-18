//
//  TodayMutlipleAppsController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/17/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class TodayMultipleAppsController: UICollectionViewController {
    
    private static let multipleControllerCellID = "multipleControllerCellID"
    var spacing: CGFloat = 16
    
    
    let mode: Mode
    
    enum Mode {
        case small, fullScreen
    }
    
    init(mode: Mode) {
        self.mode = mode
        let layout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: layout)
    }
    
    var feedResults = [FeedResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        
        if mode == .fullScreen {
            setCloseButton()
        } else {
            collectionView.isScrollEnabled = false
        }
    }
    
    override var prefersStatusBarHidden: Bool {return true}
    
    func collectionViewSetup() {
        collectionView.backgroundColor = .white
        collectionView.register(MultipleAppCell.self, forCellWithReuseIdentifier: TodayMultipleAppsController.multipleControllerCellID)
    }
    
    func setCloseButton() {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(#imageLiteral(resourceName: "close_button"), for: .normal)
        button.tintColor = .darkGray
        button.addTarget(self, action: #selector(handleCloseButton), for: .touchUpInside)
        
        view.addSubview(button)
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: 12).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func handleCloseButton() {
        dismiss(animated: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TodayMultipleAppsController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if mode == .fullScreen {
            return feedResults.count
        }
        return min(4, feedResults.count)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayMultipleAppsController.multipleControllerCellID, for: indexPath) as! MultipleAppCell
        let result = feedResults[indexPath.item]
        cell.appResults = result
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if mode == .fullScreen {
            return UIEdgeInsets(top: 48, left: 24, bottom: 12, right: 24)
        }
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height: CGFloat = 68
        
        if mode == .fullScreen {
            return CGSize(width: view.frame.width - 48, height: height)
        } else {
            return CGSize(width: view.frame.width, height: ((view.frame.height) - 3 * spacing) / 4)
        }
    }
}
