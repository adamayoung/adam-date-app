//
//  FetchBasicInfoError.swift
//  AdamDateApp
//
//  Created by Adam Young on 04/02/2025.
//

import Foundation

package enum FetchBasicInfoError: LocalizedError, Equatable, Sendable {

    case notFound(id: UUID)
    case notFoundForUser(userID: UUID)
    case notFoundForProfile(profileID: UUID)
    case unknown(Error? = nil)

    package var errorDescription: String? {
        switch self {
        case .notFound(let id):
            "Basic Profile Info \(id) not found"

        case .notFoundForUser(let userID):
            "Basic Profile Info for user \(userID) not found"

        case .notFoundForProfile(let profileID):
            "Basic Profile Info for profile \(profileID) not found"

        case .unknown(let error):
            "Unknown error: \(error?.localizedDescription ?? "No description available")"
        }
    }

    package static func == (lhs: FetchBasicInfoError, rhs: FetchBasicInfoError) -> Bool {
        switch (lhs, rhs) {
        case (.notFound(let lhsID), .notFound(let rhsID)):
            lhsID == rhsID

        case (.notFoundForUser(let lhsUserID), .notFoundForUser(let rhsUserID)):
            lhsUserID == rhsUserID

        case (.notFoundForProfile(let lhsProfileID), .notFoundForProfile(let rhsProfileID)):
            lhsProfileID == rhsProfileID

        case (.unknown(let lhsError), .unknown(let rhsError)):
            lhsError?.localizedDescription == rhsError?.localizedDescription

        default:
            false
        }
    }

}
