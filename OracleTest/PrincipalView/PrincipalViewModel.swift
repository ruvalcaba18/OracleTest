//
//  PrincipalViewModel.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import Foundation

final class CoinViewModel: ObservableObject {
    private let baseURL = CoinDB.markets
    private let decoder = JSONDecoder()
    @Published var coinsModel = [Coin]()
    @Published var isCoinsPresented = false
    @Published var isRefreshing = true
    @Published var isMoveToCoinDetails = false
    @Published var selectedImage = ""
    @Published var coinSelected = Coin()
    @Published var searchText = ""
    
    var filteredCoins: [Coin] {
           if searchText.isEmpty {
               return coinsModel
           } else {
               return coinsModel.filter { coin in
                   coin.name?.localizedCaseInsensitiveContains(searchText) == true
               }
           }
       }
    
    @MainActor func retreiveCoinsInformations() async {
        if !coinsModel.isEmpty{ coinsModel.removeAll()}
        guard let url = URL(string: baseURL.fullURL) else {
            NSError(domain: "Invalid URL ", code: -1, userInfo: nil)
            return
        }
        do {
            let (data,_) = try await URLSession.shared.data(from: url)
            var coins = try decoder.decode([Coin].self, from: data)
            if coins.count > 20 {
                coins = Array(coins.prefix(20))
            }
            
            coinsModel.append(contentsOf: coins)
            isRefreshing = true
        } catch let error{
            debugPrint(error.localizedDescription)
        }
    }
    
}
