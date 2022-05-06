//
//  ChatTableViewCell.swift
//  iOSTest
//
//  Copyright © 2020 Rapptr Labs. All rights reserved.

import UIKit
import AlamofireImage

class ChatTableViewCell: UITableViewCell {
    
    /**
     * =========================================================================================
     * INSTRUCTIONS
     * =========================================================================================
     * 1) Setup cell to match mockup
     *
     * 2) Include user's avatar image
     **/
    
    // MARK: - Outlets
    @IBOutlet weak var header: UILabel!
    @IBOutlet weak var body: UILabel!
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var bubble: UIView!
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        styleBodyBackground()
    }
    
    override func prepareForReuse() {
        //default set image to placeholder since this one relies on url
        avatarImageView.image = UIImage(systemName: "person.fill")
    }
    
    // MARK: - Public
    func setCellData(message: Message) {
        header.text = message.username
        body.text = message.text
        
        if let url = message.avatarURL {
            avatarImageView.af.setImage(withURL: url)
        }
    }
    
    func styleBodyBackground() {
        bubble.layer.cornerRadius = 8
        bubble.layer.borderWidth = 1
        bubble.layer.borderColor = UIColor.RapptrColors.borderGrey?.cgColor
    }
    
    /// Checks if there is a valid url in payload, if there is it will attempt
    /// a call with said url for avatar image.
    ///
    /// Alamofire is a little heavy handed approach for this, but to display
    /// use of cocoapods added here
    /// - Parameter avatarUrl: optional url for avatar image
    func setAvatarImage(avatarUrl: URL?) {
        guard let validURL = avatarUrl else {
            return
        }
        
        avatarImageView.af.setImage(withURL: validURL)
    }
}
