//
//  DetailProfileView.swift
//  INGENIOUSBevan
//
//  Created by bevan on 12/05/23.
//

import UIKit

class DetailProfileView: UIView {
    
    private var backgroundImage: UIImageView = {
        let backgroundImage = UIImageView()
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        return backgroundImage
    }()
    
    private var profilePicture: ImageViewLoader = {
        let profilePicture = ImageViewLoader()
        profilePicture.image = UIImage(named: "DefaultFemale")
        profilePicture.contentMode = .scaleAspectFit
        profilePicture.layer.cornerRadius = 10
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        return profilePicture
    }()
    
    private var phoneNumberLabel : UILabel = {
        let phoneNumberLabel = UILabel()
        phoneNumberLabel.text = "inglabAsessment"
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        phoneNumberLabel.adjustsFontForContentSizeCategory = true
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.numberOfLines = 0
        return phoneNumberLabel
    }()
    
    private var phoneNumberImage: UIImageView = {
        let phoneNumberImage = UIImageView()
        phoneNumberImage.image = UIImage(named: "icon_call")
        phoneNumberImage.contentMode = .scaleAspectFill
        phoneNumberImage.translatesAutoresizingMaskIntoConstraints = false
        return phoneNumberImage
    }()
    
    private var emailLabel : UILabel = {
        let emailLabel = UILabel()
        emailLabel.text = "inglabAsessment"
        emailLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailLabel.adjustsFontForContentSizeCategory = true
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.numberOfLines = 0
        return emailLabel
    }()
    
    private var emailImage: UIImageView = {
        let emailImage = UIImageView()
        emailImage.image = UIImage(named: "icon_email")
        emailImage.contentMode = .scaleAspectFill
        emailImage.translatesAutoresizingMaskIntoConstraints = false
        return emailImage
    }()
    
    private var descriptionTextView : UITextView = {
        let descriptionTextView = UITextView()
        descriptionTextView.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        descriptionTextView.adjustsFontForContentSizeCategory = true
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.isEditable = false
        return descriptionTextView
    }()
    
    public init() {
        super.init(frame: .zero)
        createConstraint()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        createConstraint()
    }
    
    private func createConstraint() {
        self.setProfileAndBackgroundConstraint()
        self.setPhoneConstraint()
        self.setEmailConstraint()
        self.setDescriptionTextConstraint()
    }
    
    private func setProfileAndBackgroundConstraint() {
        self.addSubview(backgroundImage)
        self.addSubview(profilePicture)
        
        backgroundImage.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        backgroundImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        profilePicture.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        profilePicture.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        profilePicture.widthAnchor.constraint(equalToConstant: 200).isActive = true
        profilePicture.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setPhoneConstraint() {
        self.addSubview(phoneNumberLabel)
        self.addSubview(phoneNumberImage)
        
        phoneNumberLabel.topAnchor.constraint(equalTo: profilePicture.bottomAnchor, constant: 20).isActive = true
        phoneNumberLabel.leadingAnchor.constraint(equalTo: self.phoneNumberImage.trailingAnchor, constant: 20).isActive = true
        phoneNumberLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        phoneNumberImage.topAnchor.constraint(equalTo: phoneNumberLabel.topAnchor).isActive = true
        phoneNumberImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        phoneNumberImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        phoneNumberImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setEmailConstraint() {
        self.addSubview(emailLabel)
        self.addSubview(emailImage)
        
        emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: self.emailImage.trailingAnchor, constant: 20).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        
        emailImage.topAnchor.constraint(equalTo: emailLabel.topAnchor).isActive = true
        emailImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40).isActive = true
        emailImage.widthAnchor.constraint(equalToConstant: 20).isActive = true
        emailImage.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func setDescriptionTextConstraint() {
        self.addSubview(descriptionTextView)
        
        descriptionTextView.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        descriptionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        descriptionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -40).isActive = true
    }
    
    func configureDetail(detailData: DetailViewDataModel) {
        self.emailLabel.text = detailData.email
        self.phoneNumberLabel.text = detailData.phoneNumber
        self.descriptionTextView.text = detailData.description
        
        if let profilePicture = detailData.profilePicture {
            self.profilePicture.setImage(
                with: URL(string: profilePicture),
                placeholderImage: UIImage(named: "DefaultFemale")
            )
        }
        
    }
    
}
