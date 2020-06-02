//
//  BackendCommunicator.swift
//  CVDemo
//
//  Created by Jan Mazurczak on 02/06/2020.
//  Copyright © 2020 Jan Mazurczak. All rights reserved.
//

protocol BackendCommunicator {
    func fetch<Result>(_ resultType: Result.Type, at path: [String], completion: @escaping (Result?) -> Void) where Result : Decodable
}
