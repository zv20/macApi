import Fluent
import Vapor

func routes(_ app: Application) throws {
     app.get { req in
       return req.view.render("index", ["title": "Baby one last time"])
   }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }
    app.get("Best") { req -> String in
        return "Hi Mt Friends"
    }
    
    try app.register(collection: MemberController())
    try app.register(collection: CustomerController())
    try app.register(collection: BarcodeController())
    try app.register(collection: BatteryController())

}
