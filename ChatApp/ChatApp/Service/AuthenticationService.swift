//
//  AuthenticationService.swift
//  ChatApp
//
//  Created by 김효성 on 2022/01/16.
//

import FirebaseAuth

protocol AuthenticationServiceProtocol {
    func create(email: String?, password: String?) async throws -> (result: AuthDataResult?, error: Error?)
}

struct AuthenticationService: AuthenticationServiceProtocol { }

extension AuthenticationService {
    func create(email: String?, password: String?) async throws -> (result: AuthDataResult?, error: Error?) {
        try await withCheckedThrowingContinuation { continuation in
            Auth.auth().createUser(withEmail: email ?? "",
                                   password: password ?? "") { result, error in
                guard let result = result else {
                    return continuation.resume(throwing: NSError(domain: "result is nil",
                                                                 code: -1,
                                                                 userInfo: nil))
                }
                continuation.resume(returning: (result, error))
            }
        }
    }
}

