//
//  SignUpController.swift
//  InstagramClone
//
//  Created by xc36c5 on 5/25/21.
//  Copyright © 2021 Alexsander. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage

class SignUpController: UIViewController , UIImagePickerControllerDelegate  ,  UINavigationControllerDelegate{

    
    
    
    let PhotoBtn: UIButton = {
        let button  = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus_photo-1").withRenderingMode(.alwaysOriginal) , for: .normal)
        button.addTarget(self  , action:#selector(SelectPhoto) , for: .touchUpInside)
        
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
        tf.isSecureTextEntry = true
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
    
    
    let  signBtn: UIButton = {
        let button  = UIButton(type: .system)
        button.setTitle("Sign Up" , for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.layer.cornerRadius = 5
        button.backgroundColor = UIColor(red: 149/255, green: 204/255, blue: 244/255, alpha: 1)
        button.addTarget(self, action: #selector(action_SignUp), for: .touchUpInside)
        
        
        
        
        return button
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
    
  
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let  image  = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            PhotoBtn.layer.masksToBounds = true
            PhotoBtn.layer.borderColor =  UIColor.black.cgColor
            PhotoBtn.layer.borderWidth = 2
            PhotoBtn.layer.cornerRadius =  PhotoBtn.frame.width / 2
            PhotoBtn.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
                       
        }else{
            return
        }
        
        self.dismiss(animated: true , completion: nil)
    }
    
    @objc func SelectPhoto(){
        let imagepicker = UIImagePickerController()
        imagepicker.delegate       = self
        imagepicker.allowsEditing  = true
        imagepicker.sourceType = .photoLibrary
        self.present(imagepicker , animated: true , completion: nil)
        
    }
  
    @objc func action_SignUp(){
        guard let email     = emailTextField.text  else { return }
        guard let password  = PasswordTextField.text  else { return }
        guard let fullname     = FullnameTextField.text  else { return }
        guard let username  = usernameTextField.text  else { return }
      
        
  

        
        Auth.auth().createUser(withEmail: email, password: password){ (user , error) in
                if let error = error {
                    print("error creating user: \(error)")
                    return
              
                }
            
                   
                    let filename = NSUUID().uuidString
                    let ref = Storage.storage().reference().child("profile_images").child(filename)
                    guard let image_profile =  self.PhotoBtn.imageView?.image  else { return }
                    
                    guard   let profile_image =  image_profile.jpegData(compressionQuality: 0.80) else {return}
                    let metaData = StorageMetadata()
                    metaData.contentType = "image/jpg"
                    ref.putData(profile_image  , metadata:  metaData){ metadata , error in
                               if let error = error {
                                             print("error creating image: \(error)")
                                             return
                                       
                                }
                        
                        ref.downloadURL { (url , error) in
                            guard  let image_url =  url?.absoluteString else { return }
                            
                            let dictvalus = ["name" : fullname , "username" :  username  , "profileimageURL" : image_url]
                            
                            guard let user_uid = user?.user.uid  else  {return}
                            let values = [user_uid : dictvalus]
                            Database.database().reference().child("users").updateChildValues(values , withCompletionBlock: {
                                (error , ref ) in
                                print("successfully created user")
                            })
                        }
                        
                }
              
           
          
            
          return
        }
    }
        
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(PhotoBtn)
        
        view.backgroundColor = .white
        
        
        PhotoBtn.anchor(top: view.topAnchor, left: nil, bottom: nil , right: nil, paddingTop: 40, paddingLeft: 0 ,  paddingBottom: 0, paddingRight: 0, width: 140, height: 150)
        
        PhotoBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
         let stackview = UIStackView(arrangedSubviews:[ emailTextField, PasswordTextField  , FullnameTextField , usernameTextField , signBtn])
           
           stackview.axis         = .vertical
           stackview.spacing      = 10
           stackview.distribution = .fillEqually
           
           
           view.addSubview(stackview)
           
           
             stackview.anchor(top: PhotoBtn.bottomAnchor, left: view.leftAnchor,  bottom: nil , right : view.rightAnchor , paddingTop:  40  , paddingLeft:  40 , paddingBottom: 0 , paddingRight: 40 , width: 0 , height: 240 )
        
        
            view.addSubview(HaveAccountButton)
            
             HaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)
     
    }
    
}
