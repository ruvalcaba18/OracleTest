//
//  PrincipalModel.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import Foundation

struct Coin: Codable {
   
    let id: String?
    let symbol: String?
    let name: String?
    let image: String?
    let currentPrice: Double?
    let marketCap: Int?
    let marketCapRank: Int?
    let fullyDilutedValuation: Int?
    let totalVolume: Double?
    let high24h: Double?
    let low24h: Double?
    let priceChange24h: Double?
    let priceChangePercentage24h: Double?
    let marketCapChange24h: Double?
    let marketCapChangePercentage24h: Double?
    let circulatingSupply: Double?
    let totalSupply: Double?
    let maxSupply: Double?
    let ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl: Double?
    let atlChangePercentage: Double?
    let atlDate: String?
    let roi: ROI?
    let lastUpdated: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case symbol
        case name
        case image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage
        case athDate
        case atl
        case atlChangePercentage
        case atlDate
        case roi
        case lastUpdated = "last_updated"
    }
    
     init(id: String? = nil, symbol: String? = nil, name: String? = nil, image: String? = nil, currentPrice: Double? = nil, marketCap: Int? = nil, marketCapRank: Int? = nil, fullyDilutedValuation: Int? = nil, totalVolume: Double? = nil, high24h: Double? = nil, low24h: Double? = nil, priceChange24h: Double? = nil, priceChangePercentage24h: Double? = nil, marketCapChange24h: Double? = nil, marketCapChangePercentage24h: Double? = nil, circulatingSupply: Double? = nil, totalSupply: Double? = nil, maxSupply: Double? = nil, ath: Double? = nil, athChangePercentage: Double? = nil, athDate: String? = nil, atl: Double? = nil, atlChangePercentage: Double? = nil, atlDate: String? = nil, roi: ROI? = nil, lastUpdated: String? = nil) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.image = image
        self.currentPrice = currentPrice
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.fullyDilutedValuation = fullyDilutedValuation
        self.totalVolume = totalVolume
        self.high24h = high24h
        self.low24h = low24h
        self.priceChange24h = priceChange24h
        self.priceChangePercentage24h = priceChangePercentage24h
        self.marketCapChange24h = marketCapChange24h
        self.marketCapChangePercentage24h = marketCapChangePercentage24h
        self.circulatingSupply = circulatingSupply
        self.totalSupply = totalSupply
        self.maxSupply = maxSupply
        self.ath = ath
        self.athChangePercentage = athChangePercentage
        self.athDate = athDate
        self.atl = atl
        self.atlChangePercentage = atlChangePercentage
        self.atlDate = atlDate
        self.roi = roi
        self.lastUpdated = lastUpdated
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id)
        self.symbol = try container.decodeIfPresent(String.self, forKey: .symbol)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
        self.currentPrice = try container.decodeIfPresent(Double.self, forKey: .currentPrice)
        self.marketCap = try container.decodeIfPresent(Int.self, forKey: .marketCap)
        self.marketCapRank = try container.decodeIfPresent(Int.self, forKey: .marketCapRank)
        self.fullyDilutedValuation = try container.decodeIfPresent(Int.self, forKey: .fullyDilutedValuation)
        self.totalVolume = try container.decodeIfPresent(Double.self, forKey: .totalVolume)
        self.high24h = try container.decodeIfPresent(Double.self, forKey: .high24h)
        self.low24h = try container.decodeIfPresent(Double.self, forKey: .low24h)
        self.priceChange24h = try container.decodeIfPresent(Double.self, forKey: .priceChange24h)
        self.priceChangePercentage24h = try container.decodeIfPresent(Double.self, forKey: .priceChangePercentage24h)
        self.marketCapChange24h = try container.decodeIfPresent(Double.self, forKey: .marketCapChange24h)
        self.marketCapChangePercentage24h = try container.decodeIfPresent(Double.self, forKey: .marketCapChangePercentage24h)
        self.circulatingSupply = try container.decodeIfPresent(Double.self, forKey: .circulatingSupply)
        self.totalSupply = try container.decodeIfPresent(Double.self, forKey: .totalSupply)
        self.maxSupply = try container.decodeIfPresent(Double.self, forKey: .maxSupply)
        self.ath = try container.decodeIfPresent(Double.self, forKey: .ath)
        self.athChangePercentage = try container.decodeIfPresent(Double.self, forKey: .athChangePercentage)
        self.athDate = try container.decodeIfPresent(String.self, forKey: .athDate)
        self.atl = try container.decodeIfPresent(Double.self, forKey: .atl)
        self.atlChangePercentage = try container.decodeIfPresent(Double.self, forKey: .atlChangePercentage)
        self.atlDate = try container.decodeIfPresent(String.self, forKey: .atlDate)
        self.roi = try container.decodeIfPresent(ROI.self, forKey: .roi)
        self.lastUpdated = try container.decodeIfPresent(String.self, forKey: .lastUpdated)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.symbol, forKey: .symbol)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.image, forKey: .image)
        try container.encodeIfPresent(self.currentPrice, forKey: .currentPrice)
        try container.encodeIfPresent(self.marketCap, forKey: .marketCap)
        try container.encodeIfPresent(self.marketCapRank, forKey: .marketCapRank)
        try container.encodeIfPresent(self.fullyDilutedValuation, forKey: .fullyDilutedValuation)
        try container.encodeIfPresent(self.totalVolume, forKey: .totalVolume)
        try container.encodeIfPresent(self.high24h, forKey: .high24h)
        try container.encodeIfPresent(self.low24h, forKey: .low24h)
        try container.encodeIfPresent(self.priceChange24h, forKey: .priceChange24h)
        try container.encodeIfPresent(self.priceChangePercentage24h, forKey: .priceChangePercentage24h)
        try container.encodeIfPresent(self.marketCapChange24h, forKey: .marketCapChange24h)
        try container.encodeIfPresent(self.marketCapChangePercentage24h, forKey: .marketCapChangePercentage24h)
        try container.encodeIfPresent(self.circulatingSupply, forKey: .circulatingSupply)
        try container.encodeIfPresent(self.totalSupply, forKey: .totalSupply)
        try container.encodeIfPresent(self.maxSupply, forKey: .maxSupply)
        try container.encodeIfPresent(self.ath, forKey: .ath)
        try container.encodeIfPresent(self.athChangePercentage, forKey: .athChangePercentage)
        try container.encodeIfPresent(self.athDate, forKey: .athDate)
        try container.encodeIfPresent(self.atl, forKey: .atl)
        try container.encodeIfPresent(self.atlChangePercentage, forKey: .atlChangePercentage)
        try container.encodeIfPresent(self.atlDate, forKey: .atlDate)
        try container.encodeIfPresent(self.roi, forKey: .roi)
        try container.encodeIfPresent(self.lastUpdated, forKey: .lastUpdated)
    }
}

struct ROI: Codable {
    let times: Double?
    let currency: String?
    let percentage: Double?
    
    init(times: Double? = nil, currency: String? = nil , percentage: Double? = nil)
    {
        self.times = times
        self.currency = currency
        self.percentage = percentage
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.times = try container.decodeIfPresent(Double.self, forKey: .times)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.percentage = try container.decodeIfPresent(Double.self, forKey: .percentage)
    }
    
    enum CodigKeys: String, CodingKey {
        case times
        case currency
        case percentage
    }
    
    enum CodingKeys: CodingKey {
        case times
        case currency
        case percentage
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.times, forKey: .times)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.percentage, forKey: .percentage)
    }
}
