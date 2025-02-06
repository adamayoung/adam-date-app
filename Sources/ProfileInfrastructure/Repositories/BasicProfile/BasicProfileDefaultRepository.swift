//
//  BasicProfileDefaultRepository.swift
//  AdamDateApp
//
//  Created by Adam Young on 24/01/2025.
//

import Fluent
import Foundation
import ProfileApplication
import ProfileDomain

package final class BasicProfileDefaultRepository: BasicProfileRepository {

    private let remoteDataSource: any BasicProfileRemoteDataSource

    package init(remoteDataSource: some BasicProfileRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    package func create(
        input: CreateBasicProfileInput
    ) async throws(CreateBasicProfileError) -> BasicProfile {
        let newBasicProfile = try await remoteDataSource.create(input: input)

        return newBasicProfile
    }

    package func fetch(
        byID id: BasicProfile.ID
    ) async throws(FetchBasicProfileError) -> BasicProfile {
        let basicProfile = try await remoteDataSource.fetch(byID: id)

        return basicProfile
    }

    package func fetch(byUserID userID: UUID) async throws(FetchBasicProfileError) -> BasicProfile {
        let basicProfile = try await remoteDataSource.fetch(byUserID: userID)

        return basicProfile
    }

}
