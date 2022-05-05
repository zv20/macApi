//
//  CreateCustomers.swift
//  
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Fluent

//
struct CreateCustomers: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
    
        return database.schema("customers")
            .id()
        
     
            .field("name", .string, .required)
        
            .field("number2", .int)
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("customers").delete()
    }
}
