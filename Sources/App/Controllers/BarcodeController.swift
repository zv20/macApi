//
//  SimpleBarcode.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//



import Fluent
import Vapor

struct BarcodeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let barcode = routes.grouped("barcodes")
        barcode.get(use: index)
        barcode.post(use: create)
       // battery.put(use: update)
//        battery.group(":batteryID")  { battery in
//        battery.delete(use: delete)
//        }
    }
    
    // GET request
    func index(req: Request) throws -> EventLoopFuture<[Barcode]> {
        return Barcode.query(on: req.db).all()
    }
    
    // POST Request /customer route
       func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
           let barcode = try req.content.decode(Barcode.self)
           return barcode.save(on: req.db).transform(to: .ok)
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
