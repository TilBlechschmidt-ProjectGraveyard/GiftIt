//
//  User.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import FluentSQLite
import Graphiti

/// A single entry of a User list.
final class User: SQLiteModel {
    var id: Int?

    var name: String

    /// Creates a new `Wish`.
    init(id: Int? = nil, name: String) {
        self.id = id
        self.name = name
    }
}

/// Allows `User` to be used as a dynamic migration.
extension User: Migration { }

extension User: FieldKeyProvider {
    typealias FieldKey = FieldKeys

    enum FieldKeys: String {
        case id
        case name
    }
}
