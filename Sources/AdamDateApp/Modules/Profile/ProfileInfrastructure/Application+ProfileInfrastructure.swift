//
//  Application+ProfileInfrastructure.swift
//  AdamDateApp
//
//  Created by Adam Young on 10/03/2025.
//

import Fluent
import Foundation
import IdentityApplication
import ProfileApplication
import ProfileInfrastructure
import ProfileWebAPI
import ReferenceDataApplication
import Vapor

extension Application {

    var basicProfileRepository: any BasicProfileRepository {
        ProfileInfrastructureFactory.makeBasicProfileRepository(
            database: self.db(DatabaseID.adamDate)
        )
    }

    var basicInfoRepository: any BasicInfoRepository {
        ProfileInfrastructureFactory.makeBasicInfoRepository(
            database: self.db(DatabaseID.adamDate)
        )
    }

    var profilePhotoRepository: any ProfilePhotoRepository {
        ProfileInfrastructureFactory.makeProfilePhotoRepository(
            database: self.db(DatabaseID.adamDate)
        )
    }

    var imageRepository: any ImageRepository {
        ProfileInfrastructureFactory.makeImageRepository(
            fileStorageService: ProfileAdapterFactory.makeProfileFileStorageService(
                fileStorage: self.fileStorage,
                containerName: "profile"
            )
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
