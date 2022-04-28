import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return req.view.render("index", ["title": "Baby one last time"])
    }

    app.get("hello") { req -> String in
        return "Hello, world!"
    }


}
