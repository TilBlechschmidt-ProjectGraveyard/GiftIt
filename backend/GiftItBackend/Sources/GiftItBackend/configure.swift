//
//  configure.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: Environment, _ services: inout Services, eventLoopGroup: EventLoopGroup) throws {

    let root = GiftItAPI()
    // Register providers first
    try services.register(FluentSQLiteProvider())

    // Register routes to the router
    let router = EngineRouter.default()
    staticRoutes(router)
    router.serve(giftItScheme, root: root, eventLoopGroup: eventLoopGroup, at: "api") { connectable in
        DatabaseStore(databaseConnectable: connectable)
    }
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)

    // Configure a SQLite database
    let sqlite = try SQLiteDatabase(storage: .memory)

    // Register the configured SQLite database to the database config.
    var databases = DatabasesConfig()
    databases.add(database: sqlite, as: .sqlite)
    services.register(databases)

    // Configure migrations
    var migrations = MigrationConfig()
    migrations.add(model: Wish.self, database: .sqlite)
    migrations.add(model: User.self, database: .sqlite)
    services.register(migrations)
}
