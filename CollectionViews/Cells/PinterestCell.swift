
//
//  PinterestCell.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/13/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit

class PinterestCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        self.layer.cornerRadius = 6
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imageHeightConstraint.constant = self.frame.size.height - 75
    }
}
