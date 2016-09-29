//
//  ThumbGridViewController.swift
//  ThumbGridDemo
//
//  Created by Michael Eaton on 9/25/16.
//  Copyright © 2016 Michael Eaton. All rights reserved.
//

import UIKit

private let reuseIdentifier = "ThumbGridCell"

class ThumbGridViewController: UICollectionViewController {
    
    var itemList = [ContentItem]()

    // Retrieve a list of items out of a plist and load into array to drive the grid view.
    func readItemsIntoArray() {
        let path = NSBundle.mainBundle().pathForResource("Items", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        var tempItem = ContentItem.init()
        for (_, value) in dict! {
            let item = value as! NSDictionary
            tempItem.thumb = item.valueForKey("thumbnail") as! String
            tempItem.label = item.valueForKey("label") as! String
            tempItem.topic = item.valueForKey("topic") as! String
            tempItem.description = item.valueForKey("description") as! String
            tempItem.descriptionTitle = item.valueForKey("descTitle") as! String
            tempItem.video = item.valueForKey("video") as! String
            itemList.append(tempItem)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Do any additional setup after loading the view.
        readItemsIntoArray()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        let paths: [NSIndexPath] = self.collectionView!.indexPathsForSelectedItems()!
        if paths.count > 0 {
            let selected = paths[0].row
            let contentVC = segue.destinationViewController as! ContentViewController
            contentVC.showItem = itemList[selected]
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ThumbGridCell
        // Configure the cell
        cell.topicLabel.text = itemList[indexPath.row].topic
        cell.imageView.image = UIImage(named: itemList[indexPath.row].thumb)
        cell.itemLabel.text = itemList[indexPath.row].label
        return cell
    }
    

    // MARK: UICollectionViewDelegate

}
