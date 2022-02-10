//
//  MovieCommentModel.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/10.
//

import Foundation

struct CommentAPIResponse: Codable {
    let comment: [Comments]
}

struct Comments: Codable {
    let writer: String
    let rating: Int
    let timestamp: Int
    let movie_id: String
    let id: String
    let contents: String
}
