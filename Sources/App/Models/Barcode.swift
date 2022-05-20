//
//  Barcode.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Fluent
import Vapor

final class Barcode: Model, Content {
    static let schema = "barcodes"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "barcode")
    var barcode: String
    
  
    
    
    init() { }
    
    init (id: UUID? = nil, name: String, barcode: String) {
        self.id = id
   
        self.barcode = barcode
    }
}
