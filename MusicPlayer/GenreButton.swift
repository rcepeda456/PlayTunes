//
//  GenreButton.swift
//  MusicPlayer
//
//  Created by Raymond Cepeda on 7/17/19.
//  Copyright © 2019 Raymond Cepeda. All rights reserved.
//

import UIKit
import MediaPlayer

class Genre: UIViewController {
    
        var musicPlayer = MPMusicPlayerController.applicationMusicPlayer
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

   

    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization {(status) in
            if status == .authorized{
        self.playGenre(genre: sender.currentTitle!)
    }
        }
    }

    @IBAction func StopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    
    }

    @IBAction func NextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    func playGenre(genre:String){
        musicPlayer.stop()
        
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value:genre, forProperty:MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
        
        
        
    }
}

