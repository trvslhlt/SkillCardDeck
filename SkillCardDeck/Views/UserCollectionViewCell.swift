//
//  UserCollectionViewCell.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  func configureWithUser(user: User) {
    self.imageView.image = user.profilePicture
  }
    
}
