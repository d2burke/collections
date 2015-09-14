//
//  GridViewController.swift
//  CollectionViews
//
//  Created by Daniel Burke on 9/13/15.
//  Copyright © 2015 D2 Development. All rights reserved.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var layoutButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 60
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("item", forIndexPath: indexPath)
        return cell
    }
    
    @IBAction func switchLayout(sender: UIButton) {
        sender.selected = !sender.selected
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = sender.selected ? UICollectionViewScrollDirection.Horizontal : UICollectionViewScrollDirection.Vertical
        self.collectionView.reloadData()
        
    }
}
