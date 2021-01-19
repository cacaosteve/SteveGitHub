//
//  GitHubService.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//
// Networking API by Alex Brown
// https://www.swiftcompiled.com/mvvm-swiftui-and-combine/

import Foundation
import Combine
import UIKit

protocol GitHubService {
    var apiSession: APIService {get}
    
    func getCommits() -> AnyPublisher<Response, APIError>
}

extension GitHubService {
    func getCommits() -> AnyPublisher<Response, APIError> {
        return apiSession.request(with: GitHubEndpoint.steveGitHub)
            .eraseToAnyPublisher()
    }
}
