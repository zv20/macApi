//
//  Customer.swift
//  
//
//  Created by Zhivko Vanev on 28.04.22.
//

import Fluent
import Vapor

final class Barcode: Model, Content {
    static let schema = "barcodes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "codeB")
    var codeB: String
    
   
    
    
    init() { }
    
    init (id: UUID? = nil, codeB: String) {
        self.id = id
        self.codeB = codeB
       
    }
}
