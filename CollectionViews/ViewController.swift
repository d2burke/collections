//
//  ViewController.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/12/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    let icons = ["Grid", "Preview", "Pinterest"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.performSegueWithIdentifier("Grid", sender: self)
        case 1:
            self.performSegueWithIdentifier("Preview", sender: self)
        case 2:
            self.performSegueWithIdentifier("Pinterest", sender: self)
        default: ()
        }
    }
    
    //MINIMUM DELEGATE METHODS
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return icons.count
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width, 80)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:MenuCell = collectionView.dequeueReusableCellWithReuseIdentifier("menu", forIndexPath: indexPath) as! MenuCell
        cell.iconImageView.image = UIImage(named: icons[indexPath.row])
        cell.itemLabel.text = icons[indexPath.row]
        return cell
    }

}

