//
//  APIError.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//
// Networking API by Alex Brown
// https://www.swiftcompiled.com/mvvm-swiftui-and-combine/

import Foundation

enum APIError: Error {
    case decodingError
    case httpError(Int)
    case unknown
}

