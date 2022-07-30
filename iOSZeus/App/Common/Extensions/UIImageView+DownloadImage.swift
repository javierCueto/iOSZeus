//
//  UIImageView+DownloadImage.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit

extension UIImageView {
    func setImageFromNetwork(withURL url: URL?) {
        addDefaultImage()
        guard let url = url else { return }
        downLoadImage(with: url)
    }
    
    
    private func downLoadImage(with url: URL) {
        let activityIndicator = UIActivityIndicatorView()
        addSubview(activityIndicator)
        activityIndicator.fillSuperView()
        activityIndicator.startAnimating()
        activityIndicator.style = .large
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        activityIndicator.removeFromSuperview()
                        self.image = image
                    }
                }
            }
        }
    }
    
    private func addDefaultImage() {
        let defaultImage: UIImage? = UIImage(named: GImages.profile)
        image = defaultImage
    }
    
}

