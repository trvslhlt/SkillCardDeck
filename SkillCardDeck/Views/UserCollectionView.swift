//
//  UserCollectionView.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/7/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class UserCollectionView: UICollectionView {

  let userCellReuseID = "userCellReuseID"
  let cellWidth: CGFloat = 100
  //var users: [User]
  
  override init() {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .Horizontal
    super.init(frame: CGRectZero, collectionViewLayout: layout)
//    commonConfiguration()
  }

  required init(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
  }
  
//  func commonConfiguration() {
//    self.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
//    self.backgroundColor = UIColor.redColor()
//    self.layer.borderWidth = 2
//
//    self.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: self.userCellReuseID)
//    
////    for _ in 1...5 {
////      self.users += [User(name: "this")]
////    }
//  }
  
//  // MARK: UICollectionViewDataSource
//  
//  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    println("\(self.users.count)")
//    return self.users.count
//  }
//  
//  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.userCellReuseID, forIndexPath: indexPath) as UICollectionViewCell
//    
//    cell.backgroundColor = UIColor.whiteColor()
//    cell.layer.borderWidth = 1.0
//    return cell
//  }
//  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//    return CGSizeMake(self.cellWidth, self.bounds.height)
//  }
//  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
//    return 0
//  }
//  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
//    return 0
//  }
//  
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//    return UIEdgeInsetsMake(0, 0, 0, 0)
//  }
  
//
//  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//    return CGSizeMake(0, 0)
//  }
  

}
