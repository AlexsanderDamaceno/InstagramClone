//
//  UserProfileCollectionViewController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/29/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit
import Firebase
private let reuseIdentifier   = "Cell"
private let headerIdentifier  = "UserProfileHeader"

class UserProfileCollectionViewController: UICollectionViewController , UICollectionViewDelegateFlowLayout {
    let  user : User? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        self.collectionView!.register(UserProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifier)
        
        // Do any additional setup after loading the view.
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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width:view.frame.width ,  height: 200)
        
    }

    
    override func collectionView(_ collectionView: UICollectionView,  viewForSupplementaryElementOfKind kind: String , at indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier, for: indexPath) as! UserProfileHeader
          
             let  user_id = Auth.auth().currentUser?.uid
             
            Database.database().reference().child("users").child(user_id!).observeSingleEvent(of: .value) { (snapshot)  in
                 guard let  user_info  = snapshot.value as? Dictionary<String , AnyObject>  else { return }
                 let  uid = snapshot.key
                 let  user  = User(uid: uid , dictionary: user_info)
                guard let url = URL(string: user.profileimageURL) else { return }
                self.navigationItem.title = user.username
                URLSession.shared.dataTask(with: url) { (data  , response , error) in
                 
                    if let error = error {
                         return
                    }
                    guard let imagedata = data else {return}
                    let photoimage = UIImage(data: imagedata)
                    
                    DispatchQueue.main.async {
                    
                    
                    cell.profileImage.image = photoimage
                    }
                    
                    
                    
                }.resume()
                    
                
                
                
                
              
                  
                
                 cell.user = user
                
                 
        }
        
        // Configure the cell
    
        return cell
    }
    func fetchusedata(){
     
            
        }
        
    }
    
 
