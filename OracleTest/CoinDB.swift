//
//  CoinDB.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import Foundation
enum CoinDB {
    case markets
    
    var endpoint: String {
        switch self {
        case .markets:
            return  "coins/markets?vs_currency=usd"
        }
    }
    var baseURL: String {
        return "https://api.coingecko.com/api/v3/"
    }
    
    var fullURL: String {
        return baseURL + endpoint
    }
}
