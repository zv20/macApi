//
//  File.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Foundation

import Fluent

//
struct CreateBarcodes: Migration {
    func prepare(on database: Database) -> EventLoopFuture<Void> {
    
        return database.schema("barcodes")
        
            .id()
        
     
        
        
            .field("barcode", .string, .required)
            
            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        return database.schema("barcodes").delete()
    }
}
