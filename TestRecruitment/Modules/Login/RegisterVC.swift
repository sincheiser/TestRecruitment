//
//  RegisterVC.swift
//  TestRecruitment
//
//  Created by Kelvin on 14/03/23.
//

import UIKit
import YPImagePicker

class RegisterVC: BaseController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var addressTV: CustomTextView!
    @IBOutlet weak var photoContainer: UIView!
    @IBOutlet weak var photoImg: UIImageView!
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: HideShowPasswordTextField!
    
    // MARK: - Variables
    
    private let vm = RegisterViewModel()
    private var imageData: Data?
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Functions
    
    private func updateDate(with date: Date) {
        self.dateLbl.text = date.convertToDisplayDate()
    }
    
    private func validateData() {
        if nameTF.text == "" {
            self.showToast(message: "Nama tidak boleh kosong")
        } else if dateLbl.text == "" {
            self.showToast(message: "Tanggal lahir tidak boleh kosong")
        } else if addressTV.text == "" {
            self.showToast(message: "Alamat tidak boleh kosong")
        } else if imageData == nil {
            self.showToast(message: "Photo tidak boleh kosong")
        } else if usernameTF.text == "" {
            self.showToast(message: "Username tidak boleh kosong")
        } else if passwordTF.text == "" {
            self.showToast(message: "Password tidak boleh kosong")
        } else {
            let isUsernameTaken = vm.checkUsernameData(username: usernameTF.text!)
            
            if !isUsernameTaken {
                buildData()
            } else {
                self.showToast(message: "Username sudah terdaftar")
            }
        }
    }
    
    private func buildData() {
        vm.registerUser(
            name: nameTF.text ?? "",
            dateOfBirth: dateLbl.text ?? "",
            address: addressTV.text ?? "",
            image: imageData!,
            username: usernameTF.text ?? "",
            password: passwordTF.text ?? "")
        
        self.showToast(message: "Register berhasil, silahkan login")
        self.navigationController?.popViewController(animated: true)
    }
    
    // MARK: - IBAction

    @IBAction func btnDatePickerDidClick(_ sender: Any) {
        let picker = StoryboardScene.DatePicker.datePickerVC.instantiate()
        
        picker.delegate = self
        self.navigationController?.present(picker, animated: true)
    }
    
    @IBAction func btnChoosePhotoDidClick(_ sender: Any) {
        let picker = YPImagePicker()
        
        picker.didFinishPicking { [unowned picker] items, _ in
            if let photo = items.singlePhoto {
                self.photoImg.image = photo.image
                self.photoContainer.isHidden = false
                self.imageData = photo.image.jpegData(compressionQuality: 1)!
            } else {
                self.photoContainer.isHidden = true
            }
            picker.dismiss(animated: true)
        }
        self.present(picker, animated: true)
    }
    
    @IBAction func btnRegisterDidClick(_ sender: Any) {
        validateData()
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC: PickDateDelegate {
    func pickDate(date: Date) {
        updateDate(with: date)
    }
}
