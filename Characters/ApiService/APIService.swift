//
//  APIService.swift
//  Characters
//
//  Created by Ahmed Serdah on 03/01/2025.
//

import Foundation


class APIService {
    
    static func fetchApi(url: URL,completionHandler: @escaping (Result<ResponseModel, Error>) -> Void){
        

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
      

              if let error = error {
                  
                  completionHandler(.failure(error))
                  return
              }
              guard let data = data else {
                  
                  completionHandler(.failure(NSError(domain: "No Data", code: 0, userInfo: nil)))
                  return
              }
              do {
                  let decodedData = try JSONDecoder().decode(ResponseModel.self, from: data)
                  completionHandler(.success(decodedData))

              } catch {
                  completionHandler(.failure(error))
              }
          }
          task.resume()
      }
    
}
