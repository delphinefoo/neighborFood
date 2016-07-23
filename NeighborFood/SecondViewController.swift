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
        let ref = database.reference()
        let refHandle = ref.observeEventType(FIRDataEventType.Value, withBlock: { (snapshot) in
            let postDict = snapshot.value as! [String: AnyObject]
            for (key, value) in postDict {
                print(key, value)
            }
        })
        /*ref.observeEventType(.Value, withBlock: { snapshot in
            print(snapshot.value)
            }, withCancelBlock: { error in
                print(error.description)
        })*/
        
        let gsReference = FIRStorage.storage().referenceForURL("gs://neighborfood-85c2b.appspot.com/images/carrots-bunch-sm.jpg")
        gsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                NSLog("ERRRRRRROOOORRR")
            } else {
                if data != nil {
                    self.imageOne.image = UIImage(data:data!)
                }
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

