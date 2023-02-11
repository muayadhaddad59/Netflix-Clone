//
//  APICaller.swift
//  Netflix Clone
//
//  Created by Muayad El-haddad on 10/02/2023.
//

import Foundation


struct Constants {
    static let API_KEY = "4a8314aac4072fd44dcdc9cf021c8a47"
    static let baseURL = "https://api.themoviedb.org"
    
}

enum APIError: Error{
    case failedToGetData
}
class APICaller{
    static let shared  = APICaller()
    
    func getTrendenigMovies(completion: @escaping (Result<[Movie], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")else{return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let result = try JSONDecoder().decode(TrendingMoviesReponse.self, from: data)
                print(result)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTvs(completionHandler: @escaping (Result<[TrendingTvResponse],Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do{
                let results = try JSONDecoder().decode(TrendingTvResponse.self, from: data)
                print(results.results.count)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[UpcomingResponse] , Error>)->Void){
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let results = try  JSONDecoder().decode(UpcomingResponse.self, from: data)
                
                print(results.results.count)
            }catch{
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    
    func getPopularMovies(completion: @escaping (Result<[PopularResult] , Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data , _ , error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let result = try JSONDecoder().decode(PopularMovieResponse.self, from: data)
                print(result)
            }catch{
                print(error.localizedDescription)
            }
        }
        
        task.resume()
        
    }
    
    
    func getTopRated(completion: @escaping (Result<[TopRatedResult] , Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            do{
                let result = try JSONDecoder().decode(TopRatedResponse.self, from: data)
                print(result)
            }catch{
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }
    
}





