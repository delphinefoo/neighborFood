//
//  consumerViewController.swift
//  NeighborFood
//
//  Created by Delphine Foo-Matkin on 7/23/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseDatabase

class consumerViewController: UIViewController {
    
    @IBOutlet var imageOne: UIImageView!
    @IBOutlet var imageTwo: UIImageView!
    @IBOutlet var imageThree: UIImageView!
    @IBOutlet var imageFour: UIImageView!
    @IBOutlet var imageFive: UIImageView!
    @IBOutlet var imageSix: UIImageView!
    
    
    
    
    var imageCollection = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageCollection = [imageOne, imageTwo, imageThree, imageFour, imageFive, imageSix]
        
        //let tapRecog = UITapGestureRecognizer(target: imageTwo, action: "imgTap")
        //imageTwo.addGestureRecognizer(tapRecog)
        
        //get the Product objects from Firebase
        let database = FIRDatabase.database()
        let allCategories = database.reference()
        let products = allCategories.child("products")
        
        let refHandle = products.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let productList = snapshot.value as! NSArray
            for i in 0 ..< self.imageCollection.count {
                if let url = productList[i]["imageurl"] as? NSString {
                    print(url)
                    let gsReference = FIRStorage.storage().referenceForURL(url as String)
                    gsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
                        if (error != nil) {
                            NSLog("ERRRRRRROOOORRR")
                        } else {
                            if data != nil {
                                self.imageCollection[i].image = UIImage(data:data!)!
                            }
                        }
                    }
                }
            }

        })
        
    }
    
    
    
    func imgTap(gestureRecognizer: UITapGestureRecognizer)
    {
        let tapImg = gestureRecognizer.view!
        print("This is the image")
       
    }
    

    /*struct ProductInfo {
  
        static var name = ""
        static var description = ""
        static var producer = ""
    }*/
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

