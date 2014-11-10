//
//  HomeVC.swift
//  SkillCardDeck
//
//  Created by trvslhlt on 11/7/14.
//  Copyright (c) 2014 travis holt. All rights reserved.
//

import UIKit

class HomeVC: VC {
  
  @IBOutlet weak var userCollectionViewContainer: UIView!
  @IBOutlet weak var skillCardViewContainer: UIView!
  
  lazy var userCollectionViewDelegate: UserCollectionViewDelegate = {
    let u = UserCollectionViewDelegate()
    return u
  }()
  lazy var userCollectionView: UserCollectionView = {
    return self.userCollectionViewDelegate.collectionView
  }()
  
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
  }

  required override init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
    
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
    self.navigationController?.navigationBar.shadowImage = UIImage()
    self.navigationController?.navigationBar.translucent = true
    self.automaticallyAdjustsScrollViewInsets = false
    commonConfiguration()
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    self.userCollectionView.reloadData()
  }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  // MARK: Configuration
  func commonConfiguration() {
    self.title = "Users"
    configureUserCollectionView()
  }
  
  func configureUserCollectionView() {
    self.userCollectionViewContainer.addSubview(self.userCollectionView)
    self.userCollectionView.autoPinEdgesToSuperviewEdgesWithInsets(UIEdgeInsetsZero)
    
    self.userCollectionViewDelegate.selectedUser = {
      (selectedUser: User) in
      let userVC = UserVC(user: selectedUser)
      self.navigationController?.pushViewController(userVC, animated: true)
    }
    
    self.userCollectionView.reloadData()
  }
  
  // MARK: - IBAction
  
  @IBAction func goToUserVC(sender: AnyObject) {
//    let userVC = UserVC(user: DataAccessObject.sharedInstance.users[0])
//    self.navigationController?.pushViewController(userVC, animated: true)
  }
  
  @IBAction func addNewUser(sender: AnyObject) {
    let createUserVC = CreateUserVC()
    self.navigationController?.presentViewController(createUserVC, animated: true, nil)
  }
  
}












