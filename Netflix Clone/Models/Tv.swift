// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let trendingTvResponse = try? JSONDecoder().decode(TrendingTvResponse.self, from: jsonData)

import Foundation

// MARK: - TrendingTvResponse
struct TrendingTvResponse: Codable {
    let page: Int
    let results: [TvResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct TvResult: Codable {
    let adult: Bool
    let backdropPath: String
    let id: Int
    let name, originalLanguage, originalName, overview: String
    let posterPath: String
    let mediaType: MediaType
    let genreIDS: [Int]
    let popularity: Double
    let firstAirDate: String
    let voteAverage: Double
    let voteCount: Int
    let originCountry: [String]

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case id, name
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case genreIDS = "genre_ids"
        case popularity
        case firstAirDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case tv = "tv"
}
