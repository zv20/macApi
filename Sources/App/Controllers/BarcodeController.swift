//
//  SimpleBarcode.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Foundation

import Fluent
import Vapor

struct BarcodeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let battery = routes.grouped("barcodes")
        battery.get(use: index)
        battery.post(use: create)
       // battery.put(use: update)
//        battery.group(":batteryID")  { battery in
//        battery.delete(use: delete)
//        }
    }
    
    // GET request
    func index(req: Request) throws -> EventLoopFuture<[Battery]> {
        return Battery.query(on: req.db).all()
    }
    
    // POST Request /customer route
       func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
           let battery = try req.content.decode(Battery.self)
           return battery.save(on: req.db).transform(to: .ok)
       }
   // PUT Request /customer routs
//
//    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let battery = try req.content.decode(Battery.self)
//
//        return Battery.find(battery.id, on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap {
//                $0.name = battery.name
//                return $0.update(on: req.db).transform(to: .ok)
//
//        }
//    }
//       // DELETE Request /customer/id route
//
//        func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//            Battery.find(req.parameters.get("batteryID"), on: req.db)
//                .unwrap(or: Abort(.notFound))
//                .flatMap { $0.delete(on: req.db) }
//                    .transform(to: .ok)
//        }
//
//}
}
