//
//  CoreInfrastructureFactory.swift
//  AdamDateApp
//
//  Created by Adam Young on 19/02/2025.
//

import Foundation
import NIO
import Vapor

final class CoreInfrastructureFactory {

    private init() {}

    static func makeCacheStore() -> some CacheStore {
        InMemoryCacheStore.shared
    }

    static func makePasswordHasher(
        vaporPasswordHasher: some Vapor.PasswordHasher
    ) -> some PasswordHasher {
        VaporPasswordHasher(hasher: vaporPasswordHasher)
    }

    static func makeFileStorage(
        fileIO: NonBlockingFileIO
    ) -> some FileStorage {
        LocalFileStorage(fileIO: fileIO)
    }

}
