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
    
    func getTrendenigMovies(completion: @escaping (Result<[Title], Error>) -> Void){
        
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")else{return }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                print(result)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title],Error>)-> Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else {return}
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping (Result<[Title] , Error>)->Void){
        guard let url = URL(string:  "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {return}
            
            do{
                let result = try  JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    
    func getPopularMovies(completion: @escaping (Result<[Title] , Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){data , _ , error in
            guard let data = data , error == nil else {
                return
            }
            
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
        }
        
        task.resume()
        
    }
    
    
    func getTopRated(completion: @escaping (Result<[Title] , Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data , error == nil else{
                return
            }
            do{
                let result = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(result.results))
            }catch{
                completion(.failure(error))
            }
            
        }
        task.resume()
    }
    
}





