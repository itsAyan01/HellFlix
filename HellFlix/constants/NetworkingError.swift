//
//  NetworkingError.swift
//  HellFlix
//
//  Created by Ayan Ansari on 26/04/23.
//

import Foundation


enum NetworkingErrors: Error {
    case invalidUrl
    case customError(error: Error)
    case invalidUrlResponce
    case invalidData
    case failedToDecode(error: Error)
}
