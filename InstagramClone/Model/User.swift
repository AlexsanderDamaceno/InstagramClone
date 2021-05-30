//
//  User.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/29/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import Foundation

class  User {
    var username : String!
    var name : String!
    var profileimageURL: String!
    var uid: String!
    
    init(uid:String , dictionary:Dictionary<String , AnyObject>){
        self.uid = uid
        
        if let username = dictionary["username"] as? String {
            self.username = username
        }
        
        
        if let name = dictionary["name"] as? String {
            self.name = name
        }
        
        if let profileimageURL = dictionary["profileimageURL"] as? String {
            self.profileimageURL = profileimageURL
           
        }
    }
}
