//
//  BatteryStatus.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//


import Fluent
import Vapor

final class Battery: Model, Content {
    static let schema = "batterys"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Timestamp(key: "date", on: .update, format: .iso8601)
    var date: Date?
    
    
    init() { }
    
    init (id: UUID? = nil, name: String, date: Date?) {
        self.id = id
        self.date = date
        self.name = name
    }
}
