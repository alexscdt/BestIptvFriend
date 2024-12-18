//
//  LandingPageMacOS.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//
#if os(macOS)
import SwiftUI
import AppKit

struct LandingPageMacOS: View {
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                HStack() {
                    VideoBackgroundView(videoName: "background", videoType: "mp4")
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 1.1)
                }
                .frame(maxWidth: .infinity)
                .background(Color.red)
                
                Spacer()
                
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
                    .buttonStyle(BorderlessButtonStyle())
                }
                .frame(maxWidth: .infinity)
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

#Preview {
    LandingPageMacOS()
}
#endif
