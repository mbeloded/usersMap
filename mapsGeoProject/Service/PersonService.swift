//
//  PersonService.swift
//  mapsGeoProject
//
//  Created by Michael Bielodied on 1/13/19.
//  Copyright © 2019 Michael Bielodied. All rights reserved.
//

import Foundation

final class PersonService {
    
    public static let shared = PersonService()
    
    var task : URLSessionTask?
    
    public func getAllUsers(_ completion: @escaping ((Result<[Person], ErrorResult>)) -> Void) {
        
        guard let url = URL(string: Common.getAll) else {
            completion(.failure(.custom(string: "error.wrong.url.label".localized)))
            return
        }
        
        // cancel previous request if already in progress
        self.cancelFetchPersons()
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(.network(string: String(format: "error.failed.to.fetch.label".localized, [err]))))
                return
            }
            
            // mock response has been generated using https://www.json-generator.com/ service
            // 1
            guard let fileName = Bundle.main.path(forResource: "Users", ofType: "json")
                else { return }
            let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
            
            guard
                let data = optionalData
                else {
                    return
            }
            
            //real response
//            guard let data = data else {
//                completion(.failure(.parser(string: "error.failed.to.decode.data.label".localized)))
//                return
//            }
            do {
                let users = try JSONDecoder().decode([Person].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(users))
                }
            } catch let jsonErr {
                completion(.failure(.parser(string: String(format: "error.failed.to.decode.json.label".localized, [jsonErr]))))
            }
        }
        
        task?.resume()
    }
    
    public func getLocationsFor(userId: String, completion: @escaping ((Result<[Location], ErrorResult>)) -> Void) {
        
        guard let url = URL(string: String(format: Common.getLocationsByUserId, userId) ) else {
            completion(.failure(.custom(string: "error.wrong.url.label".localized)))
            return
        }
        
        // cancel previous request if already in progress
        self.cancelFetchPersons()
        
        task = URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(.failure(.network(string: String(format: "error.failed.to.fetch.label".localized, [err]))))
                return
            }
            
            // mock response has been generated using https://www.json-generator.com/ service
            // 1
            guard let fileName = Bundle.main.path(forResource: "Locations", ofType: "json")
                else { return }
            let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
            
            guard
                let data = optionalData
                else {
                    return
            }
            
            // real response
//            guard let data = data else {
//                completion(.failure(.parser(string: "error.failed.to.decode.data.label".localized)))
//                return
//            }
            do {
                let locations = try JSONDecoder().decode([Location].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(locations))
                }
            } catch let jsonErr {
                completion(.failure(.parser(string: String(format: "error.failed.to.decode.json.label".localized, [jsonErr]))))
            }
        }
        
        task?.resume()
    }
    
    public func cancelFetchPersons() {
        
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
