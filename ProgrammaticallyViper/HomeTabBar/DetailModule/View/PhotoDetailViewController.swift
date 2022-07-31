//
//  PhotoDetailViewController.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 31.07.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    var model: PhotoModel?
    let backgroundView = UIView()
    let label = UILabel()
    let photo = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupWidgets()
    }
    

    func setupWidgets(){
        view.addSubview(backgroundView)
        setupBackgroundView()
        backgroundView.addSubview(label)
        setuplabelWidget()
        backgroundView.addSubview(photo)
        setupPhotoWidget()
    }
    
    func setupBackgroundView(){
        let guide = self.view.safeAreaLayoutGuide
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        backgroundView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: guide.topAnchor,constant:0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: guide.bottomAnchor,constant:0).isActive = true
        backgroundView.backgroundColor = .white
        
    }
    
    func setuplabelWidget(){
        label.text = "\(model!.id!)"
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: backgroundView.topAnchor,constant: 100).isActive = true
        label.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor).isActive = true
    }
    
    func setupPhotoWidget(){
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.backgroundColor = .gray
        photo.leadingAnchor.constraint(equalTo:backgroundView.leadingAnchor, constant:20).isActive = true
        photo.trailingAnchor.constraint(equalTo:backgroundView.trailingAnchor, constant:-20).isActive = true
        photo.topAnchor.constraint(equalTo: label.bottomAnchor,constant: 50).isActive = true
        photo.heightAnchor.constraint(equalToConstant: 200).isActive = true
        if let url = URL(string:(model?.thumbnailUrl!)!){
            DispatchQueue.global().async {
                let data = try?  Data(contentsOf: url)
                DispatchQueue.main.async {
                    self.photo.image = UIImage(data: data!)
                }
            }
        }
    }
    
}
