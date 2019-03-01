//
//  AppDetailsController.swift
//  App Store Layout
//
//  Created by Viswa Kodela on 3/1/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AppDetailsController: UICollectionViewController {
    
    private static let appDetailSCellID = "appDetailSCellID"
    private static let previewCellId = "previewCellId"
    
    var appId: String? {
        didSet {
            
            let urlSting = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
            APIService.shared.fetchGenericJSONFetch(urlString: urlSting) { [weak self] (result: SearchResults?, err) in
                self?.app = result?.results.first
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
    
    var app: Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetup()
    }
    
    func layoutSetup() {
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: AppDetailsController.appDetailSCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: AppDetailsController.previewCellId)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}

extension AppDetailsController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsController.appDetailSCellID, for: indexPath) as! AppDetailsCell
            cell.appResult = app
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsController.previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalPreviewController.appData = self.app
            cell.horizontalPreviewController.collectionView.reloadData()
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0{
            //Calculate the size of the Cell
            let dummyCell = AppDetailsCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: .greatestFiniteMagnitude))
            
            dummyCell.appResult = self.app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: .greatestFiniteMagnitude))
            return CGSize(width: view.frame.width, height: estimatedSize.height)
        } else {
            return CGSize(width: view.frame.width, height: 500)
        }
    }
    
}
