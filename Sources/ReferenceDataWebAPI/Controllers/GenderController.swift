//
//  GenderController.swift
//  AdamDateApp
//
//  Created by Adam Young on 05/02/2025.
//

import ReferenceDataApplication
import Vapor

struct GenderController: RouteCollection, Sendable {

    func boot(routes: any RoutesBuilder) throws {
        let genders = routes.grouped("genders")
        genders.get(use: index)
        genders.get(":genderID", use: show)
    }

    @Sendable
    func index(req: Request) async throws -> [GenderResponseModel] {
        let genderDTOs = try await req.fetchGendersUseCase.execute()
        let genderResponseModels = genderDTOs.map(GenderResponseModelMapper.map)

        return genderResponseModels
    }

    @Sendable
    func show(req: Request) async throws -> GenderResponseModel {
        guard
            let genderIDString = req.parameters.get("genderID", as: String.self),
            let genderID = UUID(uuidString: genderIDString)
        else {
            throw Abort(.notFound)
        }

        let genderDTO = try await req.fetchGenderUseCase.execute(id: genderID)
        let genderResponseModel = GenderResponseModelMapper.map(from: genderDTO)

        return genderResponseModel
    }

}
