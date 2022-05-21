//
//  Customer.swift
//  
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Fluent
import Vapor

final class Barcode: Model, Content {
    static let schema = "barcode"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "barcode")
    var barcode: String
    
   
    
    
    init() { }
    
    init (id: UUID? = nil, barcode: String) {
        self.id = id
        self.barcode = barcode
       
    }
}
