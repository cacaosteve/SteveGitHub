//
//  GitHubListView.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//

import SwiftUI
import SwiftUIX

struct GitHubListView: View {
    @ObservedObject var gitHubViewModel = GitHubViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.backgroundLead
    }
    
    var body: some View {
        VStack {
            NavigationView {
                if (gitHubViewModel.loading) {
                    ActivityIndicator()
                        .animated(true)
                        .style(.large)
                }
                else {
                    List {
                        ForEach(gitHubViewModel.commits) { commit in
                            CommitRowView(commit: commit)
                                .listRowBackground(Color.backgroundLead)
                        }
                    }
                    .navigationBarTitle("Commits")
                }
            }
        }
        .onAppear() {
            gitHubViewModel.getCommits()
        }
    }
}

struct CommitRowView: View {
    let commit: ResponseElement
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(commit.commit?.author?.name ?? "")
                    .foregroundColor(Color.brandSilver)
                Text(commit.commit?.author?.dateString ?? "")
                    .foregroundColor(Color.brandSilver)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.top)
            .padding(.bottom)
            HStack {
                Text(commit.shaFirstEightCharacters)
                    .foregroundColor(Color.brandSilver)
                Text(commit.commit?.message ?? "")
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.bottom)
        }
        .background(Color.backgroundLead)
    }
}
