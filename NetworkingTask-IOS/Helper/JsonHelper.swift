//
//  JsonHelper.swift
//  NetworkingTask-IOS
//
//  Created by Nurluay Sharifova on 14.10.24.
//

import Foundation
enum JsonFileName: String {
    case userData = "UserData"
}
class JsonFileHelper {
    
    static func jsonParse<T:JsonData> (fileName : JsonFileName,type:T.Type) -> [T]? {
        guard let url = Bundle.main.url(forResource: fileName.rawValue, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let result = try? JSONDecoder().decode([T].self, from: data)
        else {
            return nil
        }
        return result
        
    }
}
