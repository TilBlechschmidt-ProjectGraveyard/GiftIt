//
//  MockGiftItStore.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import NIO

final class MockGiftItStore: GiftItStore {
    func getUser(id: Int, eventLoopGroup: EventLoopGroup) -> EventLoopFuture<User?> {
        eventLoopGroup.next().newSucceededFuture(result: User(id: id, name: "User with the id \(id)"))
    }
}
