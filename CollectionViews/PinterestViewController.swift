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

    var images = ["breach","grouper","ray","shark","turtle","whale"]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            print("Pinterest Layout")
            layout.delegate = self
        }
        else{
            print("No Layout")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: PinterestLayoutDelegate
    func collectionView(collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:NSIndexPath,
        withWidth width:CGFloat) -> CGFloat {
            let index = indexPath.row % 6
            let photo = UIImage(named: self.images[index])
            let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
            let rect  = AVMakeRectWithAspectRatioInsideRect(photo!.size, boundingRect)
            return rect.size.height
    }
    
    func collectionView(collectionView: UICollectionView,
        heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
            return 75
    }
    
    //MARK: UICollectionViewDelegate
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PinterestCell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! PinterestCell
        let index = indexPath.row % 6
        cell.imageView.image = UIImage(named: self.images[index])
        return cell
    }
}
