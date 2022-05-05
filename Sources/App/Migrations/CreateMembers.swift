//
//  CreateMembers.swift.swift
//  
//
//  Created by Zhivko Vanev on 29.04.22.
//

import Fluent

struct CreateMembers: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
    
        return database.schema("members")
         
        
            .id()
        
     
            .field("name", .string, .required)
        
            .field("email", .string, .required)
        
            .field("family", .string, .required)
        
            .field("number", .int, .required)
        
            .field("school", .string, .required)
        
            .field("memberUUID", .string, .required)
        
            .create()
    }
    
   
    
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("members").delete()
        
    }
    
}
