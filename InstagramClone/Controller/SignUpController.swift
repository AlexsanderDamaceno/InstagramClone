//
//  SignUpController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/25/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    
    let PhotoBtn: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo-1").withRenderingMode(.alwaysOriginal) , for: .normal)
        
        return button
    }()
    
    
    let emailTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
        
    
    let PasswordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
        
    
    let FullnameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Full name "
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
    
        
    
    let usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Username"
        tf.backgroundColor = UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
    
     let HaveAccountButton: UIButton = {
             let button = UIButton(type: .system)
             
             let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
             attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
           
           button.addTarget(self, action: #selector(GoLogin), for: .touchUpInside)
             
           button.setAttributedTitle(attributedTitle, for: .normal
           )
             
             return button
         }()
    
      @objc func  GoLogin(){
              
            navigationController?.popViewController(animated: true)
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(PhotoBtn)
        
        view.backgroundColor = .white
        
        
        PhotoBtn.anchor(top: view.topAnchor, left: nil, bottom: nil , right: nil, paddingTop: 40, paddingLeft: 0 ,  paddingBottom: 0, paddingRight: 0, width: 140, height: 150)
        
        PhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
         let stackview = UIStackView(arrangedSubviews:[ emailTextField, PasswordTextField  , FullnameTextField , usernameTextField])
           
           stackview.axis         = .vertical
           stackview.spacing      = 10
           stackview.distribution = .fillEqually
           
           
           view.addSubview(stackview)
           
           
             stackview.anchor(top: PhotoBtn.bottomAnchor, left: view.leftAnchor,  bottom: nil , right : view.rightAnchor , paddingTop:  40  , paddingLeft:  40 , paddingBottom: 0 , paddingRight: 40 , width: 0 , height: 140 )
        
        
            view.addSubview(HaveAccountButton)
            
             HaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
       
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
