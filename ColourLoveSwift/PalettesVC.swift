//
//  PalettesVC.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import UIKit
import SVProgressHUD

class PalettesVC: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    private var palettes:Array<RLMObject> = []
    
    // MARK: - Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.title = "Palettes"
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        // We check the database, and proceed to do a web request
        // if the database doesn't return any results
        if (self.palettes.count == 0) {
            self.requestPalettes()
        }
    }
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        if(self.tableView.indexPathForSelectedRow != nil){
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
        }
    }
    
    // MARK: - Network
    
    func requestPalettes()
    {
        SVProgressHUD.show()
        Palette.fetch(self.searchBar.text!) { (result,error) -> Void in
            if(error != nil){
                SVProgressHUD.showErrorWithStatus(error?.localizedDescription)
            }else{
                self.palettes = result!
                self.tableView.reloadData()
                SVProgressHUD.showSuccessWithStatus("Done")
            }
        }
    }
    
    // MARK: - TableView Datasource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return Int(self.palettes.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let palette:Palette = self.palettes[indexPath.row] as! Palette
        
        let cell = tableView.dequeueReusableCellWithIdentifier(PaletteCell.className(), forIndexPath: indexPath)
        (cell as! PaletteCell).setPalette(palette)
        return cell;
    }
    
    // MARK: - TableView Delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return PaletteCell.height()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell: PaletteCell = self.tableView.cellForRowAtIndexPath(indexPath) as! PaletteCell
        cell.toggleSelectedAnimated(true)
    }
    
    // MARK: - SearchBar Delegate
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        self.requestPalettes()
        self.searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        self.searchBar.resignFirstResponder()
    }
}
