//
//  MovieCommentModel.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/10.
//

import Foundation

struct CommentAPIResponse: Codable {
    let comment: [comments]
    let movie_id: String
}

struct comments: Codable {
    let writer: String
    let rating: Double
    let timestamp: Double
    let movie_id: String
    let id: String
    let contents: String
}
