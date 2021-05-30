//
//  UserProfileHeader.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/29/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let headerIdentifier = "UserProfileHeader"

class UserProfileHeader: UICollectionViewCell {
    var user:User? {
        
        didSet{
            namelabel.text = user?.name
           
        }
        
    }
    let profileImage : UIImageView = {
        let  img              = UIImageView()
        img.contentMode      = .scaleToFill
        img.clipsToBounds    = true
        img.backgroundColor  = .lightGray
        return img
    }()
    
    let namelabel: UILabel = {
        
        let name = UILabel()
        name.text = "profile"
        name.font = UIFont.boldSystemFont(ofSize: 14)
        return name
    }()
    
     let  publicationlabel: UILabel = {
           
           let name = UILabel()
           name.numberOfLines = 0
           name.textAlignment =  .center
           name.text = "Publication\n5"
           name.font = UIFont.boldSystemFont(ofSize: 14)
           return name
     }()
    
     let   followerslabel: UILabel = {
             
             let name = UILabel()
             name.numberOfLines = 0
             name.textAlignment = .center
             name.text = "Followers\n5"
             name.font = UIFont.boldSystemFont(ofSize: 14)
             return name
       }()
    
     let   followinglabel: UILabel = {
               
               let name = UILabel()
               name.textAlignment = .center
               name.numberOfLines = 0
               name.text = "Following\n5"
              
               
               name.font = UIFont.boldSystemFont(ofSize: 14)
               return name
        }()
      
    
    let editprofile: UIButton = {
          let editprofile = UIButton(type: .system)
          editprofile.setTitle("Edit Profile", for:  .normal)
          editprofile.layer.cornerRadius = 5
          editprofile.layer.borderColor = UIColor.lightGray.cgColor
          editprofile.layer.borderWidth = 0.5
          editprofile.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
      
          
          
          return editprofile
    }()
    
    
    
    
       
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        addSubview(profileImage)
        
        profileImage.anchor(top: self.topAnchor , left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        profileImage.layer.cornerRadius =  80 / 2
        
        addSubview(namelabel)
        
        
        
        namelabel.anchor(top: profileImage.bottomAnchor , left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        let stackview = UIStackView(arrangedSubviews:[publicationlabel , followerslabel , followinglabel])
              
        stackview.axis         = .horizontal
        stackview.spacing      = 10
        stackview.distribution = .fillEqually
        
        addSubview(stackview)
        
        stackview.anchor(top: self.topAnchor , left: profileImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        addSubview(editprofile)
        
        editprofile.anchor(top: publicationlabel.bottomAnchor , left:  publicationlabel.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 15, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 0 , height: 25)
               
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
