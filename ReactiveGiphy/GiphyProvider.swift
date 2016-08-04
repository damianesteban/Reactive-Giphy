//
//  GiphyProvider.swift
//  ReactiveGiphy
//
//  Created by Damian Esteban on 8/4/16.
//  Copyright © 2016 Damian Esteban. All rights reserved.
//

import Foundation
import Moya

// Giphy API Key.
private let apiKey = "dc6zaTOxFJmzC"

// MARK: JSON formatting extension.
private func JSONResponseDataFormatter(data: NSData) -> NSData {
    do {
        let dataAsJSON = try NSJSONSerialization.JSONObjectWithData(data, options: [])
        let prettyData =  try NSJSONSerialization.dataWithJSONObject(dataAsJSON, options: .PrettyPrinted)
        return prettyData
    } catch {
        return data
    }
}

// MARK: String extension that provides a properly formatted "escaped string".
private extension String {
    var URLEscapedString: String {
        return self.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLHostAllowedCharacterSet())!
    }
}

typealias Parameters = [String: AnyObject]?

// MARK: - Provider
let GiphyProvider = MoyaProvider<GiphyAPI>(plugins: [NetworkLoggerPlugin(verbose: true,
    responseDataFormatter: JSONResponseDataFormatter)])

// MARK: Provider configuration.
enum GiphyAPI {
    case Trending
    case Search(String)
}

extension GiphyAPI: TargetType {
    
    // The base URL
    var baseURL: NSURL { return NSURL(string: "https://api.giphy.com/v1/gifs")! }
    
    // URL path
    var path: String {
        switch self {
        case .Trending:
            return "/trending"
        case .Search(_):
            return "/search"
        }
    }
    
    // HTTP Methods
    var method: Moya.Method {
        return .GET
    }
    
    // NSMutableURLRequest parameters
    var parameters: Parameters {
        switch self {
        case .Trending:
            return ["api_key": apiKey]
        case .Search(let query):
            return ["api_key": apiKey,
                    "q": query]
        }
    }
    
    // Sample data for testing
    var sampleData: NSData {
        switch self {
        case .Trending:
            return jsonString("trending").dataUsingEncoding(NSUTF8StringEncoding)!
        case .Search(_):
            return jsonString("search").dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
}

// MARK: GiphyAPI extension
extension GiphyAPI: JSONLoader {}



