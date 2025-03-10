//
//  configureModules.swift
//  AdamDateApp
//
//  Created by Adam Young on 19/02/2025.
//

import IdentityPresentation
import ProfilePresentation
import ReferenceDataPresentation
import Vapor

func configureModules(on app: Application) {
    app.profileUseCases.use(.default)
    app.identityUseCases.use(.default)
    app.identityServices.use(.default)
    app.referenceDataUseCases.use(.default)
}
