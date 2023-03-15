//
//  RegisterViewModel.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import RealmSwift

class RegisterViewModel {
    private var realm: Realm = {
        let config = Realm.Configuration(schemaVersion: REALM_VERSION, deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: config)
        return realm
    }()
    
    func registerUser(name: String, dateOfBirth: String, address: String, image: Data, username: String, password: String) {
        let user = Users(
            name: name,
            birthDate: dateOfBirth,
            address: address,
            profileImage: image,
            username: username,
            password: password)
        
        do {
            try realm.write {
                realm.add(user)
            }
        } catch let error as NSError {
            print("Error Write = \(error)")
        }
    }
    
    func checkUsernameData(username: String) -> Bool {
        let users = realm.objects(Users.self)
        for user in users {
            if username == user.username {
                return true
            }
        }
        return false
    }
}
