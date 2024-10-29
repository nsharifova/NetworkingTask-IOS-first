import Foundation
import Alamofire

protocol NetworkService {
    func fetchData<T: Decodable>(urlPath: String, type: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}

class Service : NetworkService {
    func fetchData<T: Decodable>(urlPath: String,
                                 type: T.Type,
                                 completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(urlPath).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}



