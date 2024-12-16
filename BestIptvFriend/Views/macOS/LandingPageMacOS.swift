//
//  LandingPageMacOS.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//

import SwiftUI

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
