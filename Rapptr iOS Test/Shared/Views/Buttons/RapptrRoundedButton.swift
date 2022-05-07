//
//  RapptrRoundedButton.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import SwiftUI
import UIKit

struct RapptrRoundedButton: View {
    
    var text: String
    var image: UIImage
    var tapHandler: (() -> Void)?
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(uiImage: image)
                .resizable()
                .frame(width: 24, height: 24)
                .padding(.leading, 22)
                .padding(.trailing, 16)
            Text(text)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(uiColor: .RapptrColors.textColor))
        }
        .onTapGesture {
            tapHandler?()
        }
        .frame(maxWidth: .infinity, maxHeight: 55, alignment: .leading)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.red.opacity(0.8))
        }
    }
}

struct RapptrRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RapptrRoundedButton(text: "CHAT",
                                image: UIImage(named: "ic_chat")!,
                                tapHandler: nil)
            RapptrRoundedButton(text: "LOGIN",
                                image: UIImage(named: "ic_login")!,
                                tapHandler: nil)
            RapptrRoundedButton(text: "ANIMATION",
                                image: UIImage(named: "ic_animation")!,
                                tapHandler: nil)
        }
        
    }
}
