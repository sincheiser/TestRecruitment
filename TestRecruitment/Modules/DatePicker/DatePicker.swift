//
//  DatePicker.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import UIKit

protocol PickDateDelegate {
    func pickDate(date: Date)
}

class DatePickerVC: UIViewController {

    @IBOutlet weak var wrapView: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var applyButton: UIButton!
    
    var delegate: PickDateDelegate?
    var forStartDate: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true)
    }
    
    private func setupViews() {
        setupWrapView()
        setupApplyButton()
    }
    
    private func setupWrapView() {
        wrapView.layer.cornerRadius = 0.0222 * wrapView.frame.width
    }
    
    private func setupApplyButton() {
        applyButton.layer.cornerRadius = 0.0256 * applyButton.frame.width
    }
    
    @IBAction func applyButtonDidTapped(_ sender: UIButton) {
        self.delegate?.pickDate(date: self.datePicker.date)
        self.dismiss(animated: true)
    }
}
