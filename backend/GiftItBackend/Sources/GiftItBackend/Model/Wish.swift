//
//  Wish.swift
//
//
//  Created by Noah Peeters on 08.02.20.
//

import FluentSQLite
import Graphiti

/// A single entry of a Wish list.
final class Wish: SQLiteModel {
    /// The unique identifier for this `Wish`.
    var id: Int?

    /// A title describing what this `Wish` entails.
    var title: String

    var url: URL?

    var price: Int

    /// Creates a new `Wish`.
    init(id: Int? = nil, title: String, url: URL?, price: Int) {
        self.id = id
        self.title = title
        self.url = url
        self.price = price
    }
}

/// Allows `Wish` to be used as a dynamic migration.
extension Wish: Migration { }

extension Wish: FieldKeyProvider {
    typealias FieldKey = FieldKeys

    enum FieldKeys: String {
        case id
        case title
        case url
        case price
    }
}
