//
//  RegisterUserStubUseCase.swift
//  AdamDateApp
//
//  Created by Adam Young on 29/01/2025.
//

import Foundation
import IdentityDomain
import IdentityEntities

final class RegisterUserStubUseCase: RegisterUserUseCase, @unchecked Sendable {

    var executeResult: Result<User, RegisterUserError> = .failure(.unknown())
    private(set) var lastExecuteInput: RegisterUserInput?

    @discardableResult
    func execute(input: RegisterUserInput) async throws(RegisterUserError) -> User {
        lastExecuteInput = input

        return try executeResult.get()
    }

}
