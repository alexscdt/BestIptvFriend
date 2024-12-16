//
//  LandingPageIOS.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//

#if os(iOS)
import SwiftUI
import UIKit

struct LandingPageIOS: View {
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                VideoBackgroundView(videoName: "background", videoType: "mp4")
                    .padding()
                    .frame(height: UIScreen.main.bounds.height * 0.5)
                    .clipped()
            }

            ZStack {
                Rectangle()
                    .fill(Color("CustomBackground"))
                Button(action: {print("Bouton appuyé")}) {
                    Text("Add IPTV")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(Color("CustomButonBackground"))
                        .foregroundColor(Color("CustomButonTitle"))
                        .cornerRadius(10)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LandingPageIOS()
}
#endif

