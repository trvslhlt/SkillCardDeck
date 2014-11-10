//
//  User.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/7/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class User: Model {
  
  let name: String
  var profilePicture: UIImage
  var skillCards: [SkillCard] = []
  
  init(name: String) {
    self.name = name
    self.profilePicture = UIImage.defaultUserImage()
    super.init()
  }
  
  class func validUserName(name: String) -> Bool {
    let maxNameLength = 20
    let invalidCharacters: [String] = ["#", "\"", "'", "?", "@"]
    
    let nameLength = countElements(name)
    let hasValidLength = nameLength > 0 && nameLength < maxNameLength
    
    var hasValidCharacters: Bool = true
    
    for c in invalidCharacters {
      if name.rangeOfString(c) != nil {
        hasValidCharacters = false
        break
      }
    }
    
    if hasValidCharacters && hasValidLength && !User.userNameExists(name) {
      return true
    } else {
      return false
    }
  }
  
  class func userNameExists(name: String) -> Bool {
    var filteredArray = DataAccessObject.sharedInstance.users.filter( { (user: User) -> Bool in
      return user.name == name
    })
    if filteredArray.count == 0 {
      return false
    } else {
      return true
    }
  }
  
  
   
}









