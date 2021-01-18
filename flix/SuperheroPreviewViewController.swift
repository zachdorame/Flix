//
//  SuperheroPreviewViewController.swift
//  flix
//
//  Created by Zach Dorame-Barajas on 1/17/21.
//

import UIKit
import WebKit

class SuperheroPreviewViewController: UIViewController {

    @IBOutlet weak var moviePreview: WKWebView!
    
    var movie: [String:Any]!
    var trailers = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let movieId = (movie["id"] as? Int)!
        let movieIdStr = String(movieId)
        let apiPathOne = "https://api.themoviedb.org/3/movie/"
        let apiPathTwo = "/videos?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed"
        
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
            
            let key = self.trailers[0]["key"] as! String
            let myURL = URL(string: "https://www.youtube.com/watch?v=" + key)
            let myRequest = URLRequest(url: myURL!)
            self.moviePreview.load(myRequest)
            
            
           }
        }
        task.resume()
        
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
