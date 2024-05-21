//
//  RepositoryError.swift
//  SwiftOde
//
//  Created by caio sanchez christino on 20/05/24.
//

public enum RepositoryError: Error {
    case authenticationError
    case httpError(code: Int, message: String)
    case internetConnectionError
    case unknownError
}
