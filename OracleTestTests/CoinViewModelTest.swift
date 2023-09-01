//
//  CoinViewModelTest.swift
//  OracleTestTests
//
//  Created by Jael  on 30/08/23.
//

import XCTest
@testable import OracleTest

final class CoinViewModelTest: XCTestCase {
    
    func test_RetrieveCoinsInformations() async throws {
        // Arrange
        let viewModel = CoinViewModel()
        
        // Act
        await viewModel.retreiveCoinsInformations()
        
        // Assert
        XCTAssertFalse(viewModel.coinsModel.isEmpty, "Coins model should not be empty after retrieval")
        XCTAssertTrue(viewModel.isRefreshing, "isRefreshing should be true after retrieval")
    }
    
    func test_FilteredCoins() {
        // Arrange
        let viewModel = CoinViewModel()
        viewModel.coinsModel = [
            Coin(id: "1", symbol: "BTC", name: "Bitcoin"),
            Coin(id: "2", symbol: "ETH", name: "Ethereum"),
            Coin(id: "3", symbol: "LTC", name: "Litecoin")
        ]
        
        // Act & Assert
        viewModel.searchText = "btc"
        XCTAssertEqual(viewModel.filteredCoins.count, 1, "Filtered coins count should be 1")
        
        viewModel.searchText = "eth"
        XCTAssertEqual(viewModel.filteredCoins.count, 1, "Filtered coins count should be 1")
        
        viewModel.searchText = "coin"
        XCTAssertEqual(viewModel.filteredCoins.count, 2, "Filtered coins count should be 2")
        
        viewModel.searchText = "nonexistent"
        XCTAssertEqual(viewModel.filteredCoins.count, 0, "Filtered coins count should be 0")
    }
}
