//
//  DetailPopupVC.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 14/01/24.
//

import UIKit
import SDWebImage

protocol DetailPopupVCDelegate: AnyObject {
    func dismissSheet()
}

class DetailPopupVC: UIViewController {
    
    var escapeRoomDetails: EscapeRoomsMovie?
    weak var delegate: DetailPopupVCDelegate?
    
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblMembers: UILabel!
    @IBOutlet weak var imgPoster: CornerRoundedImageView!
    @IBOutlet weak var lblSynopsis: UITextView!
    @IBOutlet weak var lblTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    private func configureUI() {
            guard let escapeRoomDetails = escapeRoomDetails else {
                return
            }

        lblDuration.text = escapeRoomDetails.runTime + " mins"
        lblTitle.text = escapeRoomDetails.title
        lblSynopsis.text = escapeRoomDetails.synopsis
        if let imageUrl = URL(string: escapeRoomDetails.imageURL) {
            imgPoster.sd_setImage(with: imageUrl, completed: nil)
        }
            
        }
    
    @IBAction func dismissButtonTapped(_ sender: UIButton) {
        delegate?.dismissSheet()
    }
    
    @IBAction func BtnBookNow(_ sender: UIButton) {

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "MovieInfoVC") as! MovieInfoVC
        vc.movieid = escapeRoomDetails?.id ?? ""
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
    }
    
}

