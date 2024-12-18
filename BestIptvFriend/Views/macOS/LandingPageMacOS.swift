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
    @State private var showSheet = false
    @StateObject private var iptvManager = IPTVManager()
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                HStack() {
                    VideoBackgroundView(videoName: "background", videoType: "mp4")
                        .frame(width: geometry.size.width * 0.5, height: geometry.size.height * 1)
                        .clipped()
                        .background(Color.black)
                }
                
                ZStack {
                    Rectangle()
                        .fill(Color("CustomBackground"))
                    
                    VStack {
                        Text("📋 Mes IPTV")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color("CustomButonTitle"))
                            .padding(.bottom)
                        
                        if iptvManager.iptvList.isEmpty {
                            Text("Aucune IPTV enregistrée.")
                                .foregroundColor(.gray)
                                .font(.subheadline)
                                .padding(.bottom, 20)
                        } else {
                            ScrollView {
                                VStack(spacing: 10) {
                                    ForEach(iptvManager.iptvList, id: \.id) { iptv in
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color("CustomCardBackground"))
                                            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                                        HStack {
                                            VStack(alignment: .leading, spacing: 8) {
                                                HStack {
                                                    Image(systemName: "tv")
                                                        .fontWeight(.black)
                                                        .foregroundColor(.blue)
                                                    Text(iptv.name)
                                                        .textCase(.uppercase)
                                                        .font(.headline)
                                                        .fontWeight(.black)
                                                        .foregroundColor(Color("CustomButonTitle"))
                                                }
                                                
                                                HStack {
                                                    Image(systemName: "globe")
                                                        .foregroundColor(.green)
                                                        .fontWeight(.bold)
                                                    Text(iptv.url)
                                                        .foregroundColor(Color("CustomButonTitle"))
                                                        .font(.subheadline)
                                                        .fontWeight(.bold)
                                                }
                                                
                                                if !iptv.username.isEmpty {
                                                    HStack {
                                                        Image(systemName: "person")
                                                            .foregroundColor(.orange)
                                                            .fontWeight(.bold)
                                                        Text(iptv.username)
                                                            .foregroundColor(Color("CustomButonTitle"))
                                                            .font(.subheadline)
                                                            .fontWeight(.bold)
                                                    }
                                                }
                                            }
                                            Spacer()
                                            
                                            Button(action: {
                                                iptvManager.removeIPTV(iptv: iptv)
                                            }) {
                                                Text("❌")
                                                    .font(.title3)
                                                    .foregroundColor(.red)
                                                    .padding(5)
                                            }
                                            .buttonStyle(BorderlessButtonStyle())
                                        }
                                        .padding(10)
                                    }
                                    .frame(width: geometry.size.width * 0.45, height: 100)
                                }

                                }
                    
                            }
                            
                        }
                        
                        Button(action: {showSheet = true}) {
                            Text("Add IPTV")
                                .font(.headline)
                                .fontWeight(.bold)
                                .padding()
                                .background(Color("CustomButonBackground"))
                                .foregroundColor(Color("CustomButonTitle"))
                                .cornerRadius(10)
                        }
                        .padding(10)
                        .buttonStyle(BorderlessButtonStyle())
                        .sheet(isPresented: $showSheet) {
                            AddIPTVView(iptvManager: iptvManager)
                        }
                        
                    }
                    .frame(maxWidth: .infinity)
                }
                .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

#Preview {
    LandingPageMacOS()
}
#endif
