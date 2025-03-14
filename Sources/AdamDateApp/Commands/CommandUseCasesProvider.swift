//
//  CommandUseCasesProvider.swift
//  AdamDateApp
//
//  Created by Adam Young on 19/02/2025.
//

import IdentityApplication
import Vapor

extension Application.CommandUseCases.Provider {

    static var `default`: Self {
        Self { app in
            app.commandUseCases.use { app in
                IdentityApplicationFactory.makeRegisterUserUseCase(
                    repository: app.userRepository,
                    hasher: app.passwordHasherService
                )
            }
        }
    }

}
