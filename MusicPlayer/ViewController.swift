//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Kang on 2022/01/26.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var musicTableView: UITableView!
    
    let musicListCellIdatifier: String = "listCell"
    
    let musicName: [String] = ["Luxery", "Unavailable"]
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MusicListTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.musicListCellIdatifier, for: indexPath) as! MusicListTableViewCell
        
        let name = musicName[indexPath.row]
        cell.musicNameLabel?.text = name
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "Music APP"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
