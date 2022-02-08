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
        cell.imageView?.image = nil
        
        DispatchQueue.global().async {
            guard let imageURL: URL = URL(string: movies.thumb) else { return }
            guard let imageData: Data = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                
                if let index: IndexPath = tableView.indexPath(for: cell) {
                    if index.row == indexPath.row {
                        cell.thumbImageView?.image = UIImage(data: imageData)
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
                self.movieTableView.reloadData()
            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        dataTask.resume()
    }

}
    

