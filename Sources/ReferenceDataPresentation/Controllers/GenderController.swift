//
//  GenderController.swift
//  AdamDateApp
//
//  Created by Adam Young on 05/02/2025.
//

import ReferenceDataApplication
import Vapor

package struct GenderController: RouteCollection, Sendable {

    package struct Dependencies {
        package let fetchGendersUseCase: @Sendable () -> any FetchGendersUseCase

        package init(
            fetchGendersUseCase: @escaping @Sendable () -> any FetchGendersUseCase
        ) {
            self.fetchGendersUseCase = fetchGendersUseCase
        }
    }

    private let dependencies: Dependencies

    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }

    package func boot(routes: any RoutesBuilder) throws {
        routes.get("genders", use: index)
    }

    @Sendable
    func index(req: Request) async throws -> [GenderResponseModel] {
        let useCase = dependencies.fetchGendersUseCase()
        let genderDTOs = try await useCase.execute()
        let genderResponseModels = genderDTOs.map(GenderResponseModelMapper.map)

        return genderResponseModels
    }

}
