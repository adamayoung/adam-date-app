//
//  BasicProfileMapper.swift
//  AdamDateApp
//
//  Created by Adam Young on 24/01/2025.
//

import Foundation
import ProfileDomain

struct BasicProfileMapper {

    private init() {}

    static func map(from model: BasicProfileModel) throws -> BasicProfile {
        try BasicProfile(
            id: model.requireID(),
            userID: model.userID,
            displayName: model.displayName,
            birthDate: model.birthDate
        )
    }

}
