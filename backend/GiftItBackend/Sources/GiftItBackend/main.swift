import Vapor
import Graphiti

import NIO

let eventLoopGroup = MultiThreadedEventLoopGroup(numberOfThreads: 1)

defer {
    try? eventLoopGroup.syncShutdownGracefully()
}

do {
    var config = Config.default()
    let env = try Environment.detect()
    var services = Services.default()
    try configure(&config, env, &services, eventLoopGroup: eventLoopGroup)

    let app = try Application(config: config, environment: env, services: services)

    try createMockData(app: app)
    try app.run()
} catch {
    print("Failed to start app due to error")
    print(error.localizedDescription)
}
