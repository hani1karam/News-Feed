//
//  DataProviderProtocol.swift
//  VIPER
//
//  Created by hany karam on 1/21/22.
//

import Foundation
protocol DataProviderProtocol {
    func sentRequest<ResponseType>(request: RequestProtocol, mapResponseOnType: ResponseType.Type, completionHandler: @escaping (Result<ResponseType>) -> Void) where ResponseType : Decodable, ResponseType : Encodable
}
