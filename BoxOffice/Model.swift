//
//  Movies.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/06.
//

import Foundation

struct APIResponse: Codable {
    let movies: [Movies]
}

struct Movies: Codable {
    let title: String //제목
    let grade: Int //연령
    let date: String //개봉일
    let thumb: String //썸네일
    let reservation_rate: Double //예매율
    let id: String
    let user_rating: Double //평점
    let reservation_grade: Int //순위
    
//    //평점 순위 예매율
//    var full: String {
//        return String(format: user_rating)
//    }
//    

}
