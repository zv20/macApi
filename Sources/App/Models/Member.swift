//
//  File.swift
//  
//
//  Created by Zhivko Vanev on 29.04.22.
//

import Fluent
import Vapor

final class Member: Model, Content {
    static let schema = "members"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "number")
    var number: Int
    
    
    @Field(key: "family")
    var family: String
    
    @Field(key: "email")
    var email: String
    
    @Field(key: "school")
    var school: String
    
    @Field(key: "memberUUID")
    var memberUUID: String
    
    init() { }
    
    init (id: UUID? = nil, name: String, number: Int, family: String, email: String, school: String, memberUUID: String) {
        self.id = id
        self.name = name
        self.number = number
        self.family = family
        self.email  = email
        self.school = school
        self.memberUUID = memberUUID
    }
    
}
