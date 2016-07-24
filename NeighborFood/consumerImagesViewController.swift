//
//  consumerImagesViewController.swift
//  NeighborFood
//
//  Created by Delphine Foo-Matkin on 7/23/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class consumerImagesViewController: UITableViewController {
    
    var imageCollection = [String]()
    
    @IBOutlet var theTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(consumerImagesViewController.reloadView), name: "imageArrived", object: nil)
        
        let database = FIRDatabase.database()
        let allCategories = database.reference()
        let products = allCategories.child("products")
        
        let refHandle = products.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let productList = snapshot.value as! NSArray
                for i in 0 ..< productList.count {
                    if let url = productList[i]["imageurl"] as? NSString {
                        print(url)
                        self.imageCollection.append(url as String)
                    }
                }

            
        })
        
        
    }
    
    func reloadView() {
        self.theTableView.reloadData()
        print("imageCollection count: " + String(imageCollection.count))
    }
    
    internal override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageCollection.count
    }
    
    internal override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        print("in tableView")
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        let gsReference = FIRStorage.storage().referenceForURL(imageCollection[indexPath.row])
            gsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                if (error != nil) {
                    NSLog("ERRRRRRROOOORRR")
                } else {
                    if data != nil {
                        let newImage: UIImageView = UIImageView()
                        let cellIdentifier = "Cell"
                        
                        let cell : UITableViewCell = self.theTableView.dequeueReusableCellWithIdentifier(cellIdentifier)! as UITableViewCell
                        
                        let image : UIImage = UIImage(data:data!)!
                        print("The loaded image: \(image)")
                        cell.imageView!.image = image
                        NSNotificationCenter.defaultCenter().postNotificationName("imageArrived", object: self)
                    }
                }
            }
        
        return cell
    }
    
}





