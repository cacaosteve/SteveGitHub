//
//  APIService.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//
// Networking API by Alex Brown
// https://www.swiftcompiled.com/mvvm-swiftui-and-combine/

import Foundation
import Combine
import UIKit

protocol APIService {
    func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
