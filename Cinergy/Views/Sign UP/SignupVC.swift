//
//  SignupVC.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 13/01/24.
//

import UIKit

class SignupVC: UIViewController {
    
    let viewModel = GuestTokenViewModel()
    let loginViewModel = LoginViewModel()
    let escapeRoomViewModel = EscapeRoomViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FetchToke()
    }
    
    func FetchToke(){
        
        viewModel.fetchGuestToken { result in
            
            switch result {
                
            case .success(let token):
                print("Got token: \(token)")
                self.login()
                
            case .failure(let error):
                print("Failed to get token: \(error)")
            }
        }
    }
    
    func login(){
        loginViewModel.loginUser { result in
            switch result {
            case .success(let loginResponse):
                // Login successful, handle response
                
                self.escapeRoomViewModel.loginResponse = loginResponse
                
            case .failure(let error):
                print("Failed to get token: \(error)")
                
            }
        }
    }
    
    @IBAction func BtnContinueAsGuest(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "EscapeRoomsVC") as! EscapeRoomsVC
            
            self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
}
