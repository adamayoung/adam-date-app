//
//  Request+UseCases.swift
//  SparkedAPI
//
//  Created by Adam Young on 13/02/2025.
//

import Foundation
import ProfileApplication
import Vapor

extension Application {

    package struct ProfileWebAPIUseCases {
        package struct Provider {
            let run: (Application) -> Void

            package init(_ run: @escaping (Application) -> Void) {
                self.run = run
            }
        }

        final class Storage: @unchecked Sendable {

            var makeCreateBasicProfileUseCase: ((Application) -> CreateBasicProfileUseCase)?
            var makeFetchBasicProfileUseCase: ((Application) -> FetchBasicProfileUseCase)?

            var makeCreateBasicInfoUseCase: ((Application) -> CreateBasicInfoUseCase)?
            var makeFetchBasicInfoUseCase: ((Application) -> FetchBasicInfoUseCase)?

            var makeCreateExtendedInfoUseCase: ((Application) -> CreateExtendedInfoUseCase)?
            var makeFetchExtendedInfoUseCase: ((Application) -> FetchExtendedInfoUseCase)?

            var makeFetchProfileUseCase: ((Application) -> FetchProfileUseCase)?

            var makeAddProfilePhotoUseCase: ((Application) -> AddProfilePhotoUseCase)?
            var makeFetchProfilePhotosUseCase: ((Application) -> FetchProfilePhotosUseCase)?
            var makeFetchProfilePhotoUseCase: ((Application) -> FetchProfilePhotoUseCase)?
            var makeChangeProfilePhotoOrderUseCase:
                (
                    (Application) -> ChangeProfilePhotoOrderUseCase
                )?
            var makeDeleteProfilePhotoUseCase: ((Application) -> DeleteProfilePhotoUseCase)?

            var makeFetchProfileInterestsUseCase: ((Application) -> FetchProfileInterestsUseCase)?
            var makeAddProfileInterestUseCase: ((Application) -> AddProfileInterestUseCase)?
            var makeRemoveProfileInterestUseCase: ((Application) -> RemoveProfileInterestUseCase)?

            init() {}

        }

        struct Key: StorageKey, Sendable {
            typealias Value = Storage
        }

        let application: Application

        var createBasicProfileUseCase: CreateBasicProfileUseCase {
            guard let makeUseCase = self.storage.makeCreateBasicProfileUseCase else {
                fatalError(
                    "No CreateBasicProfileUserCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchBasicProfileUseCase: FetchBasicProfileUseCase {
            guard let makeUseCase = self.storage.makeFetchBasicProfileUseCase else {
                fatalError(
                    "No FetchBasicProfileUserCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var createBasicInfoUseCase: CreateBasicInfoUseCase {
            guard let makeUseCase = self.storage.makeCreateBasicInfoUseCase else {
                fatalError(
                    "No CreateBasicInfoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchBasicInfoUseCase: FetchBasicInfoUseCase {
            guard let makeUseCase = self.storage.makeFetchBasicInfoUseCase else {
                fatalError(
                    "No FetchBasicInfoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var createExtendedInfoUseCase: CreateExtendedInfoUseCase {
            guard let makeUseCase = self.storage.makeCreateExtendedInfoUseCase else {
                fatalError(
                    "No CreateExtendedInfoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchExtendedInfoUseCase: FetchExtendedInfoUseCase {
            guard let makeUseCase = self.storage.makeFetchExtendedInfoUseCase else {
                fatalError(
                    "No FetchExtendedInfoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchProfileUseCase: FetchProfileUseCase {
            guard let makeUseCase = self.storage.makeFetchProfileUseCase else {
                fatalError(
                    "No FetchProfileUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var addProfilePhotoUseCase: AddProfilePhotoUseCase {
            guard let makeUseCase = self.storage.makeAddProfilePhotoUseCase else {
                fatalError(
                    "No AddProfilePhotoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchProfilePhotosUseCase: FetchProfilePhotosUseCase {
            guard let makeUseCase = self.storage.makeFetchProfilePhotosUseCase else {
                fatalError(
                    "No FetchProfilePhotosUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchProfilePhotoUseCase: FetchProfilePhotoUseCase {
            guard let makeUseCase = self.storage.makeFetchProfilePhotoUseCase else {
                fatalError(
                    "No FetchProfilePhotoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var changeProfilePhotoOrderUseCase: ChangeProfilePhotoOrderUseCase {
            guard let makeUseCase = self.storage.makeChangeProfilePhotoOrderUseCase else {
                fatalError(
                    "No ChangeProfilePhotoOrderUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var deleteProfilePhotoUseCase: DeleteProfilePhotoUseCase {
            guard let makeUseCase = self.storage.makeDeleteProfilePhotoUseCase else {
                fatalError(
                    "No DeleteProfilePhotoUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var addProfileInterestUseCase: AddProfileInterestUseCase {
            guard let makeUseCase = self.storage.makeAddProfileInterestUseCase else {
                fatalError(
                    "No AddProfileInterestUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var fetchProfileInterestsUseCase: FetchProfileInterestsUseCase {
            guard let makeUseCase = self.storage.makeFetchProfileInterestsUseCase else {
                fatalError(
                    "No FetchProfileInterestsUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        var removeProfileInterestUseCase: RemoveProfileInterestUseCase {
            guard let makeUseCase = self.storage.makeRemoveProfileInterestUseCase else {
                fatalError(
                    "No RemoveProfileInterestUseCase configured. Configure with app.profileWebAPIUseCases.use(...)"
                )
            }
            return makeUseCase(self.application)
        }

        package func use(_ provider: Provider) {
            provider.run(self.application)
        }

        package func use(_ makeUseCase: @escaping (Application) -> CreateBasicProfileUseCase) {
            self.storage.makeCreateBasicProfileUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchBasicProfileUseCase) {
            self.storage.makeFetchBasicProfileUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> CreateBasicInfoUseCase) {
            self.storage.makeCreateBasicInfoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchBasicInfoUseCase) {
            self.storage.makeFetchBasicInfoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> CreateExtendedInfoUseCase) {
            self.storage.makeCreateExtendedInfoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchExtendedInfoUseCase) {
            self.storage.makeFetchExtendedInfoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchProfileUseCase) {
            self.storage.makeFetchProfileUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> AddProfilePhotoUseCase) {
            self.storage.makeAddProfilePhotoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchProfilePhotosUseCase) {
            self.storage.makeFetchProfilePhotosUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchProfilePhotoUseCase) {
            self.storage.makeFetchProfilePhotoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> ChangeProfilePhotoOrderUseCase) {
            self.storage.makeChangeProfilePhotoOrderUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> DeleteProfilePhotoUseCase) {
            self.storage.makeDeleteProfilePhotoUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> AddProfileInterestUseCase) {
            self.storage.makeAddProfileInterestUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> FetchProfileInterestsUseCase) {
            self.storage.makeFetchProfileInterestsUseCase = makeUseCase
        }

        package func use(_ makeUseCase: @escaping (Application) -> RemoveProfileInterestUseCase) {
            self.storage.makeRemoveProfileInterestUseCase = makeUseCase
        }

        func initialize() {
            self.application.storage[Key.self] = .init()
        }

        private var storage: Storage {
            if self.application.storage[Key.self] == nil {
                self.initialize()
            }

            guard let storage = application.storage[Key.self] else {
                fatalError("Unable to retrieve ProfileUseCases storage")
            }

            return storage
        }
    }

    package var profileWebAPIUseCases: ProfileWebAPIUseCases {
        .init(application: self)
    }

}

extension Request {

    var createBasicProfileUseCase: CreateBasicProfileUseCase {
        application.profileWebAPIUseCases.createBasicProfileUseCase
    }

    var fetchBasicProfileUseCase: FetchBasicProfileUseCase {
        application.profileWebAPIUseCases.fetchBasicProfileUseCase
    }

    var createBasicInfoUseCase: CreateBasicInfoUseCase {
        application.profileWebAPIUseCases.createBasicInfoUseCase
    }

    var fetchBasicInfoUseCase: FetchBasicInfoUseCase {
        application.profileWebAPIUseCases.fetchBasicInfoUseCase
    }

    var createExtendedInfoUseCase: CreateExtendedInfoUseCase {
        application.profileWebAPIUseCases.createExtendedInfoUseCase
    }

    var fetchExtendedInfoUseCase: FetchExtendedInfoUseCase {
        application.profileWebAPIUseCases.fetchExtendedInfoUseCase
    }

    var fetchProfileUseCase: FetchProfileUseCase {
        application.profileWebAPIUseCases.fetchProfileUseCase
    }

    var addProfilePhotoUseCase: AddProfilePhotoUseCase {
        application.profileWebAPIUseCases.addProfilePhotoUseCase
    }

    var fetchProfilePhotosUseCase: FetchProfilePhotosUseCase {
        application.profileWebAPIUseCases.fetchProfilePhotosUseCase
    }

    var fetchProfilePhotoUseCase: FetchProfilePhotoUseCase {
        application.profileWebAPIUseCases.fetchProfilePhotoUseCase
    }

    var changeProfilePhotoOrderUseCase: ChangeProfilePhotoOrderUseCase {
        application.profileWebAPIUseCases.changeProfilePhotoOrderUseCase
    }

    var deleteProfilePhotoUseCase: DeleteProfilePhotoUseCase {
        application.profileWebAPIUseCases.deleteProfilePhotoUseCase
    }

    var addProfileInterestUseCase: AddProfileInterestUseCase {
        application.profileWebAPIUseCases.addProfileInterestUseCase
    }

    var fetchProfileInterestsUseCase: FetchProfileInterestsUseCase {
        application.profileWebAPIUseCases.fetchProfileInterestsUseCase
    }

    var removeProfileInterestUseCase: RemoveProfileInterestUseCase {
        application.profileWebAPIUseCases.removeProfileInterestUseCase
    }

}
