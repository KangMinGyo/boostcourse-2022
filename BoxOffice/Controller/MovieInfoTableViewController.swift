//
//  MovieInfoTableViewController.swift
//  BoxOffice
//
//  Created by Kang on 2022/02/09.
//

import UIKit

class MovieInfoTableViewController: UIViewController, UITableViewDataSource {
    
    var movieInfo: [MovieInfo] = []
    var movieComment: [Comments] = []
//    var movie: [Movies] = []
    var movieName: String?
    var Image: UIImage?
    var id: String?


    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var movieGenreAndTime: UILabel!
    
    @IBOutlet weak var reservationRate: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieAudience: UILabel!
    
    @IBOutlet weak var moviePlot: UITextView!
    
    @IBOutlet weak var movieDirector: UILabel!
    @IBOutlet weak var screenActor: UILabel!
    
    @IBOutlet weak var movieCommentTableView: UITableView!
    let cellIdentifier = "commentCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = movieName
        movieImage.image = Image
        print(id!)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("셀 갯수 : \(movieComment.count)")
        return movieComment.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCommetTableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! MovieCommetTableViewCell

        let comment: Comments = self.movieComment[indexPath.row]
        cell.nickNameLabel.text = comment.writer
        cell.dateAndTimeLabel.text = String(comment.timestamp)
        cell.commentLabel.text = comment.contents
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        guard let url: URL = URL(string: "https://connect-boxoffice.run.goorm.io/movie?id=\(id!)") else {
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
                let apiResponse: MovieInfo = try JSONDecoder().decode(MovieInfo.self, from: data)
                
                DispatchQueue.main.async {
                    self.id = apiResponse.id
                    self.movieTitle.text = apiResponse.title
                    self.releaseDate.text = apiResponse.date
                    self.movieGenreAndTime.text = apiResponse.genre
                    self.reservationRate.text = apiResponse.grandAndRate
                    self.movieRating.text = String(format: "%.2f", apiResponse.user_rating)
                    self.movieAudience.text = String(apiResponse.audience)
                    self.moviePlot.text = apiResponse.synopsis
                    self.movieDirector.text = apiResponse.director
                    self.screenActor.text = apiResponse.actor
                }

            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        
        //MARK: Comment TableView
        guard let commentUrl: URL = URL(string: "https://connect-boxoffice.run.goorm.io/comments?movie_id=\(id!)") else {
            return
        }
        
        let commentSession: URLSession = URLSession(configuration: .default)
        let commentDataTask: URLSessionDataTask = commentSession.dataTask(with: commentUrl) { (data: Data?, response: URLResponse?, error: Error?) in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let commentApiResponse: CommentAPIResponse = try JSONDecoder().decode(CommentAPIResponse.self, from: data)
                self.movieComment = commentApiResponse.comment
                
                
                DispatchQueue.main.async {
                    self.movieCommentTableView.reloadData()
                }

            } catch(let err) {
                print(err.localizedDescription)
            }
        }
        
        dataTask.resume()
        commentDataTask.resume()
     
        }

    }


