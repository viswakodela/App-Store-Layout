//
//  TodayController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 2/9/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

 class TodayController: UICollectionViewController {
    
    private static let todayCellID = "todayCellID"
    var startingFrame: CGRect?
    var todayDetailsController: TodayDetailsController?
    
    var topConstraint: NSLayoutConstraint?
    var leadingConstraint: NSLayoutConstraint?
    var widthConstraint: NSLayoutConstraint?
    var heightConstraint: NSLayoutConstraint?
    
    var todayItems = [TodayItem.init(title: "LIFE HACK", category: "Utilizing your Time", image: #imageLiteral(resourceName: "garden"), description: "All the tools and apps you need to intelligently organize your life the right way"),
                      TodayItem.init(title: "HOLIDAYS", category: "Travel on Busget", image: #imageLiteral(resourceName: "holiday"), description: "Find out all you need to know on how to travel without packing everything")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        
        navigationController?.isNavigationBarHidden = true
        collectionView.backgroundColor = #colorLiteral(red: 0.8783513904, green: 0.8784809709, blue: 0.8783348203, alpha: 1)
        collectionView.register(TodayCell.self, forCellWithReuseIdentifier: TodayController.todayCellID)
    }
 }
 
 extension TodayController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return todayItems.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TodayController.todayCellID, for: indexPath) as! TodayCell
        let item = todayItems[indexPath.item]
        cell.todayItem = item
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 64
        return CGSize(width: width, height: 450)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 32
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 32, left: 0, bottom: 32, right: 0)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TodayCell
        
        self.todayDetailsController = TodayDetailsController()
        self.todayDetailsController?.todayItem = self.todayItems[indexPath.item]
        
        todayDetailsController?.dismissDetailsHandler = {
            self.handleTodayDetailsViewClose()
        }
        
        let todayDetailsView = todayDetailsController!.view!
        addChild(todayDetailsController!)
//        todayDetailsView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTodayDetailsViewClose)))
        todayDetailsView.layer.cornerRadius = 16
        
        view.addSubview(todayDetailsView)
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else {return}
        self.startingFrame = startingFrame
        
        todayDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        topConstraint = todayDetailsView.topAnchor.constraint(equalTo: view.topAnchor, constant: startingFrame.origin.y)
        leadingConstraint = todayDetailsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: startingFrame.origin.x)
        widthConstraint = todayDetailsView.widthAnchor.constraint(equalToConstant: startingFrame.width)
        heightConstraint = todayDetailsView.heightAnchor.constraint(equalToConstant: startingFrame.height)

        [topConstraint, leadingConstraint, widthConstraint, heightConstraint].forEach({$0?.isActive = true})
        self.view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            self.topConstraint?.constant = 0
            self.leadingConstraint?.constant = 0
            self.widthConstraint?.constant = self.view.frame.width
            self.heightConstraint?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
        }, completion: nil)
        
    }
    
    @objc func handleTodayDetailsViewClose() {
        
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
//            self.todayDetailsController?.tableView.scrollToRow(at: [0, 0], at: .top, animated: true)
            self.todayDetailsController?.tableView.contentOffset = .zero
            
            guard let startingFrame = self.startingFrame else {return}
            self.topConstraint?.constant = startingFrame.origin.y
            self.leadingConstraint?.constant = startingFrame.origin.x
            self.widthConstraint?.constant = startingFrame.width
            self.heightConstraint?.constant = startingFrame.height
            
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = .identity
        }) { (_) in
            self.todayDetailsController?.removeFromParent()
            self.todayDetailsController?.view.removeFromSuperview()
        }
    }
 }
