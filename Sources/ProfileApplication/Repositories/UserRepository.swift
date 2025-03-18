//
//  UserRepository.swift
//  AdamDateApp
//
//  Created by Adam Young on 17/03/2025.
//

import Foundation
import ProfileDomain

package protocol UserRepository {

    func fetch(byID id: User.ID) async throws(UserRepositoryError) -> User

}

package enum UserRepositoryError: Error, Equatable {

    case notFound
    case unknown(Error? = nil)

    package static func == (lhs: UserRepositoryError, rhs: UserRepositoryError) -> Bool {
        switch (lhs, rhs) {
        case (.notFound, .notFound):
            return true
        case (.unknown(let lhsError), .unknown(let rhsError)):
            return lhsError?.localizedDescription == rhsError?.localizedDescription
        default:
            return false
        }
    }

}
