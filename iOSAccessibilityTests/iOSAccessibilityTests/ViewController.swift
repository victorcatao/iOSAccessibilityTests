//
//  ViewController.swift
//  iOSAccessibilityTests
//
//  Created by Victor Catão on 15/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Background ImageView
        let backgroundImageView = UIImageView(image: UIImage(named: "space-background"))
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.contentMode = .scaleAspectFill
        view.addSubview(backgroundImageView)
        view.addConstraints([
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Confirm Button
        let confirmButton = UIButton()
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.backgroundColor = .red
        confirmButton.setTitle("Tap here to confirm", for: .normal)
        view.addSubview(confirmButton)
        view.addConstraints([
            confirmButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            confirmButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            confirmButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            confirmButton.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Checkbox Button
        let checkboxButton = UIButton()
        checkboxButton.isAccessibilityElement = true
        checkboxButton.translatesAutoresizingMaskIntoConstraints = false
        checkboxButton.setImage(UIImage(named: "checkbox_icon"), for: .normal)
        view.addSubview(checkboxButton)
        view.addConstraints([
            checkboxButton.widthAnchor.constraint(equalToConstant: 40),
            checkboxButton.heightAnchor.constraint(equalToConstant: 40),
            checkboxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            checkboxButton.bottomAnchor.constraint(equalTo: confirmButton.topAnchor)
        ])
        
        // Terms Label
        let termsLabel = UILabel()
        termsLabel.isAccessibilityElement = true
        termsLabel.translatesAutoresizingMaskIntoConstraints = false
        termsLabel.backgroundColor = .yellow
        termsLabel.textColor = .black
        termsLabel.text = "By selecting this checkbox, you are confirming that you have read and agree with the Terms of Use and Privacy Policy."
        view.addSubview(termsLabel)
        view.addConstraints([
            termsLabel.bottomAnchor.constraint(equalTo: confirmButton.topAnchor, constant: -8),
            termsLabel.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor),
            termsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        // Fix "Dynamic Text font sizes are unsupported"
        confirmButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
        confirmButton.titleLabel?.adjustsFontForContentSizeCategory = true
        // Fix "Text clipped"
        confirmButton.titleLabel?.numberOfLines = 0

        
        // Fix "Dynamic Text font sizes are unsupported"
        termsLabel.font = .preferredFont(forTextStyle: .body)
        termsLabel.adjustsFontForContentSizeCategory = true
        // Fix "Text clipped"
        termsLabel.numberOfLines = 0
        
        // Fix "Image name used in description"
        checkboxButton.accessibilityLabel = "Checkbox"
        
        backgroundImageView.accessibilityIdentifier = "BG_IMAGE"
        confirmButton.accessibilityIdentifier = "CONFIRM_BUTTON"
        checkboxButton.accessibilityIdentifier = "CHECKBOX_BUTTON"
        termsLabel.accessibilityIdentifier = "TERMS_TEXT"
        
        view.accessibilityElements = [confirmButton, checkboxButton, termsLabel]
        view.automationElements = [backgroundImageView, confirmButton, checkboxButton, termsLabel]
    }

}

