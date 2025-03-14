//
//  FetchProfilePhotosError+AbortError.swift
//  AdamDateApp
//
//  Created by Adam Young on 06/03/2025.
//

import ProfileApplication
import Vapor

extension FetchProfilePhotosError: AbortError {

    package var status: HTTPResponseStatus {
        switch self {
        case .notFoundForProfile: .notFound
        case .unknown: .internalServerError
        }
    }

    package var reason: String {
        localizedDescription
    }

}
