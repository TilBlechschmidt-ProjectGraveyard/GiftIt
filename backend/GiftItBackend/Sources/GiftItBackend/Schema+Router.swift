//
//  File.swift
//  
//
//  Created by Noah Peeters on 08.02.20.
//

import Vapor
import Graphiti

struct GraphQLRequest: Content {
    let operationName: String
    let query: String
}

extension Router {
    func serve<RootType, Context>(_ schema: Schema<RootType, Context>, root: RootType, eventLoopGroup: EventLoopGroup, at path: PathComponentsRepresentable..., contextProvider: @escaping (DatabaseConnectable) -> Context) {
        self.post(GraphQLRequest.self, at: path) { request, graphQLRequest -> EventLoopFuture<String> in
            request.withPooledConnection(to: .sqlite) { connection in
                let context = contextProvider(connection)
                return schema.execute(request: graphQLRequest.query, root: root, context: context, eventLoopGroup: eventLoopGroup)
                    .map { $0.description }

            }
        }
    }
}
