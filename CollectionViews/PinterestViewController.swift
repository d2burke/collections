//
//  PinterestViewController.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/13/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit
import AVFoundation

class PinterestViewController: UIViewController, PinterestLayoutDelegate {

    var images = ["breach","whale","grouper","ray","shark","turtle","fish"]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PinterestCell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! PinterestCell
        let index = indexPath.row % 7
        cell.imageView.image = UIImage(named: self.images[index])
        return cell
    }
    
    //MARK: PinterestLayoutDelegate
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
        withWidth width:CGFloat) -> CGFloat {
            let index = indexPath.row % 7
            let photo = UIImage(named: self.images[index])
            let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect  = AVMakeRectWithAspectRatioInsideRect(photo!.size, boundingRect)
            return rect.size.height
    }
}
