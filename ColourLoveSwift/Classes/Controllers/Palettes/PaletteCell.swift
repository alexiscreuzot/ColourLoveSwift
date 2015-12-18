//
//  PaletteCell.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import SDWebImage

class PaletteCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var paletteImageView: UIImageView?
    @IBOutlet weak var paletteImageWidthConstraint: NSLayoutConstraint?

    private var palette: Palette?

    class func height() -> CGFloat {
        return 70.0
    }

    func setPalette(palette: Palette) {
        self.palette = palette
        self.titleLabel?.text = palette.title.capitalizedString
        self.subtitleLabel?.text = palette.username
        self.paletteImageView?.sd_setImageWithURL(palette.imageURL())

        self.setPaletteDisplayed(palette.selected, animated: false)
    }

    func setPaletteDisplayed(displayed: Bool, animated: Bool) {
        let duration: Double = (animated) ? 0.3 : 0
        UIView.animateWithDuration(duration, animations: {() -> Void in
            self.paletteImageWidthConstraint!.constant = (self.palette!.selected) ? self.frame.size.width : 100
            self.layoutIfNeeded()
        })
    }

    func toggleSelectedAnimated(animated: Bool) {
        let realm = RLMRealm.defaultRealm()
        do {
            try realm.transactionWithBlock {
                self.palette!.selected = !self.palette!.selected
            }
        } catch {
            print("Realm write error")
        }

        self.setPaletteDisplayed(self.palette!.selected, animated: true)
    }

}
