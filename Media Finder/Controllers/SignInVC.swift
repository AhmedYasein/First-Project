//
//  SignInVC.swift
//  Media Finder
//
//  Created by Ahmed Yasein on 4/7/20.
//  Copyright © 2020 IDE academy. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        navigationItem.title = "Sign in"
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)

    }
    
    @IBAction func signInButtonPressed(_ sender: Any) {
    
    let user = UserDefaults.standard.object(forKey: "userLogData") as! Data
    let decodeUserData = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(user) as! DataOfUser
        if emailTextField.text == decodeUserData.email && passwordTextField.text == decodeUserData.password {
            
            let profileVC = UIStoryboard(name: VCs.main, bundle: nil).instantiateViewController(withIdentifier: VCs.ProfileVC ) as! ProfileVC
            self.navigationController?.pushViewController(profileVC, animated: true)
        }
}
    

    @IBAction func signInbutton(_ sender: UIButton) {
        let profileVC = UIStoryboard(name: VCs.main, bundle: nil).instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
self.present(profileVC, animated: true, completion: nil)
        
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
         let signup = UIStoryboard(name: VCs.main, bundle: nil).instantiateViewController(withIdentifier: VCs.signUpVC) as! SignUpVC
        self.present(signup, animated: true, completion: nil)
    }
    
}


