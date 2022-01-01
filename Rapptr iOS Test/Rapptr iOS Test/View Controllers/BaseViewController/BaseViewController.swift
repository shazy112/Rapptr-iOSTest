//
//  BaseViewController.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        setupBarButtonItem()
    }
    
    // MARK: - Supporting Methods
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    /// Setting up bar button item with title "" so it does not hold viewcontroller title
    private func setupBarButtonItem() {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    /// set background image if required else set background color
    /// - Parameter bgImage: background Image
    func setupBackgroundImage(with bgImage: UIImage? = nil) {
        if let image = bgImage {
            //setting up background imageView
            let backgroundImageView = UIImageView(image: image)
            self.view.addSubview(backgroundImageView)
            self.view.sendSubviewToBack(backgroundImageView)
            //setting up background imageview constraints
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
            backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
            backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
            backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        }
        else {
            self.view.backgroundColor = .baseViewBackgroundColor
        }
    }
}

