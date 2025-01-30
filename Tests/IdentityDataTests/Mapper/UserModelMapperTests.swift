//
//  UserModelMapperTests.swift
//  AdamDateApp
//
//  Created by Adam Young on 28/01/2025.
//

import Foundation
import IdentityDomain
import Testing

@testable import IdentityData

@Suite("UserModelMapper")
struct UserModelMapperTests {

    let passwordHasher: PasswordHasherStubProvider

    init() {
        self.passwordHasher = PasswordHasherStubProvider()
    }

    @Test("map from register user input with first name")
    func mapFromRegisterUserInputWithFirstName() throws {
        let firstName = "Dave"
        let input = Self.buildRegisterUserInput(firstName: firstName)

        let user = try UserModelMapper.map(from: input, using: passwordHasher)

        #expect(user.firstName == firstName)
    }

    @Test("map from register user input with family name")
    func mapFromRegisterUserInputWithLastName() throws {
        let familyName = "Smith"
        let input = Self.buildRegisterUserInput(familyName: familyName)

        let user = try UserModelMapper.map(from: input, using: passwordHasher)

        #expect(user.familyName == familyName)
    }

    @Test("map from register user input with email")
    func mapFromRegisterUserInputWithEmail() throws {
        let email = "email@example.com"
        let input = Self.buildRegisterUserInput(email: email)

        let user = try UserModelMapper.map(from: input, using: passwordHasher)

        #expect(user.email == email)
    }

    @Test("map from register user input with password")
    func mapFromRegisterUserInputWithPassword() throws {
        let password = "password123"
        let expectedPassword = String("password123".reversed())
        let input = Self.buildRegisterUserInput(password: password)
        passwordHasher.hashResult = .success(expectedPassword)

        let user = try UserModelMapper.map(from: input, using: passwordHasher)

        #expect(user.password == expectedPassword)
        #expect(passwordHasher.hashLastPassword == password)
    }

}

extension UserModelMapperTests {

    private static func buildRegisterUserInput(
        firstName: String = "",
        familyName: String = "",
        email: String = "",
        password: String = "",
        isVerified: Bool = false,
        isAdmin: Bool = false
    ) -> RegisterUserInput {
        RegisterUserInput(
            firstName: firstName,
            familyName: familyName,
            email: email,
            password: password,
            isVerified: isVerified,
            isAdmin: isAdmin
        )
    }

}
