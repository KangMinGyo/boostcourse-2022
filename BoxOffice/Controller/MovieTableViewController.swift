//
//  ViewController.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/06.
//

import UIKit

class MovieTableViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var movieTableView: UITableView!
    let cellIdentifier = "movieCell"
    var movie: [Movies] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "예매율순"

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movie.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! MovieTableViewCell
        
        let movies: Movies = self.movie[indexPath.row]
        
        cell.movieTitleLabel.text = movies.title
        cell.movieInfoLabel.text = movies.full
        cell.releaseLabel.text = movies.date
        cell.imageView?.image = nil //셀이 재사용되기전에 삭제
        
        print("썸네일 : " + movies.thumb)
        
        //백그라운드 Queue
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movies.thumbnail[indexPath.row]) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                if let index: IndexPath = self.movieTableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.thumbImageView?.image = UIImage(data: imageData)
                        cell.setNeedsLayout()
                        cell.layoutIfNeeded()
                    }
                }
            }
        }
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movies") else {
            return
        }
        
        let session: URLSession = URLSession(configuration: .default)
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let apiResponse: APIResponse = try JSONDecoder().decode(APIResponse.self, from: data)
                self.movie = apiResponse.movies
                
                DispatchQueue.main.async {
                    self.movieTableView.reloadData()
                }

            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: MovieInfoTableViewController = segue.destination as? MovieInfoTableViewController else {
            return
        }
        
        guard let cell: MovieTableViewCell = sender as? MovieTableViewCell else {
            return
        }
        
        nextViewController.movieName = cell.movieTitleLabel?.text
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}
    

