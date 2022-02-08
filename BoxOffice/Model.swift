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
    
    //평점 순위 예매율
    var full: String {
        return "평점: " + String(format: "%.2f", user_rating) + " 순위: " + String(reservation_grade) + " 예매율: " + String(format: "%.2f", reservation_rate)
    }
    
    let thumbnail = ["https://t1.daumcdn.net/movie/ae457b72c9a9ec2c8d2f44a893098ec060f0e598",
                     
                     "https://ww.namu.la/s/e9fc5ca3d821a2dc48e0b717068ea23ac45881ad955bdaee8bacae66df8f229d019d562c27ee0b5ff96b0672d8984bd018a289f2200e71553bc0873a4c70aa037c552bb37bdf81914d590495726aa3730ac858235bff790ad1c33abe5eac006c",
        
                     "https://ww.namu.la/s/f15d7d67a7283d6df9d51fb7acaf50f97454891c1fd3b6a7ea05527676f0f4b16e82ef0d1a9116c48d5c0aa11817fb8f74fb6700314ab8d303b87a00df74d6f3bff8d6d32859256ac5da79dbbcb54d716a2adbe4b5e8d5e2c4cc01646397f162",
                     
                     "https://upload.wikimedia.org/wikipedia/ko/e/ee/%EB%9F%AC%EB%B9%99%EB%B9%88%EC%84%BC%ED%8A%B8_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg",
                     
                     "https://ww.namu.la/s/5358f230c9501a75901d97d33632c201c8fba9558faa27d4702b8c0dfdfa824dbc84a700589ddfd7df280792cc5b66241571ea7ee3c34652d94d5bdd38333f8198c523e85879594da1bb02f7677df40e04235532e66b2d8eb542ca11a82441e2",
                     
                     "https://dimg.donga.com/wps/SPORTS/IMAGE/2017/10/30/87017681.2.jpg",
                     
                     "https://upload.wikimedia.org/wikipedia/ko/c/ce/%EC%A5%AC%EB%A7%8C%EC%A7%80_%EC%83%88%EB%A1%9C%EC%9A%B4_%EC%84%B8%EA%B3%84.jpg",
                     
                     "https://cphoto.asiae.co.kr/listimglink/6/2019073016165172617_1564471011.jpg"
                     
    ]
    

}
