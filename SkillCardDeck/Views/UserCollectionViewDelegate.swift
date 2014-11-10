//
//  UserCollectionViewDelegate.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/8/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class UserCollectionViewDelegate: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  let collectionView: UserCollectionView!
  let userCellReuseID: String = "userCellReuseID"
  var userCellWidth: CGFloat {
    get {
      return self.collectionView.bounds.width / 3
    }
  }
  
  var selectedUser: ((User) -> ())?
  
  override init() {
    self.collectionView = UserCollectionView()
    super.init()
    configure()
  }
  
  func configure() {
    self.collectionView.delegate = self
    self.collectionView.dataSource = self
    self.collectionView.backgroundColor = UIColor.clearColor()
    let nib = UINib(nibName: "UserCollectionViewCell", bundle: nil)
    self.collectionView.registerNib(nib, forCellWithReuseIdentifier: self.userCellReuseID)
  }
  
  func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return DataAccessObject.sharedInstance.users.count
  }
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.userCellReuseID, forIndexPath: indexPath) as UserCollectionViewCell
    cell.configureWithUser(DataAccessObject.sharedInstance.users[indexPath.row])
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(self.userCellWidth, self.collectionView.bounds.height)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }

  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
    return 0
  }

  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 0, 0)
  }


  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSizeMake(0, 0)
  }
  
  func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    let user = DataAccessObject.sharedInstance.users[indexPath.row]
    self.selectedUser?(user)
  }
  
  
  
}
