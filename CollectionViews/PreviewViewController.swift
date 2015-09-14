//
//  PreviewViewController.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/13/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var camaros = ["camaro1", "camaro2","camaro3"]
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
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(self.view.frame.size.width-10, 280)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PreviewCell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath) as! PreviewCell
        let index = indexPath.row % 3
        cell.imageView.image = UIImage(named: self.camaros[index])
        return cell
    }
}
