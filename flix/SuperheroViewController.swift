//
//  SuperheroViewController.swift
//  flix
//
//  Created by Zach Dorame-Barajas on 1/16/21.
//

import UIKit

class SuperheroViewController: UIViewController {

    @IBOutlet weak var superheroPoster: UIImageView!
    @IBOutlet weak var superheroPreview: UIImageView!
    @IBOutlet weak var superheroSynopsis: UILabel!
    @IBOutlet weak var superheroTitle: UILabel!
    
    var movie: [String: Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        superheroTitle.text = movie["title"] as? String
        superheroTitle.sizeToFit()
        
        superheroSynopsis.text = movie["overview"] as? String
        superheroSynopsis.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string: baseUrl + posterPath)
        superheroPreview.af.setImage(withURL: posterUrl!)
        
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: "https://image.tmdb.org/t/p/w780" + posterPath)
        superheroPoster.af.setImage(withURL: backdropUrl!)
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsViewController = segue.destination as! SuperheroPreviewViewController
        detailsViewController.movie = movie
    }
    


}
