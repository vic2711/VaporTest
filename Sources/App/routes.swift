import Vapor
import Authentication
import Crypto

/// Register your application's routes here.
public func routes(_ router: Router) throws {

   let todoController = TodoController()
   let basicAuthMiddleware = User.basicAuthMiddleware(using: BCrypt)
   let guardAuthMiddleware = User.guardAuthMiddleware()
   let basicAuthGroup = router.grouped([basicAuthMiddleware, guardAuthMiddleware])

   router.get("todos", use: todoController.index)
   basicAuthGroup.post("todos", use: todoController.create)
   basicAuthGroup.delete("todos", Todo.parameter, use: todoController.delete)

   let userRouteController = UserController()
   try userRouteController.boot(router: router)


    // Example of configuring a controller
//    let todoController = TodoController()
//    router.get("todos", use: todoController.index)
//    router.post("todos", use: todoController.create)
//    router.delete("todos", Todo.parameter, use: todoController.delete)

   //Some tests

//   router.get("myroute") { req in
//      return "A new route!"
//   }
//
//   router.get("my", "route") { req in
//      return "Divided path"
//   }
//
//   router.get("items", String.parameter) { req -> String in
//      let id = try req.parameters.next(String.self)
//      return "parameter #\(id)"
//   }
}
