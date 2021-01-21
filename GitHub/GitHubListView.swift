//
//  GitHubListView.swift
//  SteveGitHub
//
//  Created by steve on 1/15/21.
//

import SwiftUI
import SwiftUIX

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
//            ActivityIndicator()
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
