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
    var imageName: String
    var tapHandler: (() -> Void)?
    
    var body: some View {
        
        HStack(spacing: 16) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 24, height: 24)
                .padding(.leading, 22)
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(uiColor: .RapptrColors.textColor))
        }
        .frame(maxHeight: 55)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.white.opacity(0.8))
        }
        .onTapGesture {
            tapHandler?()
        }
    }
}

#if DEBUG
struct RapptrRoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            RapptrRoundedButton(text: "CHAT",
                                imageName: "ic_chat",
                                tapHandler: nil)
            RapptrRoundedButton(text: "LOGIN",
                                imageName: "ic_login",
                                tapHandler: nil)
            RapptrRoundedButton(text: "ANIMATION",
                                imageName: "ic_animation",
                                tapHandler: nil)
        }
        
    }
}
#endif
