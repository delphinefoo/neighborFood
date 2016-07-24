//
//  CameraController.swift
//  NeighborFood
//
//  Created by Ryan Lim on 7/23/16.
//  Copyright © 2016 NeighborFood Team. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

class CameraController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    func takePicture (sender: UIButton){
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            if (UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil){
                imagePicker.delegate = self
                imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
                imagePicker.mediaTypes = [kUTTypeImage as String]
                imagePicker.allowsEditing = true
                self.presentViewController(imagePicker, animated: true, completion: nil)
            } else {
                print("There was a problem accessing the rear camera")
            }
        } else {
            print("There was a problem accessing the camera")
        }

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}