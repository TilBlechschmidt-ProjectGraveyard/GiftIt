//
//  MockData.swift
//  
//
//  Created by Noah Peeters on 09.02.20.
//

import Vapor
import FluentSQLite

let mockUser = [
    User(id: 0, name: "Max Musterman"),
    User(id: 1, name: "Hans Müller")
]

func createMockData(app: Application) throws {
    _ = try app.withPooledConnection(to: .sqlite) { connection in
        EventLoopFuture.andAll(mockUser.map { $0.create(on: connection) }, eventLoop: MultiThreadedEventLoopGroup.currentEventLoop!)
    }.wait()
}
