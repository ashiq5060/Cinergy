//
//  MovieInfoVC.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 16/01/24.
//

import UIKit

class MovieInfoVC: UIViewController {
    
    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var timeCollectionView: UICollectionView!
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    
    
    var movieInfoViewModel = MovieInfoViewModel()
    
    var movieid = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        fetchEscapeRoomForMovie(withId: movieid)
    }
    
    func fetchEscapeRoomForMovie(withId movieId: String) {
        movieInfoViewModel.fetchEscapeRoom(movieId: movieId) { result in
            switch result {
            case .success(let movieInfo):
                // Handle success, update UI, etc.
                self.configureUI(movieData: movieInfo.movieInfo)
                
            case .failure(let error):
                // Handle failure, show error message, etc.
                print("Error: \(error)")
            }
        }
    }
    
     func configureUI(movieData :MovieResponseModel.MovieInfo) {
            
         lblDuration.text = movieData.runTime + " mins"
         lblTitle.text = movieData.title
         if let imageUrl = URL(string: movieData.imageUrl) {
            imgPoster.sd_setImage(with: imageUrl, completed: nil)
        }
            
        }
    
    @IBAction func BtnBack(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    
}

// MARK: - CollectionViewDataSource & CollectionViewDelegate
extension MovieInfoVC : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == dateCollectionView {
            return 5
            
        } else if collectionView == timeCollectionView {
            return 5
        }
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == dateCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DateCollectionViewCell", for: indexPath) as! DateCollectionViewCell
            
            return cell
            
        } else if collectionView == timeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeCollectionViewCell", for: indexPath) as! TimeCollectionViewCell
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
