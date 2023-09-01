//
//  SplashScreen.swift
//  OracleTest
//
//  Created by Jael  on 29/08/23.
//

import SwiftUI

struct SplashScreen: View {
    @State private var rotationAngle: Angle = .degrees(0)

    var body: some View {
        ZStack {
            VStack {
                Text("Currency App")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(Color.customGold)
                Spacer()
                    .frame(height: 70)
                    .fixedSize()
                Image("currency")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 300)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.customGold, lineWidth: 4)
                    )
                    .shadow(radius: 5)
                    .rotationEffect(rotationAngle)
                    .onAppear {
                        withAnimation(Animation.easeInOut(duration:2.5)
                            .repeatForever(autoreverses: true)) {
                            rotationAngle = .degrees(180)
                        }
                    }
                
            }
            .frame(width: UIScreen.main.bounds.width,height: UIScreen.main.bounds.height)
            .ignoresSafeArea()
        }
        .background(Color.black)
        .accessibilityIdentifier("SplashScreenView")
    }
    
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
