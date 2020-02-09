//
//  schema.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import Graphiti

typealias Field<ObjectType: FieldKeyProvider, Arguments: Decodable, FieldType, ResolveType> = Graphiti.Field<ObjectType, ObjectType.FieldKey, GiftItStore, Arguments, FieldType, ResolveType>
typealias GiftItType<ObjectType: Encodable & FieldKeyProvider> = Type<GiftItAPI, GiftItStore, ObjectType>
typealias Types = Graphiti.Types<GiftItAPI, GiftItStore>

let giftItScheme = Schema<GiftItAPI, GiftItStore> {
    GiftItType(Wish.self) {
        Field(.id, at: \Wish.id)
        Field(.title, at: \Wish.title)
    }
    .description("A wish of a user")

    GiftItType(User.self) {
        Field(.id, at: \User.id)
        Field(.name, at: \User.name)
    }
    .description("A user of the service")

    Query {
        Field(.user, at: GiftItAPI.getUser)
            .description("Returns a single user base on its id")
            .argument(.id, at: \.id, description: "The id of the user.")
    }

    Types(Wish.self, User.self)
}
