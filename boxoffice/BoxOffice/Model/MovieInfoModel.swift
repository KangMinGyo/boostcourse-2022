//
//  MovieInfoModel.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/09.
//

import Foundation

//struct MovieInfoAPIResponse: Codable {
//    let moviesInfo: [MovieInfo]
//}

struct MovieInfo: Codable {
    let title: String
    let grade: Int
    let audience: Int
    let date: String
    let synopsis: String
    let duration: Int
    let genre: String
    let actor: String
    let reservation_rate: Double
    let id: String
    let user_rating: Double
    let reservation_grade: Int
    let image: String
    let director: String
    
    var grandAndRate: String {
        return String(reservation_grade) + "위 " + String(format: "%.2f", reservation_rate)
    }
}
