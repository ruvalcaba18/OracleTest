//  PrincipalViewUI.swift
//  OracleTest
//  Created by Jael  on 29/08/23.

import SwiftUI
import CoreData

struct PrincipalViewUI: View {
        
    @StateObject private var viewModel = CoinViewModel()
    @State private var isSplashViewActive = true
    
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
        NavigationView {
            ZStack {
                if isSplashViewActive {
                    SplashScreen()
                        .transition(.move(edge: .top))
                } else {
                    renderPrincipalView()
                }
            }
        }
        .background(coinBackgroundColor)
        .searchable(text: $viewModel.searchText)
        .onAppear{
            asyncInitialization()
        }
    }
    
    @ViewBuilder private func renderPrincipalView() -> some View {
        List {
            ForEach(viewModel.filteredCoins, id: \.id) { coin in
                ZStack {
                    coinBackgroundColor
                    HStack(alignment: .center) {
                        
                        CacheAsyncImage(url: URL(string: coin.image ?? "") ?? URL(fileURLWithPath: "")) { phase in
                            switch phase{
                            case .success(let image):
                                image
                                    .resizable()
                                    .frame(width: 100, height: 100)
                                    .padding(.leading, 5)
                                    .accessibilityIdentifier("coinImage_\(coin.name ?? "")")
                                
                            case .failure(_):
                                placeHolderImage
                            case .empty:
                                ProgressView()
                            @unknown default:
                                placeHolderImage
                            }
                        }
                        Spacer()
                        renderDescriptionCoin(coin)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 8)
                }
                .onTapGesture {
                    viewModel.isMoveToCoinDetails = true
                    viewModel.coinSelected = coin
                }
                .listRowInsets(EdgeInsets())
                .accessibilityIdentifier("CoinCell_\(coin.name ?? "")")
            }
            .background(coinBackgroundColor)
        }
        .listStyle(.plain)
        .background(coinBackgroundColor)
        .background(
            NavigationLink(isActive: $viewModel.isMoveToCoinDetails) {
                DetailViewUI(coinSelected: $viewModel.coinSelected)
                
            } label: {
                EmptyView()
            }
            
        )
        .navigationTitle(isSplashViewActive ? "" : "Currency View")
        .navigationBarTitleTextColor(Color.customGold)
        .navigationViewStyle(StackNavigationViewStyle())
        .task {
            await viewModel.retreiveCoinsInformations()
        }
        .refreshable {
            if viewModel.isRefreshing {
                do {
                    try await Task.sleep(nanoseconds: 3_000_000_000)
                    await viewModel.retreiveCoinsInformations()
         
                } catch {
                    print("Error: \(error)")
                }
            }
            
        }
        .onChange(of: viewModel.isRefreshing) { newValue in
            if newValue {
                viewModel.isRefreshing = false
            }
        }
        .onAppear {
            UIRefreshControl.appearance().tintColor = UIColor.systemYellow
            UIRefreshControl.appearance().backgroundColor = UIColor.black.withAlphaComponent(0.5)

            let title = "**Wait** to *complete request*"
            let attributedTitle = NSMutableAttributedString(string: title)
            attributedTitle.addAttribute(.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedTitle.length))

            UIRefreshControl.appearance().attributedTitle = attributedTitle
        }
    }
    
    @ViewBuilder private func renderDescriptionCoin(_ coin:Coin) -> some View{
        VStack(alignment: .center) {
            Text("Symbol: \(coin.symbol ?? "")")
                .font(.headline)
                .bold()
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinSymbol_\(coin.symbol ?? "")")
            Text("Name: \(coin.name ?? "")")
                .font(.subheadline)
                .bold()
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinName_\(coin.name ?? "")")
            Text("Current Price: $\( String(format: "%.0f", coin.currentPrice ?? 0.0))   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinCurrentPrice_\(coin.currentPrice ?? 0.0)")
            
            Text("Last Update: \((coin.lastUpdated ?? "").formattedDate() )   ")
                .font(.body)
                .foregroundColor(Color.customGold)
                .accessibilityIdentifier("CoinLastUpdate_\((coin.lastUpdated ?? "").formattedDate())")
            
        }
    }
    
    private func asyncInitialization() {
        Task {
            do {
                try await Task.sleep(nanoseconds: 4_000_000_000)
                withAnimation(.easeIn(duration: 2.0)) {
                    isSplashViewActive = false
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}

struct PrincipalViewUI_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalViewUI()
    }
}
