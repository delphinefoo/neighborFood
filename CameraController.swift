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

var Image = UIImage()

class CameraController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func takePicture(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            if (UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil){
                self.presentViewController(imagePicker, animated: true, completion: nil)
                
            } else {
                print("There was a problem accessing the rear camera")
            }
        } else {
            print("There was a problem accessing the camera")
        }

    }
    /*@IBAction func takePicture(sender: UIButton) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            if (UIImagePickerController.availableCaptureModesForCameraDevice(.Rear) != nil){
                self.presentViewController(imagePicker, animated: true, completion: nil)

            } else {
                print("There was a problem accessing the rear camera")
            }
        } else {
            print("There was a problem accessing the camera")
        }

    }*/
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        print("Successfully took a picture")
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            Image = image
            
        }
        picker.dismissViewControllerAnimated(true, completion: nil)

        let loginStory: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let imageVC: UIViewController = loginStory.instantiateViewControllerWithIdentifier("ImageVC")
        self.presentViewController(imageVC, animated: false, completion: nil)
    }
    
    /*func image(image: UIImage, didFinishSavingWithError
        error: NSErrorPointer, contextInfo:UnsafePointer<Void>) {
        
        if error != nil {
            // Report error to user
            print(error)
        } else {
            Image = image
            performSegueWithIdentifier("sehId", sender: nil)

        }
    }*/

    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        print("Did not take a picture")
        self.dismissViewControllerAnimated(true, completion: {
            
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.mediaTypes = [kUTTypeImage as String]
        imagePicker.allowsEditing = false

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}