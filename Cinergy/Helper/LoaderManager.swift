//
//  LoaderManager.swift
//  Cinergy
//
//  Created by Ashiq P Paulose on 15/01/24.
//

import UIKit

class LoadingIndicator {

    static let shared = LoadingIndicator()

    private var overlayView: UIView?
    private var activityIndicator: UIActivityIndicatorView?

    private init() {
        // Private initializer to enforce singleton pattern
    }

    func startAnimating() {
        DispatchQueue.main.async {
            if self.overlayView == nil {
                self.setupOverlay()
            }

            if self.activityIndicator == nil {
                self.activityIndicator = UIActivityIndicatorView(style: .large)
                if let keyWindow = self.getKeyWindow() {
                    keyWindow.addSubview(self.activityIndicator!)
                    self.activityIndicator?.center = keyWindow.center
                }
            }

            // Show overlay
            self.overlayView?.isHidden = false

            // Start animating activity indicator
            self.activityIndicator?.startAnimating()
        }
    }

    func stopAnimating() {
        DispatchQueue.main.async {
            // Hide overlay
            self.overlayView?.isHidden = true

            // Stop animating activity indicator
            self.activityIndicator?.stopAnimating()
        }
    }

    private func setupOverlay() {
        if let keyWindow = self.getKeyWindow() {
            overlayView = UIView(frame: keyWindow.bounds)
            overlayView?.backgroundColor = UIColor(white: 0, alpha: 0.5)
            overlayView?.translatesAutoresizingMaskIntoConstraints = false
            keyWindow.addSubview(overlayView!)

            // Add constraints to make the overlay cover the entire screen
            NSLayoutConstraint.activate([
                overlayView!.topAnchor.constraint(equalTo: keyWindow.topAnchor),
                overlayView!.bottomAnchor.constraint(equalTo: keyWindow.bottomAnchor),
                overlayView!.leadingAnchor.constraint(equalTo: keyWindow.leadingAnchor),
                overlayView!.trailingAnchor.constraint(equalTo: keyWindow.trailingAnchor)
            ])
        }
    }

    private func getKeyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
