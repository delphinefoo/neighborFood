//
//  prodDetailViewController.swift
//  NeighborFood
//
//  Created by Delphine Foo-Matkin on 7/24/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class prodDetailViewController: UIViewController {
    
    
    @IBOutlet var detailImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let gsReference = FIRStorage.storage().referenceForURL("gs://neighborfood-85c2b.appspot.com/images/strawberry-expose-sm.jpg")
        gsReference.dataWithMaxSize(1 * 1024 * 1024) { (data, error) -> Void in
            if (error != nil) {
                NSLog("ERRRRRRROOOORRR")
            } else {
                if data != nil {
                    self.detailImg.image = UIImage(data:data!)!
                }
            }
        }
                
            

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}