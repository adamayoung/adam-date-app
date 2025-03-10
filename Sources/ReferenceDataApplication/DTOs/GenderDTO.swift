//
//  GenderDTO.swift
//  AdamDateApp
//
//  Created by Adam Young on 05/02/2025.
//

import Foundation

package struct GenderDTO: Identifiable, Equatable, Sendable {

    package let id: UUID
    package let code: String
    package let name: String

    package init(
        id: UUID,
        code: String,
        name: String
    ) {
        self.id = id
        self.code = code
        self.name = name
    }

}
