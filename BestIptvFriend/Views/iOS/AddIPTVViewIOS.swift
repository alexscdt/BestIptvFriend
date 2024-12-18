//
//  AddIPTVViewIOS.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 18/12/2024.
//

#if os(iOS)
import Foundation
import SwiftUI

struct AddIPTVViewIOS: View {
    @Environment(\.dismiss) var dismiss
    @State private var iptvName : String = ""
    @State private var iptvUrl : String = ""
    @State private var iptvUsername : String = ""
    @State private var iptvPassword : String = ""
    
    @ObservedObject var iptvManager: IPTVManager
    
    var body: some View{
        VStack {
            Text("🚀 Add IPTV")
                .font(.title)
                .fontWeight(.black)
                .padding()

            TextField("IPTV NAME", text: $iptvName)
                .padding()
                .fontWeight(.bold)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("IPTV URL", text: $iptvUrl)
                .padding()
                .fontWeight(.bold)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("IPTV USERNAME", text: $iptvUsername)
                .padding()
                .fontWeight(.bold)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("IPTV PASSWORD", text: $iptvPassword)
                .padding()
                .fontWeight(.bold)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack() {
                Button(action: {
                    let newIPTV = IPTV(name: iptvName, url: iptvUrl, username: iptvUsername, password: iptvPassword)
                    iptvManager.addIPTV(iptv: newIPTV)

                    dismiss()
                }) {
                    Text("Create")
                        .font(.headline)
                        .padding()
                        .background()
                        .fontWeight(.bold)
                        .foregroundColor(.green)
                        .cornerRadius(10)
                }
                .padding(.top)
                .buttonStyle(BorderlessButtonStyle())
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Cancel")
                        .font(.headline)
                        .padding()
                        .background()
                        .fontWeight(.bold)
                        .foregroundColor(.red)
                        .cornerRadius(10)
                }
                .padding(.top)
                .buttonStyle(BorderlessButtonStyle())
            }
            }
            
        .padding()
    }
}

#Preview {
    AddIPTVViewIOS(iptvManager: IPTVManager())
}

#endif
