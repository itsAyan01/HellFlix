//
//  NetworkManager.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()
    
    func callGetApi<T: Decodable>(apiEndPoint: ApiEndPoints,
                                  resultType: T.Type,
                                  completionHandler: @escaping (Result<T, Error>) -> Void) {
        
        guard let url = URL(string: apiEndPoint.url)
        else {
            print("Invalid URL")
            completionHandler(.failure(NetworkingErrors.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, urlResponce, err in
            if let err = err {
                print("Error - \(err.localizedDescription)")
                completionHandler(.failure(NetworkingErrors.customError(error: err)))
                return
            }
            guard let responce = urlResponce as? HTTPURLResponse,
                  responce.statusCode >= 200 && responce.statusCode < 300
            else {
                print("Invalid Url responce")
                return
            }
            guard let data = data
            else {
                print("Data not found")
                return
            }
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                completionHandler(.success(result))
                print(try JSONSerialization.jsonObject(with: data))
            }
            catch {
                print("Error while decoding the data \(error)")
            }
        }.resume()
    }
    
}

