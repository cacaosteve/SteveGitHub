// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let response = try? newJSONDecoder().decode(Response.self, from: jsonData)

import Foundation

// MARK: - ResponseElement
struct ResponseElement: Codable, Identifiable {
//    let nodeID: String
    let id = UUID()
    
    let sha: String?
    let commit: Commit?
//    let url, htmlURL, commentsURL: String?
//    let author, committer: ResponseAuthor?
//    let parents: [Parent]?
    
    var shaFirstEightCharacters: String {
        guard sha != nil else {
            return ""
        }
        
        let startIndex = sha!.index(sha!.startIndex, offsetBy: 0)
        let endIndex = sha!.index(startIndex, offsetBy: 8)

        return String(sha![startIndex..<endIndex])
    }

    enum CodingKeys: String, CodingKey {
//        case nodeID = "node_id"
        case sha = "sha"
        case commit = "commit"
//        case url
//        case commit, url
//        case htmlURL = "html_url"
//        case commentsURL = "comments_url"
//        case author, committer, parents
    }
}

//// Now conform to Identifiable
//extension ResponseElement: Identifiable {
//    var id: String { return nodeID }
//}

// MARK: - ResponseAuthor
struct ResponseAuthor: Codable {
    let login: String?
    let id: Int?
    let nodeID: String?
    let avatarURL: String?
    let gravatarID: String?
    let url, htmlURL, followersURL: String?
    let followingURL, gistsURL, starredURL: String?
    let subscriptionsURL, organizationsURL, reposURL: String?
    let eventsURL: String?
    let receivedEventsURL: String?
    let type: String?
    let siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

// MARK: - Commit
struct Commit: Codable {
    let author: CommitAuthor?
//    let committer: CommitAuthor?
    let message: String?
//    let tree: Tree?
//    let url: String?
//    let commentCount: Int?
//    let verification: Verification?

    enum CodingKeys: String, CodingKey {
        case message
        case author
//        case author, committer, message, tree, url
//        case commentCount = "comment_count"
//        case verification
    }
}

// MARK: - CommitAuthor
struct CommitAuthor: Codable {
    let name: String?
//    let name, email: String?
    let date: Date?
    
    var dateString: String {
        let formatter1 = DateFormatter()
        formatter1.dateStyle = .long
        return formatter1.string(from: date ?? Date())
    }
}

// MARK: - Tree
struct Tree: Codable {
    let sha: String?
    let url: String?
}

// MARK: - Verification
struct Verification: Codable {
    let verified: Bool?
    let reason: String?
    let signature, payload: String?
}

// MARK: - Parent
struct Parent: Codable {
    let sha: String?
    let url, htmlURL: String?

    enum CodingKeys: String, CodingKey {
        case sha, url
        case htmlURL = "html_url"
    }
}

typealias Response = [ResponseElement]
