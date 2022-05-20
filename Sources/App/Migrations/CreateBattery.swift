//
//  CreateBattery.swift
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Fluent

//
struct CreateBattery: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
    
        return database.schema("batterys")
            .id()
        
     
            .field("name", .string)
        
            .field("date", .string)
            
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("batterys").delete()
    }
}
