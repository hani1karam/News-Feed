//
//  UserRouter.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
import Alamofire
enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Session {
    func request(_ request: RequestProtocol) -> DataRequest {
        return self.request(request.url,
                            method: request.method,
                            parameters: request.parameters,
                            encoding: request.method == .get ? URLEncoding.default : JSONEncoding.prettyPrinted,
                            headers: request.headers)
    }
}

struct APIClient: DataProviderProtocol {
    static let shared = APIClient()
    func sentRequest<ResponseType>(request: RequestProtocol, mapResponseOnType: ResponseType.Type, completionHandler: @escaping (Result<ResponseType>) -> Void) where ResponseType : Decodable, ResponseType : Encodable {
        Session.default.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    let jsonDecoder = JSONDecoder()
                    let decodedObject = try jsonDecoder.decode(mapResponseOnType.self, from: response.data ?? Data())
                    completionHandler(.success(decodedObject))
                } catch {
                    // Error Decoding the response
                    completionHandler(.failure(error))
                }
            case .failure(let error):
                // Error executing the request
                completionHandler(.failure(error))
            }
        }
    }
    
}
