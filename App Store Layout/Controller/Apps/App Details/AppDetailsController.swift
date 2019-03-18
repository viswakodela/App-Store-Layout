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
    private static let reviewsRowCellID = "reviewsRowCellID"
    
//    var appId: String? {
//        didSet {
//            print(appId ?? "")
//
//        }
//    }
    
    var app: Result?
    var reviews: Reviews?
    fileprivate var appId: String?
    
    //Dependency Injection
    init(appId: String) {
        let layout = UICollectionViewFlowLayout()
        self.appId = appId
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutSetup()
        fetchData()
    }
    
    func fetchData() {
        let urlSting = "https://itunes.apple.com/lookup?id=\(appId ?? "")"
        APIService.shared.fetchGenericJSONFetch(urlString: urlSting) { [weak self] (result: SearchResults?, err) in
            self?.app = result?.results.first
        }
        
        let reviewsUrl = "https://itunes.apple.com/rss/customerreviews/page=1/id=\(appId ?? "")/sortby=mostrecent/json?l=en&cc=us"
        APIService.shared.fetchGenericJSONFetch(urlString: reviewsUrl) { [weak self] (reviews: Reviews?, err) in
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            self?.reviews = reviews
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    func layoutSetup() {
        navigationItem.largeTitleDisplayMode = .never
        collectionView.backgroundColor = .white
        collectionView.register(AppDetailsCell.self, forCellWithReuseIdentifier: AppDetailsController.appDetailSCellID)
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: AppDetailsController.previewCellId)
        collectionView.register(ReviewsRowCell.self, forCellWithReuseIdentifier: AppDetailsController.reviewsRowCellID)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
    }
}

extension AppDetailsController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item == 0 {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsController.appDetailSCellID, for: indexPath) as! AppDetailsCell
            cell.appResult = app
            return cell
        } else if indexPath.item == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsController.previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalPreviewController.appData = self.app
            cell.horizontalPreviewController.collectionView.reloadData()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppDetailsController.reviewsRowCellID, for: indexPath) as! ReviewsRowCell
            if let reviews = self.reviews?.feed.entry {
                cell.reviewsController.reviews = reviews
                cell.reviewsController.collectionView.reloadData()
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item == 0 {
            //Calculate the size of the Cell
            let dummyCell = AppDetailsCell(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: .greatestFiniteMagnitude))
            
            dummyCell.appResult = self.app
            dummyCell.layoutIfNeeded()
            let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: view.frame.width, height: .greatestFiniteMagnitude))
            return CGSize(width: view.frame.width, height: estimatedSize.height)
        } else if indexPath.item == 1 {
            return CGSize(width: view.frame.width, height: 500)
        } else {
            return CGSize(width: view.frame.width, height: 280)
        }
    }
}
