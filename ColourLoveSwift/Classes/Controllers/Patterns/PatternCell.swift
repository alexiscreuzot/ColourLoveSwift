//
//  PatternCell.swift
//  ColourLoveSwift
//
//  Created by Alexis Creuzot on 07/12/2015.
//  Copyright © 2015 alexiscreuzot. All rights reserved.
//

import SDWebImage

var kNbColumns:UInt = 3

class PatternCell: UICollectionViewCell {
    
    @IBOutlet weak var patternImageView: UIImageView?

    private var pattern:Pattern?
    
    static func size()-> CGSize
    {
        let width = UIScreen.mainScreen().bounds.width/CGFloat(kNbColumns)
        let height = width
        return CGSizeMake(width, height)
    }
    
    func setPattern(pattern:Pattern)
    {
        self.pattern = pattern
        self.patternImageView?.sd_setImageWithURL(pattern.imageURL())
    }
    
}
