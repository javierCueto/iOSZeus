//
//  SeeSelfieViewController.swift
//  iOSZeus
//
//  Created by Javier Cueto on 30/07/22.
//

import UIKit

final class SeeSelfieViewController: UIViewController {
   
    // MARK: - properties
    var presenter: SeeSelfiePresenterInputFromView?
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
    }
    
    // MARK: - Helpers
    private func configUI() {
        title = presenter?.title
        
        view.addSubview(userImageView)
        userImageView.fillSuperView()
        updateImage()
        
        guard let backgroundColor = presenter?.backgroundColor else { return }
        view.backgroundColor =  hexStringToUIColor(hex: backgroundColor)
    }
    
    private func updateImage(){
        if let image = presenter?.userImageData as? UIImage {
            userImageView.image = image
        }else{
            let imageURL = URL(string: presenter?.imageURL ?? String() )
            userImageView.setImageFromNetwork(withURL: imageURL)
        }
    }

}

extension SeeSelfieViewController: SeeSelfieViewFromPresenter { }
