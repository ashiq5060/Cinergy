//
//  EscapeRoomsVC.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 13/01/24.
//

import UIKit
import SDWebImage

class EscapeRoomsVC: UIViewController {
    
    @IBOutlet weak var escapeRoomCollectionView: UICollectionView!
    
     let viewModel = EscapeRoomViewModel()
    var escapeRooms: [EscapeRoomsMovie] = []
    
    var backgroundView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchEscapeRooms()
    }
    
    func fetchEscapeRooms() {
        viewModel.fetchEscapeRoom { result in
                switch result {
                case .success(let escapeRooms):
                    self.escapeRooms = escapeRooms.escapeRoomsMovies
                    DispatchQueue.main.async {
                        self.escapeRoomCollectionView.reloadData()
                    }
                case .failure(let error):
                    print("Error fetching escape rooms: \(error)")
                }
            }
        }
    
    @IBAction func BtnBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

// MARK: - CollectionViewDataSource & CollectionViewDelegate

extension EscapeRoomsVC : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return escapeRooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EscapeRoomCell", for: indexPath) as! EscapeRoomCell
        
        
        cell.lblRoomName.text = escapeRooms[indexPath.item].title
        
        if let imageUrl = URL(string: escapeRooms[indexPath.item].imageURL) {
            cell.imgEsacpeRoom.sd_setImage(with: imageUrl, completed: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 0
        
        let size = collectionView.frame.size.width / 2
        return CGSize(width: size, height: size * 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let detailsController = storyboard.instantiateViewController(withIdentifier: "DetailPopupVC") as? DetailPopupVC else { return }
        
        detailsController.escapeRoomDetails = escapeRooms[indexPath.item]
        
        // Configure the presentation style
        detailsController.modalPresentationStyle = .formSheet
        
        // Configure the transition style
        detailsController.modalTransitionStyle = .coverVertical
        detailsController.isModalInPresentation = true
        
        // If it's a UISheetPresentationController, configure detents
        if let presentationController = detailsController.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
            // Set corner radius
            detailsController.view.layer.cornerRadius = 16
            detailsController.view.layer.masksToBounds = true
        }
        
        // Create a black transparent background view
        backgroundView = UIView(frame: view.bounds)
        backgroundView?.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        backgroundView?.alpha = 0.0 // Start with alpha 0
        
        // Add the background view to the presenting view controller's view
        view.addSubview(backgroundView!)
        
        // Set the delegate to handle button tap
        detailsController.delegate = self
        
        // Show the background view immediately
        backgroundView?.alpha = 1.0
        
        // Present the view controller without animation
        present(detailsController, animated: false, completion: nil)
    }
    
}


// DetailPopupVCDelegate method to dismiss the sheet
extension EscapeRoomsVC : DetailPopupVCDelegate {
    func dismissSheet() {
        dismiss(animated: true) {
            // Remove the background view from its superview
            self.backgroundView?.removeFromSuperview()
        }
    }
}
