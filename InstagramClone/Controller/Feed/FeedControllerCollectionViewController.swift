//
//  FeedControllerCollectionViewController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/28/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit
import Firebase
private let reuseIdentifier = "Cell"

class FeedControllerCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
         
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        Logout_user()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    func Logout_user(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout" ,  style: .plain , target: self , action:#selector(logout_action))
        
    }
    
    @objc func logout_action(){
        
        
        do{
            try Auth.auth().signOut()
            let login = UINavigationController(rootViewController: LoginController())
            login.modalPresentationStyle = .fullScreen
            self.present(login , animated: true , completion: nil)
        }catch{
           print("error login")
        }
    }
}
