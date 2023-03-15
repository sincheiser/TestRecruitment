//
//  BaseController.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import UIKit
import Toaster

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        if #available(iOS 13.0, *) {
            overrideUserInterfaceStyle = .light
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    func showToast(message : String) {
        ToastView.appearance().font = UIFont(name: "Montserrat-Light", size: 12.0)
        Toast(text: message, duration: Delay.short).show()
    }
}
