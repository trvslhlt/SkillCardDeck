//
//  SkillCard.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/7/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class SkillCard: Model {
  
  let title: String
  var skillDescription: String = "Enter a description"
  
  init(title: String) {
    self.title = title
    super.init()
  }
  
}
