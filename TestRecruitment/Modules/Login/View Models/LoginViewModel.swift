//
//  LoginViewModel.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import RealmSwift

class LoginViewModel {
    private var realm: Realm = {
        let config = Realm.Configuration(schemaVersion: REALM_VERSION, deleteRealmIfMigrationNeeded: true)
        let realm = try! Realm(configuration: config)
        return realm
    }()
    
    func validateUsersCredential(username: String, password: String) -> Bool {
        let users = realm.objects(Users.self)
        for user in users {
            if username == user.username && password == user.password {
                return true
            }
        }
        return false
    }
    
    func getName(username: String) -> String {
        let users = realm.objects(Users.self)
        for user in users {
            if username == user.username {
                return user.name
            }
        }
        return ""
    }
}
