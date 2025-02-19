//
//  FetchGenders.swift
//  AdamDateApp
//
//  Created by Adam Young on 04/02/2025.
//

import Foundation
import ReferenceDataDomain

final class FetchGenders: FetchGendersUseCase {

    private let repository: any GenderRepository

    init(repository: some GenderRepository) {
        self.repository = repository
    }

    func execute() async throws(FetchGendersError) -> [GenderDTO] {
        let genders: [Gender]
        do {
            genders = try await repository.fetchAll()
        } catch let error {
            throw .unknown(error)
        }

        let genderDTOS = genders.map(GenderDTOMapper.map)
            .sorted { $0.name.localizedCompare($1.name) == .orderedAscending }

        return genderDTOS
    }

}
