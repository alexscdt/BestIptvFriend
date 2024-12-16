//
//  LandingPage.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//

import SwiftUI

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

struct LandingPage: View {
    var body: some View {
        Group {
            #if os(iOS)
            LandingPageIOS()
            #elseif os(macOS)
            LandingPageMacOS()
            #else
            Text("Plateforme non prise en charge")
            #endif
        }
    }
}

#Preview {
    LandingPage()
}
