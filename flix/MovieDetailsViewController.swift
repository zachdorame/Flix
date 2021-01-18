//
//  MovieDetailsViewController.swift
//  flix
//
//  Created by Zach Dorame-Barajas on 1/15/21.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var synopsisLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var previewButton: UIButton!
    
    var movie: [String:Any]!
    var trailers = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = movie["title"] as? String
        titleLabel.sizeToFit()
        
        synopsisLabel.text = movie["overview"] as? String
        synopsisLabel.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        posterView.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + posterPath)
        backdropView.af.setImage(withURL: backdropUrl!)
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        /*
        let movieId = (movie["id"] as? Int)!
        let movieIdStr = String(movieId)
        let apiPathOne = "https://api.themoviedb.org/3/movie/"
        let apiPathTwo = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
        // print(apiPathOne + movieIdStr + apiPathTwo)
        // var trailers: [[String:Any]]
        let url = URL(string: apiPathOne + movieIdStr + apiPathTwo)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.trailers = dataDictionary["results"] as! [[String:Any]]
            //print(self.trailers)
            //print("DATADICT")
            //print(dataDictionary)
            //print("end DATA DICT")
            // self.trailers.reloadData()
           }
        }
        task.resume()
        
        print(trailers)
        */
        
        let detailsViewController = segue.destination as! MoviePreviewViewController
        detailsViewController.movie = movie
        
        
    }


}
