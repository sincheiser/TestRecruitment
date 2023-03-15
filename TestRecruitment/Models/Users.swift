//
//  Users.swift
//  TestRecruitment
//
//  Created by Kelvin on 15/03/23.
//

import RealmSwift

class Users: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name: String = ""
    @Persisted var birthDate: String = ""
    @Persisted var address: String = ""
    @Persisted var username: String = ""
    @Persisted var password: String = ""
    @Persisted var profileImage: Data = Data()
    
    convenience init(name: String, birthDate: String, address: String, profileImage: Data, username: String, password: String) {
        self.init()
        
        self.name = name
        self.birthDate = birthDate
        self.address = address
        self.profileImage = profileImage
        self.username = username
        self.password = password
    }
}
