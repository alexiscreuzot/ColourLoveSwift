//
//  PatternsVC.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import UIKit
import SVProgressHUD

class PatternsVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = "Patterns"
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // We check the database, and proceed to do a web request
        // if the database doesn't return any results
        if (Pattern.allObjects().count == 0) {
            self.requestPatterns()
        }
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
    }
    
    // MARK: - Network
    
    func requestPatterns()
    {
        SVProgressHUD.show()
        Pattern.fetch(self.searchBar.text!) { (result,error) -> Void in
            if(error != nil){
                SVProgressHUD.showErrorWithStatus(error?.localizedDescription)
            }else{
                self.collectionView.reloadData()
                SVProgressHUD.showSuccessWithStatus("Done")
            }
        }
    }
    
    // MARK: - CollectionView Datasource
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(Pattern.allObjects().count);
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let pattern:Pattern = Pattern.allObjects()[UInt(indexPath.row)] as! Pattern
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PatternCell.className(), forIndexPath: indexPath)
        (cell as! PatternCell).setPattern(pattern)
        return cell;
    }
    
    // MARK: - CollectionView layout Delegate
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return PatternCell.size();
    }
   
    // MARK: - SearchBar Delegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.requestPatterns()
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}
