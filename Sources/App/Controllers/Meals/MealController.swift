//
//  MealController.swift
//  
//
//  Created by Zhivko Vanev on 12.05.22.
//
///
///
import Foundation
import Vapor
//
//struct MealController: RouteCollection {
//    func boot(routes: RoutesBuilder) throws {
//        let meals = routes.grouped("meals")
//        meals.get(use: index)
//        meals.post(use: create)
//        meals.put(use: update)
//        meals.group(":mealID") {meal in
//            meal.delete(use: delete)
//        }
//    }
//    // GET request
//    func index(req: Request) throws -> EventLoopFuture<[Meal]> {
//        return Meal.query(on: req.db).all()
//    }
//
//    // POST Request /customer route
//       func create(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//           let meal = try req.content.decode(Meal.self)
//           return meal.save(on: req.db).transform(to: .ok)
//       }
//   // PUT Request /customer routs
//    func update(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        let meal = try req.content.decode(Meal.self)
//
//        return Meal.find(meal.id, on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap {
//                $0.name = meal.name
//                return $0.update(on: req.db).transform(to: .ok)
//
//        }
//    }
//    //DELETE Request /customer/id route
//
//    func delete(req: Request) throws -> EventLoopFuture<HTTPStatus> {
//        Meal.find(req.parameters.get("mealID"), on: req.db)
//            .unwrap(or: Abort(.notFound))
//            .flatMap { $0.delete(on: req.db) }
//                .transform(to: .ok)
//    }
//
//}
//
////////
//
//}
