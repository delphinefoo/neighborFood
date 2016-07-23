//
//  SecondViewController.swift
//  NeighborFood
//
//  Created by Delphine Foo-Matkin on 7/23/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SecondViewController: UIViewController {

    @IBOutlet var imageOne: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navbarFont = UIFont(name: "Gill Sans", size: 17) ?? UIFont.systemFontOfSize(17)
        
        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: navbarFont, NSForegroundColorAttributeName:UIColor.whiteColor()]
        
        // Get a reference to our posts
        let database = FIRDatabase.database()
        let allCategories = database.reference()
        let products = allCategories.child("products")
        let refHandle = products.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let productList = snapshot.value as! NSArray
            for var i = 1; i < productList.count; i++ {
                if let url = productList[i]["imageurl"] as? NSString {
                    print(url)
                    let gsReference = FIRStorage.storage().referenceForURL(url as String)
                    gsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                        if (error != nil) {
                            NSLog("ERRRRRRROOOORRR")
                        } else {
                            if data != nil {
                                var newImage: UIImageView = UIImageView()
                                var xPos: CGFloat = CGFloat(i * 25)
                                newImage.frame = CGRectMake(xPos, 200.0, 100.0, 100.0)
                                newImage.tag = i + 100
                                newImage.image = UIImage(data:data!)
                                self.view!.addSubview(newImage)
                            }
                            //var imgView: UIImageView = self.view!.viewWithTag(110)
                        }
                    }
                }
            }
            
        })
      
        /*ref.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            }, withCancelBlock: { error in
                print(error.description)
        })*/
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

