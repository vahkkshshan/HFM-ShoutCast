//
//  ViewController.swift
//  Fm
//
//  Created by Vahkkshshan Sithsabasan on 2/27/19.
//  Copyright © 2019 Vahkkshshan Sithsabasan. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    
    
    @IBOutlet weak var facebook: UIButton!
    @IBOutlet weak var hotline: UIButton!
    @IBOutlet weak var whatsapp: UIButton!
    @IBOutlet weak var website: UIButton!
    @IBOutlet weak var stream: UIButton!
    @IBOutlet weak var volumeSlider: UISlider!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    @IBAction func facebookTapped(_ sender: Any) {
        facebook.showsTouchWhenHighlighted = true
        if let url = URL(string: "https://m.facebook.com/HinduFM/") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    @IBAction func openWebsite(_ sender: Any) {
        website.showsTouchWhenHighlighted = true
        if let url = URL(string: "http://www.hinduprefects.com") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    

    @IBAction func callHotline(_ sender: Any) {
        hotline.showsTouchWhenHighlighted = true
        let url: NSURL = URL(string: "TEL://+94115810038")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func openWhatsapp(_ sender: Any) {
        whatsapp.showsTouchWhenHighlighted = true
        if let url = URL(string: "https://wa.me/94767700084") {
            UIApplication.shared.open(url, options: [:])
        }
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let url = URL(string: "http://s5.voscast.com:8566")
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
        
//        let playerLayer=AVPlayerLayer(player: player!)
//        playerLayer.frame=CGRect(x:0, y:0, width:10, height:50)
//        self.view.layer.addSublayer(playerLayer)
        
        
    }
    
    @IBAction func toggleStream(_ sender: Any) {
        stream.showsTouchWhenHighlighted = true
        if player?.rate == 0
        {
            player!.play()
            stream!.setImage(UIImage(named: "pause-icon.png"), for: UIControlState.normal)
            
        } else {
            player!.pause()
            stream!.setImage(UIImage(named: "on-off-power-button.png"), for: UIControlState.normal)
            
        }
    }
    
    @IBAction func controlVolume(_ sender: Any) {
        
        player!.volume=volumeSlider.value
    }
    
    
    
}

