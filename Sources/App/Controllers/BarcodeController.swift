//
//  File.swift
//  
//
//  Created by Zhivko Vanev on 20.05.22.
//

import Fluent
import Vapor

struct BarcodeController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let barcodes = routes.grouped("barcodes")
        barcodes.get(use: index)
        barcodes.post(use: create)
        barcodes.put(use: update)
        barcodes.group(":barcodeID")  { barcode in
            barcode.delete(use: delete)
        }
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
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let barcode = try req.content.decode(Barcode.self)
        
        return Barcode.find(barcode.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.codeB = barcode.codeB
                return $0.update(on: req.db).transform(to: .ok)
                
        }
    }
        //DELETE Request /customer/id route
        
        func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            Barcode.find(req.parameters.get("barcodeID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { $0.delete(on: req.db) }
                    .transform(to: .ok)
        }
    
}
