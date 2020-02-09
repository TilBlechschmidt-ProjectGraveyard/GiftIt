//
//  DatabaseStore.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import Vapor
import FluentSQLite

struct DatabaseStore: GiftItStore {
    private let databaseConnectable: DatabaseConnectable

    init(databaseConnectable: DatabaseConnectable) {
        self.databaseConnectable = databaseConnectable
    }

    func getUser(id: Int, eventLoopGroup: EventLoopGroup) -> EventLoopFuture<User?> {
        User.query(on: databaseConnectable)
            .filter(\.id, SQLiteBinaryOperator.equal, id)
            .first()
    }
}
