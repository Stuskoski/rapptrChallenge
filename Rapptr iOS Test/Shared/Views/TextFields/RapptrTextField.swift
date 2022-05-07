//
//  RapptrTextField.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/7/22.
//

import Foundation
import UIKit

class RapptrTextField: UITextField {
    
    var textPadding = UIEdgeInsets(
            top: 0,
            left: 24,
            bottom: 0,
            right: 0
        )
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        styleView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        styleView()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.textRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        let rect = super.editingRect(forBounds: bounds)
        return rect.inset(by: textPadding)
    }
    
    func styleView() {
        attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor:  UIColor.RapptrColors.textfieldPlaceholder])
        backgroundColor = UIColor.white.withAlphaComponent(0.5)
        leftView = UIView(frame: CGRect(x: 0, y: 00, width: 50, height: 55))
        textColor = UIColor.RapptrColors.textColor
        layer.cornerRadius = 3
        layer.masksToBounds = true
        borderStyle = .none
    }
}
