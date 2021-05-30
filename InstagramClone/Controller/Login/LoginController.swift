//
//  LoginController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/24/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit
import Firebase




class LoginController: UIViewController {
    
    let logoView: UIView  = {
       let view = UIView()
       let logoImageView = UIImageView(image:#imageLiteral(resourceName: "logo2"))
       logoImageView.contentMode = .scaleAspectFill
        
            view.addSubview(logoImageView)
               logoImageView.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 50)
              
              logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
              logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
              view.backgroundColor = UIColor(red: 0/255, green: 120/255, blue: 175/255, alpha: 1)
                  return view
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
        tf.placeholder = "Email"
        tf.backgroundColor =  UIColor(white: 0, alpha: 0.03)
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 14)
        return tf
    }()
      
      let LoginButton: UIButton = {
          let button = UIButton(type: .system)
          button.setTitle ("Login", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.backgroundColor = UIColor(red: 51/255, green: 153/255, blue: 255/255, alpha: 1)
          button.layer.cornerRadius = 10
          button.addTarget(self, action: #selector(login_action), for: .touchUpInside)
        
         
          return button
      }()
    
    @objc func  login_action(){
              guard let email     = emailTextField.text  else { return }
              guard let password  = PasswordTextField.text  else { return }
            
              
        

              
              Auth.auth().signIn(withEmail: email, password: password){ (user , error) in
                      if let error = error {
                          print("error creating user: \(error)")
                          return
                    
                      }
                      let mainBar  = MainTabController()
                      mainBar.modalPresentationStyle = .fullScreen
                      self.present(mainBar , animated: true , completion: nil)
                
        }
    }
        

      
      let dontHaveAccountButton: UIButton = {
          let button = UIButton(type: .system)
          
          let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
          attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)]))
        
        button.addTarget(self, action: #selector(GoSignUP), for: .touchUpInside)
          
        button.setAttributedTitle(attributedTitle, for: .normal
        )
          
          return button
      }()
   
    @objc func  GoSignUP(){
        
        let SignUp = SignUpController()
         navigationController?.pushViewController( SignUp, animated: true)
    }
   override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    navigationController?.navigationBar.isHidden = true
    
    view.addSubview(logoView)
    
    logoView.anchor(top:view.topAnchor, left: view.leftAnchor,  bottom: nil , right : view.rightAnchor , paddingTop:  0  , paddingLeft:  0 , paddingBottom: 0 , paddingRight: 0 , width: 0 , height: 150 )

    
     let stackview = UIStackView(arrangedSubviews:[ emailTextField, PasswordTextField , LoginButton])
    
    stackview.axis         = .vertical
    stackview.spacing      = 10
    stackview.distribution = .fillEqually
    
    
    view.addSubview(stackview)
    view.addSubview(dontHaveAccountButton)
    
      stackview.anchor(top: logoView.bottomAnchor, left: view.leftAnchor,  bottom: nil , right : view.rightAnchor , paddingTop:  40  , paddingLeft:  40 , paddingBottom: 0 , paddingRight: 40 , width: 0 , height: 140 )
    
     dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)

    
   }
   
}
