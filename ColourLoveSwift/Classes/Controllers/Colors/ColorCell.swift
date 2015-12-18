//
//  ColorCell.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 17/11/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//


class ColorCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var subtitleLabel: UILabel?
    @IBOutlet weak var colorView: UIView?

    private var color: Color?

    class func height() -> CGFloat {
        return 70.0
    }

    override func setSelected(selected: Bool, animated: Bool) {
        self.colorBackground(selected)
    }

    func setColor(color: Color) {
        self.color = color
        self.titleLabel?.text = color.title.capitalizedString
        self.subtitleLabel?.text = "#"+color.hex
        self.colorView?.backgroundColor = color.uicolor()
    }

    func colorBackground(doColor: Bool) {
        UIView.animateWithDuration(0.3) { () -> Void in
            self.backgroundColor = ( doColor ? self.color?.uicolor() : UIColor.whiteColor())
            self.titleLabel?.textColor = ( doColor ? self.color?.uicolor().contrastColor() : UIColor.blackColor())
            self.subtitleLabel?.textColor = ( doColor ? self.color?.uicolor().contrastColor() : UIColor.lightGrayColor())
        }
    }
}
