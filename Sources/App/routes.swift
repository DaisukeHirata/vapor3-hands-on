import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    router.get("hello", "vapor") { req in
        return "Hello, Vapor!"
    }

    router.get("hello", String.parameter) { req -> String in
        let name = try req.parameters.next(String.self)
        return "Hello, \(name)!"
    }

    router.post(InfoData.self, at: "info") { req, data -> String in
        return "Hello \(data.name)!"
    }
}

struct InfoData: Content {
    let name: String
}
