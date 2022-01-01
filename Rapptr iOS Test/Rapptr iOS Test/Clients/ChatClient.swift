//
//  ChatClient.swift
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
 * 1) Make a request to fetch chat data used in this app.
 *
 * 2) Using the following endpoint, make a request to fetch data
 *    URL: http://dev.rapptrlabs.com/Tests/scripts/chat_log.php
 */

class ChatClient {
    
    var chatURL = "http://dev.rapptrlabs.com/Tests/scripts/chat_log.php"
    
    func fetchChatData(completion: @escaping (Result<Chat, Error>) -> Void) {
        //Api call to fetch chat
        AF.request(chatURL,
                   method: .get).validate(statusCode: 200..<300)
            .responseDecodable { (response: AFDataResponse<Chat>) in
                let result = response.result
                switch result {
                case .success(let chat):
                    completion(.success(chat))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
