//
//  AppConfig.swift
//  Weater
//
//  Created by Gama rodriguez quintero on 21/12/24.
//

import Foundation

enum AppConfig {
    static let apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("API_KEY is not set in xcconfig")
        }
        return key
    }()
    
    static let apiHost: String = {
        guard let host = Bundle.main.object(forInfoDictionaryKey: "API_HOST") as? String else {
            fatalError("API_HOST is not set in xcconfig")
        }
        return host
    }()
    
    static let baseURL: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in xcconfig")
        }
        return url
    }()
}
