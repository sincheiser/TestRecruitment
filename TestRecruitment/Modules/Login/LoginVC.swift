//
//  LoginVC.swift
//  TestRecruitment
//
//  Created by Kelvin on 14/03/23.
//

import UIKit

class LoginVC: BaseController {
    // MARK: - IBOutlet
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: HideShowPasswordTextField!
    
    // MARK: - Variables
    let vm = LoginViewModel()
    
    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTF.text = ""
    }
    
    // MARK: - IBAction

    @IBAction func btnLoginDidClick(_ sender: Any) {
        self.view.endEditing(true)
        
        let username = usernameTF.text ?? ""
        let password = passwordTF.text ?? ""
        
        if username == "" {
            self.showToast(message: "Username tidak boleh kosong")
        } else if password == "" {
            self.showToast(message: "Password tidak boleh kosong")
        } else {
            let isValidated = vm.validateUsersCredential(username: username, password: password)
            
            if isValidated {
                let vc = StoryboardScene.Home.homeVC.instantiate()
                let main = UINavigationController.init(rootViewController: vc)
                
                Pref.saveString(KeyDefaults.userName, value: username)
                Pref.saveString(KeyDefaults.name, value: vm.getName(username: username))
                
                main.modalPresentationStyle = .fullScreen
                self.present(main, animated: true)
            } else {
                self.showToast(message: "Username atau password salah")
            }
        }
    }
    
    @IBAction func btnRegisterDidClick(_ sender: Any) {
        let vc = StoryboardScene.Login.registerVC.instantiate()
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
