//
//  Wish.swift
//  Async
//
//  Created by Noah Peeters on 08.02.20.
//

import Vapor
import FluentSQLite

/// A single entry of a Wish list.
final class Wish: SQLiteModel {
    /// The unique identifier for this `Wish`.
    var id: Int?

    /// A title describing what this `Wish` entails.
    var title: String

    /// Creates a new `Wish`.
    init(id: Int? = nil, title: String) {
        self.id = id
        self.title = title
    }
}

/// Allows `Wish` to be used as a dynamic migration.
extension Wish: Migration { }

/// Allows `Wish` to be encoded to and decoded from HTTP messages.
extension Wish: Content { }

/// Allows `Wish` to be used as a dynamic parameter in route definitions.
extension Wish: Parameter { }
