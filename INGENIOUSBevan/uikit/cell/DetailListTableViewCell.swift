//
//  DetailListTableViewCell.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

class DetailListTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var profilePicture: ImageViewLoader = {
        let profilePicture = ImageViewLoader()
        profilePicture.image = UIImage(named: "DefaultFemale")
        profilePicture.contentMode = .scaleToFill
        profilePicture.clipsToBounds = true
        profilePicture.layer.cornerRadius = 10
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        return profilePicture
    }()
    
    private var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Name"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.numberOfLines = 0
        return nameLabel
    }()
    
    private var phoneLabel: UILabel = {
        let phoneLabel = UILabel()
        phoneLabel.text = "PhoneNumber"
        phoneLabel.textAlignment = .left
        phoneLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        phoneLabel.adjustsFontForContentSizeCategory = true
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.numberOfLines = 0
        return phoneLabel
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setConstraint()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setConstraint()
    }
    
    // MARK: - Public Methods
    
    func configureCell(user: User?) {
        self.nameLabel.text = user?.name ?? "Empty Name"
        self.phoneLabel.text = user?.phone ?? "-"
        if let avatar = user?.avatar {
            self.profilePicture.setImage(
                with: URL(string: avatar),
                placeholderImage: UIImage(named: "DefaultFemale")
            )
        }
    }
    
    // MARK: - Private Methods
    private func setConstraint() {
        self.contentView.addSubview(profilePicture)
        self.contentView.addSubview(nameLabel)
        self.contentView.addSubview(phoneLabel)
        
        
        profilePicture.leadingAnchor.constraint(
            equalTo: self.contentView.leadingAnchor, constant: 12
        ).isActive = true
        profilePicture.topAnchor.constraint(
            equalTo: self.contentView.topAnchor, constant: 12
        ).isActive = true
        profilePicture.bottomAnchor.constraint(
            equalTo: self.bottomAnchor, constant: -12
        ).isActive = true
        profilePicture.widthAnchor.constraint(
            equalToConstant: 75
        ).isActive = true
        profilePicture.heightAnchor.constraint(
            equalToConstant: 150
        ).isActive = true
        
        nameLabel.leadingAnchor.constraint(
            equalTo: self.profilePicture.trailingAnchor,
            constant: 20
        ).isActive = true
        nameLabel.topAnchor.constraint(
            equalTo: self.profilePicture.topAnchor
        ).isActive = true
        nameLabel.trailingAnchor.constraint(
            equalTo: self.contentView.trailingAnchor,
            constant: -12
        ).isActive = true
       
        phoneLabel.leadingAnchor.constraint(
            equalTo: self.nameLabel.leadingAnchor
        ).isActive = true
        phoneLabel.topAnchor.constraint(
            equalTo: self.nameLabel.bottomAnchor,
            constant: 12
        ).isActive = true
        phoneLabel.bottomAnchor.constraint(
            equalTo: self.contentView.bottomAnchor,
            constant: -12
        ).isActive = true
        phoneLabel.trailingAnchor.constraint(
            equalTo: self.nameLabel.trailingAnchor
        ).isActive = true
    }

}
