//
//  PinterestViewController.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/13/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit

class PinterestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    var images = ["breach","grouper","ray","shark","turtle","whale"]
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
