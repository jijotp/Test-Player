//
//  ClassViewController.swift
//  Test
//
//  Created by Jijo on 04/10/21.
//

import UIKit
import AVKit
import AVFoundation
import YouTubePlayer
import YoutubePlayer_in_WKWebView

class ClassViewController: UIViewController {
    
    @IBOutlet weak var playerView: WKYTPlayerView!
    @IBOutlet weak var videoView: UIView!
    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated:false)
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated:    animated)
    }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
//        let myVideoURL = NSURL(string: "https://www.youtube.com/watch?v=nGj5qelzgUo")
//        videoPlayer.loadVideoURL(myVideoURL! as URL)
//        videoPlayer.addSubview(videoView)
//        videoView.bringSubviewToFront(videoPlayer)
        
        self.playerView.delegate = self
        let playerVars = ["EngW7tLk6R8": 0]
        playerView.load(withVideoId: "nGj5qelzgUo", playerVars: playerVars)
        videoView.bringSubviewToFront(playerView)
        playerView.layer.addSublayer(videoView.layer)
        
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    func setGradientBackground() {
        let colorBottom =  UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.76).cgColor
        let colorTop = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.videoView.bounds
        
        self.videoView.layer.insertSublayer(gradientLayer, at:0)
    }
}

extension ClassViewController: WKYTPlayerViewDelegate{
    
    func playerViewDidBecomeReady(_ playerView: WKYTPlayerView) {
        self.playerView.playVideo()
        
    }
    
}
