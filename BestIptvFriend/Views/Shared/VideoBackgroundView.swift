//
//  VideoBackgroundView.swift
//  BestIptvFriend
//
//  Created by Alexandre Schmidt on 15/12/2024.
//

import SwiftUI
import AVKit

#if os(iOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

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

#if os(iOS)
// iOS Implementation
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

    func updateUIView(_ uiView: UIView, context: Context) {}

    private func centerVideo(playerLayer: AVPlayerLayer) {
        let offsetY = UIScreen.main.bounds.height / 2

        playerLayer.setAffineTransform(
            CGAffineTransform(translationX: 1.5, y: -offsetY)
        )
    }
}

#elseif os(macOS)
// macOS Implementation
struct VideoPlayerView: NSViewRepresentable {
    let videoName: String
    let videoType: String

    func makeNSView(context: Context) -> NSView {
        let view = NSView()
        guard let path = Bundle.main.path(forResource: videoName, ofType: videoType) else {
            print("Video file not found: \(videoName).\(videoType)")
            return view
        }

        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)

        playerLayer.videoGravity = .resizeAspectFill
        playerLayer.frame = NSScreen.main?.frame ?? .zero
        view.layer = CALayer()
        view.layer?.addSublayer(playerLayer)

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

    func updateNSView(_ nsView: NSView, context: Context) {}

    private func centerVideo(playerLayer: AVPlayerLayer) {
        guard let screen = NSScreen.main else { return }
        let offsetY = screen.frame.height / 2

        playerLayer.setAffineTransform(
            CGAffineTransform(translationX: 1.5, y: -offsetY)
        )
    }
}
#endif
