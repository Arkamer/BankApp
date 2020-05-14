//
//  UserRequest.swift
//  BankAppTest
//
//  Created by Ailton Lessa on 18/02/20.
//  Copyright © 2020 Ailton. All rights reserved.
//

import UIKit

enum UserError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

struct UserRequest {

    let resourceURL:URL

    init(endpoint: String) {
        let resourceString = "https://bank-app-test.herokuapp.com/api/\(endpoint)"
        guard let resourceURL = URL(string: resourceString) else { fatalError() }

        self.resourceURL = resourceURL
    }

    func save (_ messageToSave:LoginRequest, completion: @escaping(Result<LoginResponse, UserError>) -> Void) {

        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            var requestBodyComponents = URLComponents()
            requestBodyComponents.queryItems = [URLQueryItem(name: "user", value: messageToSave.user),
                                                URLQueryItem(name: "password", value: messageToSave.password)]
            
            urlRequest.httpBody = requestBodyComponents.query?.data(using: .utf8)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))

                    return
                }
                
                do {
                    let messageData = try JSONDecoder().decode(LoginResponse.self, from: jsonData)
                    messageData.userAccount.agency
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
            }
            dataTask.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }
}
