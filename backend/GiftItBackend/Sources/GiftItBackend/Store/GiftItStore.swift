//
//  GiftItStore.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import Foundation
import Vapor

protocol GiftItStore {
    func getUser(id: Int, eventLoopGroup: EventLoopGroup) -> EventLoopFuture<User?>
}
