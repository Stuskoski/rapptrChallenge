//
//  RapptrButton.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/7/22.
//

import SwiftUI

struct RapptrButton: View {
    
    var buttonTitle: String
    var tapHandler: (() -> Void)
    
    var body: some View {
        Button(action: tapHandler) {
            Text(buttonTitle)
                .frame(maxWidth: .infinity, maxHeight: 55)
                .foregroundColor(.white)
                .font(.system(size: 16, weight: .semibold))
        }
        .background {
            Color(uiColor: .RapptrColors.rapptrBlue)
        }
    }
}

#if DEBUG
struct RapptrButton_Previews: PreviewProvider {
    static var previews: some View {
        RapptrButton(buttonTitle: "Test Button", tapHandler: {})
    }
}
#endif
