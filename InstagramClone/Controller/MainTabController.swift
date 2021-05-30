//
//  MainTabController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/28/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit
import Firebase

class MainTabController: UITabBarController , UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self

      ConfigNavControl()
      user_islogged()
             
      
        
        // Do any additional setup after loading the view.
    }
    
    func  ConfigNavControl(){
        
           let Feed = configureViewControllers(unselected_image:#imageLiteral(resourceName: "home_unselected"), selected_image: #imageLiteral(resourceName: "home_selected") , rootviewController: FeedControllerCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
           Feed.modalPresentationStyle = .fullScreen
           let Search = configureViewControllers(unselected_image:#imageLiteral(resourceName: "search_unselected"), selected_image: #imageLiteral(resourceName: "search_selected") , rootviewController: SearchTableViewController())
           Search.modalPresentationStyle = .fullScreen
           let Upload = configureViewControllers(unselected_image:#imageLiteral(resourceName: "plus_unselected"), selected_image:#imageLiteral(resourceName: "plus_unselected")  , rootviewController: UploadPostController())
           Upload.modalPresentationStyle = .fullScreen
           let Notification = configureViewControllers(unselected_image:#imageLiteral(resourceName: "like_unselected"), selected_image: #imageLiteral(resourceName: "like_selected") , rootviewController: NotificationControllerTableViewController())
           Notification.modalPresentationStyle = .fullScreen
           let Userprofile = configureViewControllers(unselected_image:#imageLiteral(resourceName: "profile_unselected"), selected_image: #imageLiteral(resourceName: "profile_selected") , rootviewController: UserProfileCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
           Userprofile.modalPresentationStyle = .fullScreen
           viewControllers  = [Feed , Search , Upload , Notification , Userprofile ]
           tabBar.tintColor = .black
        
    }
    
    func configureViewControllers(unselected_image: UIImage , selected_image: UIImage ,  rootviewController:UIViewController  = UIViewController()) -> UINavigationController {
        
        let navcontrol = UINavigationController(rootViewController: rootviewController)
        navcontrol.tabBarItem.image = unselected_image
        navcontrol.tabBarItem.selectedImage = selected_image
        navcontrol.navigationBar.tintColor = .black
       
        return navcontrol
        
    }
    
    func user_islogged(){
        if Auth.auth().currentUser == nil {
           
            DispatchQueue.main.async {
                        
              let loginvc = LoginController()
              let login = UINavigationController(rootViewController: loginvc)
              login.modalPresentationStyle = .fullScreen
              self.present(login , animated: true , completion:  nil)
            }
        }
        return
    }
  

}
