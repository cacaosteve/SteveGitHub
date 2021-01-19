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
                .navigationBarTitle("Commits")
            }
        }
    }
}

struct CommitRowView: View {
    let commit: ResponseElement
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(commit.commit?.author?.name ?? "")
                .foregroundColor(Color.brandSilver)
            Text(commit.sha ?? "")
                .foregroundColor(Color.brandSilver)
            Text(commit.commit?.message ?? "")
                .foregroundColor(Color.brandSilver)
            Text(commit.commit?.author?.dateString ?? "")
                .foregroundColor(Color.brandSilver)
        }
        .background(Color.backgroundLead)
    }
}
