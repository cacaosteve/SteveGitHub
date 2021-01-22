//
//  GitHubEndpoint.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//

import Foundation

enum GitHubEndpoint {
    case steveGitHub
}

extension GitHubEndpoint: RequestBuilder {
    var urlRequest: URLRequest {
        switch self {
        case .steveGitHub:
            var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "api.github.com"
            urlComponents.path = "/repos/cacaosteve/SteveGitHub/commits"
            urlComponents.query = "per_page=25"
            urlComponents.query = "page=1"
            
            guard let url = urlComponents.url
                else {preconditionFailure("Invalid URL format")}
            let request = URLRequest(url: url)
            return request
        }
    }
}
