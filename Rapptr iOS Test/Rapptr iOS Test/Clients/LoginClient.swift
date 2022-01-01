//
//  LoginClient.swift
//  Rapptr iOS Test
//
//  Created by Ethan Humphrey on 8/11/21.
//

import Foundation
import Alamofire
/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make a request here to login.
 *
 * 2) Using the following endpoint, make a request to login
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/login.php
 *
 * 3) Don't forget, the endpoint takes two parameters 'email' and 'password'
 *
 * 4) email - info@rapptrlabs.com
 *   password - Test123
 *
 */

class LoginClient {
    var loginURL = "http://dev.rapptrlabs.com/Tests/scripts/login.php"
    
    typealias Success = (_ login: Login, _ timeTaken: String) -> ()
    typealias Failure = (_ message: String) -> ()
    
    func login(email: String, password: String, success: @escaping Success, failure: @escaping Failure) {
        
        let parameters = ["email": email,
                          "password": password]
        
        //Date object to get API response Time
        let apiStartTime = Date()
        
        //Login Api call with Parameters
        AF.request(loginURL,
                   method:.post,
                   parameters: parameters,
                   encoding: URLEncoding.httpBody).validate(statusCode: 200..<300)
            .responseDecodable { (response: AFDataResponse<Login>) in
                let result = response.result
                switch result {
                case .success(let login):
                    success(login, apiStartTime.getTimeInvertal())
                case .failure(let error):
                    response.response?.statusCode == 401 ? failure("Invalid Credentials") : failure(error.localizedDescription)
                }
            }
    }
}
