//
//  ViewController.swift
//  How Long
//
//  Created by C. Jordan Ball III on 6/19/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let eggTimes: [String: Int] = [
        "Soft": 60 * 3,
        "Medium": 60 * 4,
        "Hard": 60 * 5
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var mainTitle: UILabel!
    
    
    var time = Timer();
    var hardness: String = "";
    var player: AVAudioPlayer!;
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3");
        
        player = try! AVAudioPlayer(contentsOf: soundURL!);
        player.play();
    }
    
    

    
    



}

