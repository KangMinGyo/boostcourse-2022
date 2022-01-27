//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Kang on 2022/01/25.
//

import UIKit
import AVFoundation

class PlayMusicViewController: UIViewController, AVAudioPlayerDelegate {

    @IBOutlet weak var musicNameLabel: UILabel!
    @IBOutlet weak var playAndPauseButton: UIButton!
    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var leftTimeLabel: UILabel!
    @IBOutlet weak var rightTimeLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var player: AVAudioPlayer!
    var timer: Timer!
    
    var musicName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        musicNameLabel.text = musicName
        initaliizePlayer()
    }
    
    func initaliizePlayer() {
        //음악파일 가져오기
        guard let soundAsset: NSDataAsset = NSDataAsset(name: "\(musicName!)") else {
            print("음악 파일이 존재하지 않습니다.")
            return
        }
        //오디오 플레이어 초기화
        do {
            try self.player = AVAudioPlayer(data: soundAsset.data)
            self.player.delegate = self
        } catch let error as NSError {
            print("오류발생 : \(error.localizedDescription)")
        }
        //slider 초기화
        self.timeSlider.maximumValue = Float(self.player.duration)
        self.timeSlider.minimumValue = 0
        
        //right time Label (음악 전체 길이)
        let duration = self.player.duration
        let minute: Int = Int(duration/60)
        let second: Int = Int(duration.truncatingRemainder(dividingBy: 60))
        
        rightTimeLabel.text = String(format: "%02ld:%02ld", minute, second)
    }
    
    //타이머
    func makeAndFireTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [unowned self] (timer: Timer) in
            if self.timeSlider.isTracking { return }
            
            self.updateTimeLabel(time: self.player.currentTime)
            //움직이는 원(?)
            self.timeSlider.value = Float(self.player.currentTime)
        })
        self.timer.fire()
    }
    
    func updateTimeLabel(time: TimeInterval) {
        let minute: Int = Int(time / 60)
        let second: Int = Int(time.truncatingRemainder(dividingBy: 60))
        
        leftTimeLabel.text = String(format: "%02ld:%02ld", minute, second)
        
    }
    
    //타이머 멈춤
    func invalidateTimer() {
        self.timer.invalidate()
        self.timer = nil
    }

    
    //MARK: - Play Button (Action)
    @IBAction func playMusicButton(_ sender: UIButton) {
        //play button 눌렀을 때
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            self.player?.play()
            playAndPauseButton.setImage(UIImage(named: "pause_button"), for: .normal)
        } else {
            self.player?.pause()
            playAndPauseButton.setImage(UIImage(named: "play_button"), for: .normal)
        }
        
        if sender.isSelected {
            makeAndFireTimer()
        } else {
            invalidateTimer()
        }
    }
    
    //MARK: - Slider changed (Action)
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        //slider 조절했을 때
        self.updateTimeLabel(time: TimeInterval(sender.value))
        if sender.isTracking { return }
        self.player.currentTime = TimeInterval(sender.value)
        
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playAndPauseButton.setImage(UIImage(named: "play_button"), for: .normal)
    }
    
    //MARK: - 앞으로가기_음악 (Action)
    @IBAction func forwardMusicButton(_ sender: UIButton) {
    }
    
    //MARK: - 뒤로가기_음악 (Action)
    @IBAction func backMusicButton(_ sender: UIButton) {
    }
}

