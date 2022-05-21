//
//  CustomerController.swift
// hello git hub 
//  Created by Zhivko Vanev on 28.04.22.
//

import Fluent
import Vapor

struct CustomerController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let customers = routes.grouped("customers")
        customers.get(use: index)
        customers.post(use: create)
        customers.put(use: update)
        customers.group(":customerID")  { customer in
            customer.delete(use: delete)
        }
    }
    
    // GET request
    func index(req: Request) throws -> EventLoopFuture<[Barcode]> {
        return Barcode.query(on: req.db).all()
    }
    
    // POST Request /customer route
       func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
           let customer = try req.content.decode(Barcode.self)
           return customer.save(on: req.db).transform(to: .ok)
       }
   // PUT Request /customer routs
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let customer = try req.content.decode(Barcode.self)
        
        return Barcode.find(customer.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.barcode = customer.barcode
                return $0.update(on: req.db).transform(to: .ok)
                
        }
    }
        //DELETE Request /customer/id route
        
        func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            Barcode.find(req.parameters.get("customerID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { $0.delete(on: req.db) }
                    .transform(to: .ok)
        }
    
}
