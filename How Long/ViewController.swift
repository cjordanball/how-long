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
        "Soft": 6 * 3,
        "Medium": 6 * 4,
        "Hard": 6 * 5
    ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Bar.progress = 0.0;
        mainTitle.text = "How Do You Like Eggs?";
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var Bar: UIProgressView!
    
    
    var timer = Timer();
    var hardness: String = "";
    var player: AVAudioPlayer!;
    
    func playSound() {
        let soundURL = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3");
        
        player = try! AVAudioPlayer(contentsOf: soundURL!);
        player.play();
    }
    
    
    @IBAction func eggHandler(_ sender: UIButton) {
        timer.invalidate();
        if (sender.currentTitle != hardness) {
            if let hardness = sender.currentTitle {
                let hardNum = Float(eggTimes[hardness]!);
                var timeSet = hardNum;
                timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
                    self.Bar.progress = max((hardNum - Float(timeSet)) / hardNum, 0.0);
                        timeSet -= 0.2;
                        if (timeSet <= 0) {
                            timer.invalidate();
                            self.playSound();
                            self.mainTitle.text = "Done!";
                        }
                        
                    }
                }
            }
        }
    }
//}

