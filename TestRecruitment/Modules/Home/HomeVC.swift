//
//  HomeVC.swift
//  TestRecruitment
//
//  Created by Kelvin on 14/03/23.
//

import UIKit

class HomeVC: BaseController {

    // MARK: - IBOutlet
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var listUserTableVw: UITableView!
    
    // MARK: - Variables
    
    private let vm = HomeViewModel()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = Pref.getString(KeyDefaults.name)
        registerTableCell()
    }
    
    // MARK: - Functions
    
    func registerTableCell() {
        let nib = UINib.init(nibName: "ListUserCell", bundle: nil)
        
        listUserTableVw.register(nib, forCellReuseIdentifier: "ListUserCell")
    }
    
    // MARK: - IBAction
    @IBAction func btnLogoutDidClick(_ sender: Any) {
        Pref.clearPref()
        
        let login = StoryboardScene.Login.loginVC.instantiate()
        let initialVC = UINavigationController.init(rootViewController: login)
        
        let delegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        delegate.window?.rootViewController = initialVC
    }
}

// MARK: - Table View Delegate, Data Source
extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        vm.getCountData()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListUserCell", for: indexPath) as! ListUserCell
        
        vm.assignData(cell: cell, indexPath: indexPath)
        
        return cell
    }
}
