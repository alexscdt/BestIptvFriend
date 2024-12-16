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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello macOS!")
        }
        .padding()
    }
}

#Preview {
    LandingPageMacOS()
}
#endif
