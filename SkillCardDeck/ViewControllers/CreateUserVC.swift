
//
//  CreateUserVC.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class CreateUserVC: VC, UITextFieldDelegate {
  
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var profilePictureImageView: UIImageView!
  
  var defaultImage: UIImage = UIImage(named: "defaultUser.png")!
  var selectedImage: UIImage? {
    didSet {
      self.profilePictureImageView.image = self.selectedImage
    }
  }
  var picturePickerDelegate: PicturePickerDelegate
  
  override init() {
    self.picturePickerDelegate = PicturePickerDelegate(title: "Hey!", message: "Let's get you a profile picture")
    super.init(nibName: "CreateUserVC", bundle: nil)
  }

  required override init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()

      // Do any additional setup after loading the view.
    configure()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  func configure() {
    configurePicturePickerDelegate()
  }
  
  func configurePicturePickerDelegate() {
    self.picturePickerDelegate.takePictureTapped = {
      self.presentViewController(self.picturePickerDelegate.imageController, animated: true, completion: nil)
    }
    self.picturePickerDelegate.selectPictureTapped = {
      self.presentViewController(self.picturePickerDelegate.imageController, animated: true, completion: nil)
    }
    self.picturePickerDelegate.imageSelected = {
      (image: UIImage) in
      self.selectedImage = image
      self.picturePickerDelegate.imageController.dismissViewControllerAnimated(true, completion: nil)
    }
  }
  
  
  // MARK: - IBActions
  
  @IBAction func addProfilePictureTapped(sender: AnyObject) {
    self.presentViewController(self.picturePickerDelegate.alertController, animated: true, completion: nil)
  }
  
  @IBAction func createUserTapped(sender: UIControl) {
    createNewUser()
  }
  
  @IBAction func cancelCreateUser(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  // MARK: Model Actions
  func createNewUser() {
    if !User.validUserName(self.userNameTextField.text) {
      print("invalid userName")
      return
    }
    
    let newUser = User(name: self.userNameTextField.text)
    if let si = self.selectedImage {
      newUser.profilePicture = si
    } else {
      newUser.profilePicture = self.defaultImage
    }
    DataAccessObject.sharedInstance.users.append(newUser)
    self.dismissViewControllerAnimated(true, completion: nil)
  }

  
  // MARK: - UITextFieldDelegate
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
    self.view.endEditing(true)
  }
  
  
}













