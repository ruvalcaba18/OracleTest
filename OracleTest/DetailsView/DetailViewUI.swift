//  DetailViewUI.swift
//  OracleTest
//  Created by Jael  on 29/08/23.

import SwiftUI

struct DetailViewUI: View {
    
    @Binding var coinSelected:Coin
    
    private var placeHolderImage: some View {
        Image("placeholder")
            .resizable()
            .frame(width: 100, height: 100)
            .padding(.leading, 5)
            .accessibilityIdentifier("PlaceHolder_Image")
        
    }
    
    private var coinBackgroundColor: some View {
        Color.customGray
    }
    
    var body: some View {
        ScrollView {
            VStack {
                CacheAsyncImage(url: URL(string: coinSelected.image ?? "") ?? URL(fileURLWithPath: "")) { phase in
                    switch phase{
                    case .success(let image):
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .padding(.leading, 5)
                            .padding(.top, 30)
                            .accessibilityIdentifier("coinImage_\(coinSelected.name ?? "")")
                        
                    case .failure(_):
                        placeHolderImage
                    case .empty:
                        ProgressView()
                    @unknown default:
                        placeHolderImage
                    }
                }
                renderDescriptionCoin()
                
            }
            .padding(.top, 20)
            .background(coinBackgroundColor)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        .background(coinBackgroundColor)
        .ignoresSafeArea()
        
    }
    
    @ViewBuilder private func renderDescriptionCoin() -> some View{
        VStack(alignment: .center) {
            Text("Name: \(coinSelected.name ?? "")")
                .font(.headline)
                .bold()
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinName_\(coinSelected.name ?? "")")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
            
            Text("Total Volume: \(coinSelected.totalVolume ?? 0.0)")
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("Coin_Volume\(coinSelected.totalVolume ?? 0.0)")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
            renderPrices()
            
        }
    }
    
    @ViewBuilder private func renderPrices() -> some View{
        VStack {
            Text("Highest Price: $\( String(format: "%.0f", coinSelected.high24h ?? 0.0))   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinHighestPrice_\(coinSelected.currentPrice ?? 0.0)")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
            
            Text("Lowest Price: $\((coinSelected.low24h ?? 0.0) )   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinLowestPrice_\((coinSelected.low24h ?? 0.0))")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
            
            Text("Price Change: \((coinSelected.priceChange24h ?? 0.0) )   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinPriceChange_\((coinSelected.priceChange24h ?? 0.0))")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
            
            Text("Market Cap: \((coinSelected.marketCap ?? 0) )   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinMarketCap_\((coinSelected.marketCap ?? 0))")
            
            Spacer()
                .frame(height: 20)
                .fixedSize()
        }
    }
}

struct DetailViewUI_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewUI(coinSelected: .constant(Coin()))
    }
}
