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

    // MARK: - Lifecycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.title = L10n.PalettesVCTitle.string
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        // We check the database, and proceed to do a web request
        // if the database doesn't return any results
        if Palette.allObjects().count == 0 {
            self.requestPalettes()
        }
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        if self.tableView.indexPathForSelectedRow != nil {
            self.tableView.deselectRowAtIndexPath(self.tableView.indexPathForSelectedRow!, animated: true)
        }
    }

    // MARK: - Network

    func requestPalettes() {
        SVProgressHUD.show()
        Palette.fetch(self.searchBar.text!) { (result, error) -> Void in
            if error != nil {
                SVProgressHUD.showErrorWithStatus(error?.localizedDescription)
            } else {
                self.tableView.reloadData()
                SVProgressHUD.showSuccessWithStatus("Done")
            }
        }
    }

    // MARK: - TableView Datasource

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Int(Palette.allObjects().count)
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let palette = Palette.allObjects()[UInt(indexPath.row)] as! Palette
        let cell = tableView.dequeueReusableCellWithIdentifier(PaletteCell.className(), forIndexPath: indexPath) as! PaletteCell
        cell.setPalette(palette)
        return cell
    }

    // MARK: - TableView Delegate

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return PaletteCell.height()
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath) as! PaletteCell
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
