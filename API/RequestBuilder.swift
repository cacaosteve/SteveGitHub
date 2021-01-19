//
//  RequestBuilder.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//
// Networking API by Alex Brown
// https://www.swiftcompiled.com/mvvm-swiftui-and-combine/

import Foundation

protocol RequestBuilder {
    var urlRequest: URLRequest {get}
}
