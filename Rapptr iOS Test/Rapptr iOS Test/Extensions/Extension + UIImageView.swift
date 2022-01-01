//
//  Extension + UIImageView.swift
//  Rapptr iOS Test
//
//  Created by Sheearz Ahmed on 12/31/21.
//

import Foundation
import UIKit

extension UIImageView {
    
    //downloading & setting up Image in our image view
    func downloadImage(with url: String) {
        self.startActivityIndicator()
        if let url = URL(string: url) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                //Setting up image on Main thread
                DispatchQueue.main.async {[weak self] in
                    self?.stopActivityIndicator()
                    self?.image = UIImage(data: data)
                }
            }
            task.resume()
        }
    }
}

