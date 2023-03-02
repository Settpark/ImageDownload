//
//  Service.swift
//  ImageDownload
//
//  Created by 박정하 on 2023/03/02.
//

import UIKit

class Service {
    func downloadImage(url: String, completion: @escaping (Result<Data, Error>) -> (Void)) {
        guard let validURL = URL(string: url) else {
            return
        }
        
        let request: URLRequest = URLRequest(url: validURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                return completion(.failure(error))
            }
            if let validData = data {
                return completion(.success(validData))
            }
        }.resume()
    }
}
