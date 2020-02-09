import Vapor

/// Register your application's routes here.
public func staticRoutes(_ router: Router) {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
}
