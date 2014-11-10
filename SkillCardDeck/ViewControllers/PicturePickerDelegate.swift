//
//  PicturePickerDelegate.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/9/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit
import ImageIO

class PicturePickerDelegate: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  let imageController = UIImagePickerController()
  let alertController: UIAlertController
  var selectedImage: UIImage? {
    didSet {
      self.imageSelected?(self.selectedImage!)
    }
  }
  
  var takePictureTapped: (() -> ())?
  var selectPictureTapped: (() -> ())?
  var imageSelected: (UIImage -> ())?
  
  init(title: String, message: String) {
    self.alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.ActionSheet)
    super.init()
    configure()
  }
  
  func configure() {
    self.imageController.editing = false
    self.imageController.delegate = self
    
    let libButton = UIAlertAction(title: "Select photo from library", style: UIAlertActionStyle.Default) { (alert) -> Void in
      self.imageController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
      self.selectPictureTapped?()
    }
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
      let cameraButton = UIAlertAction(title: "Take a picture", style: UIAlertActionStyle.Default) { (alert) -> Void in
        println("Take Photo")
        self.imageController.sourceType = UIImagePickerControllerSourceType.Camera
        self.takePictureTapped?()
      }
      self.alertController.addAction(cameraButton)
    } else {
      println("Camera not available")
      
    }
    let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel) { (alert) -> Void in
      println("Cancel Pressed")
    }
    
    self.alertController.addAction(libButton)
    self.alertController.addAction(cancelButton)

  }
  
  // MARK: - UIImagePickerControllerDelegate
  func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {

    let portion: CGFloat = 0.1
    let size = CGSizeApplyAffineTransform(image.size, CGAffineTransformMakeScale(portion, portion))
    let hasAlpha = false
    let scale: CGFloat = 0.0
    // Automatically use scale factor of main screen
    
    UIGraphicsBeginImageContextWithOptions(size, !hasAlpha, scale)
    image.drawInRect(CGRect(origin: CGPointZero, size: size))
    
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    self.selectedImage = scaledImage
    
  }
  
}
