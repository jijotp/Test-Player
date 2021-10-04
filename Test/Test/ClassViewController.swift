//
//  ClassViewController.swift
//  Test
//
//  Created by Jijo on 04/10/21.
//

import UIKit
import AVKit
import AVFoundation

class ClassViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        // Do any additional setup after loading the view.
    }
    

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
      }
    
      override var shouldAutorotate: Bool {
          return true
      }
    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()

        let videoURL = URL(string: "https://cph-p2p-msl.akamaized.net/hls/live/2000341/test/master.m3u8")
        let player = AVPlayer(url: videoURL!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        self.view.layer.addSublayer(playerLayer)
        self.view.bringSubviewToFront(videoView)
        playerLayer.frame = view.bounds
        player.play()

    }

}
