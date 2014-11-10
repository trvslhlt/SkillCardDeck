//
//  UserVC.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/7/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class UserVC: VC {
  
  let user: User!
  
  @IBOutlet weak var userProfilePictureImageView: UIImageView!
  
  required init(user: User) {
    self.user = user
    super.init(nibName: "UserVC", bundle: nil)
  }

  required override init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    commonConfiguration()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // MARK: - Configuration
  func commonConfiguration() {
    self.title = self.user.name
    self.userProfilePictureImageView.image = self.user.profilePicture
  }
  
  
}


















