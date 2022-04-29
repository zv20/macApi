//
//  Customer.swift
//  
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Fluent
import Vapor

final class Customer: Model, Content {
    static let schema = "customers"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init (id: UUID? = nil, name: String) {
        self.id = id
        self.name = name 
    }
}
