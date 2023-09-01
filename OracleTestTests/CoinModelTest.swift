//  CoinModelTest.swift
//  OracleTestTests
//  Created by Jael  on 30/08/23.

import XCTest
@testable import OracleTest

class CoinTests: XCTestCase {
    
    let decoder = JSONDecoder()
    let encoder = JSONEncoder()
    
    func testCoinDecoding() throws {
        // Arrange
        let json = """
        {
             "id": "bitcoin",
             "symbol": "btc",
             "name": "Bitcoin",
             "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
             "current_price": 27921,
             "market_cap": 544458816073,
             "market_cap_rank": 1,
             "fully_diluted_valuation": 587215274449,
             "total_volume": 23165818722,
             "high_24h": 27999,
             "low_24h": 25904,
             "price_change_24h": 1797.3,
             "price_change_percentage_24h": 6.87985,
             "market_cap_change_24h": 35995912065,
             "market_cap_change_percentage_24h": 7.07936,
             "circulating_supply": 19470943,
             "total_supply": 21000000,
             "max_supply": 21000000,
             "ath": 69045,
             "ath_change_percentage": -59.48537,
             "ath_date": "2021-11-10T14:24:11.849Z",
             "atl": 67.81,
             "atl_change_percentage": 41152.98289,
             "atl_date": "2013-07-06T00:00:00.000Z",
             "roi": null,
             "last_updated": "2023-08-29T19:07:08.663Z"
        }
        """.data(using: .utf8)!
        // Act & Assert
        do {
            let coin = try decoder.decode(Coin.self, from: json)
            XCTAssertEqual(coin.id, "bitcoin")
            XCTAssertEqual(coin.symbol, "btc")
            XCTAssertEqual(coin.name, "Bitcoin")
            XCTAssertEqual(coin.currentPrice, 27921.0)
            XCTAssertEqual(coin.marketCap, 544458816073)
            XCTAssertEqual(coin.ath, 69045.0)

        } catch {
            XCTFail("Failed to decode Coin: \(error)")
        }
    }

    func testCoinEncoding() throws {
        // Arrange
        let coin = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", currentPrice: 45000, marketCap: 900000000000, ath: 60000)
        // Act
        let encodedData = try encoder.encode(coin)
        let decodedCoin = try decoder.decode(Coin.self, from: encodedData)
        // Assert
        XCTAssertEqual(decodedCoin.id, "bitcoin")
        XCTAssertEqual(decodedCoin.symbol, "btc")
        XCTAssertEqual(decodedCoin.name, "Bitcoin")
        XCTAssertEqual(decodedCoin.currentPrice, 45000)
        XCTAssertEqual(decodedCoin.marketCap, 900000000000)
        XCTAssertEqual(decodedCoin.ath, 60000)
 
    }
    
    func test_ROIDecoding() throws {
        // Arrange
        let json = """
        {
            "times": 5,
            "currency": "usd",
            "percentage": 25
        }
        """.data(using: .utf8)!
        // Act & Assert
        let roi = try decoder.decode(ROI.self, from: json)
        XCTAssertEqual(roi.times, 5)
        XCTAssertEqual(roi.currency, "usd")
        XCTAssertEqual(roi.percentage, 25)
    }
    
    func test_ROIEncoding() throws {
        // Arrange
        let roi = ROI(times: 5, currency: "usd", percentage: 25)
        // Act
        let encoder = JSONEncoder()
        let encodedData = try encoder.encode(roi)
        let decodedROI = try decoder.decode(ROI.self, from: encodedData)
        // Assert
        XCTAssertEqual(decodedROI.times, 5)
        XCTAssertEqual(decodedROI.currency, "usd")
        XCTAssertEqual(decodedROI.percentage, 25)
    }

}
