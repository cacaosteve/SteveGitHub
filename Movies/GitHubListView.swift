//
//  GitHubListView.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//

import SwiftUI

struct GitHubListView: View {
    @ObservedObject var viewModel = GitHubViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.backgroundLead
    }
    
    var body: some View {
        VStack {
            NavigationView {
                List {
                    ForEach(viewModel.commits) { commit in
                        CommitRowView(commit: commit)
                            .listRowBackground(Color.backgroundLead)
                    }
                }
                //.navigationBarTitle("")
            }
        }
    }
}

struct CommitRowView: View {
    let commit: ResponseElement
    
    var body: some View {
        VStack() {
            Text(commit.sha ?? "")
            Text(commit.commit?.message ?? "")
            Text(commit.commit?.author?.name ?? "")
        }
        .background(Color.backgroundLead)
    }
}
