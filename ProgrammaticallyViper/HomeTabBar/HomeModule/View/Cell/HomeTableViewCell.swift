//
//  HomeTableViewCell.swift
//  ProgrammaticallyViper
//
//  Created by Eren Demir on 30.07.2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    let photo = UIImageView()
    let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setupWidgets()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupWidgets(){
        contentView.addSubview(photo)
        setupPhoto()
        contentView.addSubview(label)
        setupTitle()
    }
    
    func setupPhoto(){
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.clipsToBounds = true
        photo.backgroundColor = .gray
        photo.widthAnchor.constraint(equalToConstant:50).isActive = true
        photo.heightAnchor.constraint(equalToConstant:50).isActive = true
        photo.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:20).isActive = true
        photo.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor).isActive = true
    }
    func setupTitle(){
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 20).isActive = true
        label.widthAnchor.constraint(equalToConstant:50).isActive = true
        label.heightAnchor.constraint(equalToConstant:50).isActive = true
        label.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
    }
}
