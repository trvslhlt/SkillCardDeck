//
//  DataAccessObject.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/9/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class DataAccessObject: Model {
  
  class var sharedInstance : DataAccessObject {
    struct Singleton {
      static let instance = DataAccessObject()
    }
    return Singleton.instance
  }
  
  var users: [User] = []
  
  override init() {

  }
    
}
