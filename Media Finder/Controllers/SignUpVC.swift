//
//  ViewController.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/6/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Sign up"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    private func isValidData() -> Bool {
        if let fullName = fullNameTextField.text, !fullName.isEmpty, let email = emailTextField.text, !email.isEmpty, let password = passwordTextField.text, !password.isEmpty, let confirmPassword = confirmPasswordTextField.text, confirmPassword == password, let phoneNumber = phoneNumberTextField.text, !phoneNumber.isEmpty, let image = profileImage.image, image != UIImage(named: "sign up image"){
            
            return true
        }
        return false
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func profilePicture() {
        
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            profileImage.contentMode = .scaleAspectFit
            profileImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageButtonPressed(_ sender: UIButton) {
        profilePicture()
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        if isValidData(), isValidEmail(emailTextField.text!){
            
            let user = DataOfUser(name: fullNameTextField.text!, password: passwordTextField.text!, confirmPassword: confirmPasswordTextField.text!, phoneNumber: phoneNumberTextField.text!, image: profileImage.image!)
           dataBase.share.handelInsertData(user: user)
            
            /*      let encodedUserData = try! NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
             UserDefaults.standard.set(encodedUserData, forKey: "userLogData")
             
             */
            
            
            let signin = UIStoryboard(name: VCs.main, bundle: nil).instantiateViewController(withIdentifier: VCs.signInVC) as! SignInVC
            //  self.navigationController?.pushViewController(signin, animated: true)
            self.present(signin, animated: true, completion: nil)
        }
    }
}
