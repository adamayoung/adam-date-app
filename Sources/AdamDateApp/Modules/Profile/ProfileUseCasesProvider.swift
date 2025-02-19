//
//  ProfileUsesCasesProvider.swift
//  AdamDateApp
//
//  Created by Adam Young on 13/02/2025.
//

import Fluent
import Foundation
import IdentityApplication
import ProfileApplication
import ProfileDomain
import ProfileInfrastructure
import ProfilePresentation
import ReferenceDataApplication
import Vapor

extension Application.ProfileUseCases.Provider {

    static var `default`: Self {
        Self { app in
            app.profileUseCases.use { app in
                ProfileApplicationFactory.makeFetchProfileUseCase(
                    basicProfileRepository: app.basicProfileRepository,
                    basicInfoRepository: app.basicInfoRepository
                )
            }

            app.profileUseCases.use { app in
                ProfileApplicationFactory.makeCreateBasicProfileUseCase(
                    repository: app.basicProfileRepository,
                    userService: app.profileUserService
                )
            }

            app.profileUseCases.use { app in
                ProfileApplicationFactory.makeFetchBasicProfileUseCase(
                    repository: app.basicProfileRepository
                )
            }

            app.profileUseCases.use { app in
                ProfileApplicationFactory.makeCreateBasicInfoUseCase(
                    repository: app.basicInfoRepository,
                    userService: app.profileUserService,
                    countryService: app.profileCountryService,
                    genderService: app.profileGenderService
                )
            }

            app.profileUseCases.use { app in
                ProfileApplicationFactory.makeFetchBasicInfoUseCase(
                    repository: app.basicInfoRepository
                )
            }
        }
    }

}

extension Application {

    var basicProfileRepository: any BasicProfileRepository {
        ProfileInfrastructureFactory.makeBasicProfileRepository(
            database: self.db(DatabaseID.profile)
        )
    }

    var basicInfoRepository: any BasicInfoRepository {
        ProfileInfrastructureFactory.makeBasicInfoRepository(
            database: self.db(DatabaseID.profile)
        )
    }

    var profileCountryService: any CountryService {
        ProfileAdapterFactory.makeCountryService(
            fetchCountryUseCase: ReferenceDataApplicationFactory.makeFetchCountryUseCase(
                countryRepository: self.countryRepository
            )
        )
    }

    var profileGenderService: any GenderService {
        ProfileAdapterFactory.makeGenderService(
            fetchGenderUseCase: ReferenceDataApplicationFactory.makeFetchGenderUseCase(
                genderRepository: self.genderRepository
            )
        )
    }

    var profileUserService: any UserService {
        ProfileAdapterFactory.makeUserService(
            fetchUserUseCase: IdentityApplicationFactory.makeFetchUserUseCase(
                repository: self.userRepository
            )
        )
    }

}
