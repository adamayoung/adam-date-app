//
//  configure.swift
//  AdamDateApp
//
//  Created by Adam Young on 09/01/2025.
//

import Vapor

func configure(_ app: Application) async throws {
    try configureDatabase(on: app)
    await configureAuth(app)
    configureModules(app)
    configureCommands(app)

    try routes(app)
}
