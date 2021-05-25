//
//  LoginController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/24/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit





class LoginController: UIViewController {
    
  

    let emailTextField: UITextField = {
     let tf = UITextField()
     tf.placeholder = "Email"
     tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
     tf.borderStyle = .roundedRect
     tf.font = UIFont.systemFont(ofSize: 14)
     return tf
 }()
   
   override func viewDidLoad() {
       super.viewDidLoad()
    self.view.backgroundColor = .white
    view.addSubview(emailTextField)
    
    
    
    emailTextField.anchor(top: view.topAnchor, left: view.leftAnchor,  bottom: nil , right : view.rightAnchor , paddingTop:  40  , paddingLeft:  20 , paddingBottom: 0 , paddingRight: 0 , width: 0 , height: 40 )
       

    
   }
   
}
