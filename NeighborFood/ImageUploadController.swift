//
//  ImageUploadController.swift
//  NeighborFood
//
//  Created by Ryan Lim on 7/24/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import Foundation
import UIKit

class ImageUploadController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageView.image = Image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}