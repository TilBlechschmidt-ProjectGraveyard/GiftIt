//
//  File.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import Graphiti
import NIO

class GiftItAPI: FieldKeyProvider {
    typealias FieldKey = FieldKeys

    enum FieldKeys : String {
        case id
        case user
    }

    struct UserArguments: Codable {
        let id: Int
    }

    func getUser(store: GiftItStore, arguments: UserArguments, eventLoopGroup: EventLoopGroup) -> EventLoopFuture<User?> {
        store.getUser(id: arguments.id, eventLoopGroup: eventLoopGroup)
    }
}
