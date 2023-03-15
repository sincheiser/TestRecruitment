//
//  HomeViewModel.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import Foundation
import RealmSwift

class HomeViewModel {
    private var realm: Realm = {
        let config = Realm.Configuration(schemaVersion: REALM_VERSION, deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: config)
        return realm
    }()
    
    func getCountData() -> Int {
        let users = realm.objects(Users.self)
        
        return users.count
    }
      
    func assignData(cell: ListUserCell, indexPath: IndexPath) {
        let users = realm.objects(Users.self)
        
        if (users.count > 0) && (indexPath.row <= users.count) {
            let user = users[indexPath.row]
            
            cell.nameLbl.text = user.name
            cell.dateOfBirthLbl.text = user.birthDate
            cell.addressLbl.text = user.address
            
            cell.photoImg.image = UIImage(data: user.profileImage, scale: 1.0)
        }
    }
}
