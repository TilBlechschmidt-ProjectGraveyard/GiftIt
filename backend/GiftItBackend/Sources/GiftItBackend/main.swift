import Vapor

do {
    var config = Config.default()
    var env = try Environment.detect()
    var services = Services.default()
    try configure(&config, &env, &services)

    let app = try Application(config: config, environment: env, services: services)

    try app.run()
} catch {
    print("Failed to start app due to error")
    print(error.localizedDescription)
}
