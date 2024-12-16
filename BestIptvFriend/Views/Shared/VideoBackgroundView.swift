//
//  VideoBackgroundView.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//

import SwiftUI
import AVKit

struct VideoBackgroundView: View {
    let videoName: String
    let videoType: String

    var body: some View {
        ZStack {
            VideoPlayerView(videoName: videoName, videoType: videoType)
                .ignoresSafeArea(.all)
                .scaledToFill()
        }
    }
}

struct VideoPlayerView: UIViewRepresentable {
    let videoName: String
    let videoType: String

    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        guard let path = Bundle.main.path(forResource: videoName, ofType: videoType) else {
            print("Video file not found: \(videoName).\(videoType)")
            return view
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        
        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = UIScreen.main.bounds
        view.layer.addSublayer(playerLayer)
        
        centerVideo(playerLayer: playerLayer)
        
        player.actionAtItemEnd = .none
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { _ in
            player.seek(to: .zero)
            player.play()
        }

        player.play()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
    }
}

private func centerVideo(playerLayer: AVPlayerLayer) {
           let offsetY =  UIScreen.main.bounds.height / 2

           playerLayer.setAffineTransform(
            CGAffineTransform(translationX: 1.5, y: -offsetY)
           )
    }

