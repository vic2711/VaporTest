//
//  User.swift
//  App
//
//  Created by Viktor Miroshnychenko on 5/4/19.
//

import Vapor
import FluentSQLite
import Fluent
import Authentication

struct User: SQLiteUUIDModel {
   var id: UUID?
   private(set) var email: String
   private(set) var password: String

}

extension User: BasicAuthenticatable {
   static let usernameKey: WritableKeyPath<User, String> = \.email
   static let passwordKey: WritableKeyPath<User, String> = \.password
}

extension User: Content {}

extension User: Migration {}
