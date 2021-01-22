//
//  GitHubViewModel.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//
import Foundation
import Combine
import SwiftUI

class GitHubViewModel: ObservableObject, GitHubService {
    var apiSession: APIService
    @Published var commits = Response()
    @Published var loading = false
    
    var cancellables = Set<AnyCancellable>()
    
    init(apiSession: APIService = APISession()) {
        self.apiSession = apiSession
        //getCommits()
    }
    
    func getCommits() {
        self.loading = true
        let cancellable = self.getCommits()
            .sink(receiveCompletion: { result in
                self.loading = false
                switch result {
                case .failure(let error):
                    print("Handle error: \(error)")
                case .finished:
                    break
                }
            }) { (response) in
                self.commits = response
            }
        cancellables.insert(cancellable)
    }
}

