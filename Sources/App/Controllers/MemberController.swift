//
//  MemberController.swift
//  
//
//  Created by Zhivko Vanev on 29.04.22.
//

import Fluent
import Vapor

struct MemberController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let members = routes.grouped("members")
        members.get(use: index)
        members.post(use: create)
        members.put(use: update)
        members.group(":memberID")  { member in
            member.delete(use: delete)
        }
    }
    
    // GET request
    func index(req: Request) throws -> EventLoopFuture<[Member]> {
        return Member.query(on: req.db).all()
    }
    
    // POST Request /customer route
       func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
           let member = try req.content.decode(Member.self)
           return member.save(on: req.db).transform(to: .ok)
       }
   // PUT Request /customer routs
    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
        let member = try req.content.decode(Member.self)
        
        return Member.find(member.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap {
                $0.name = member.name
                return $0.update(on: req.db).transform(to: .ok)
                
        }
    }
        //DELETE Request /customer/id route
        
        func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
            Member.find(req.parameters.get("memberID"), on: req.db)
                .unwrap(or: Abort(.notFound))
                .flatMap { $0.delete(on: req.db) }
                    .transform(to: .ok)
        }
    
}
