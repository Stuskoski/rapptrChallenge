//
//  MenuView.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/6/22.
//

import SwiftUI

struct MenuView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 24) {
                RapptrRoundedButton(text: "CHAT",
                                    imageName: "ic_chat",
                                    tapHandler: viewModel.chatTapHandler)
                RapptrRoundedButton(text: "LOGIN",
                                    imageName: "ic_login",
                                    tapHandler: viewModel.loginTapHandler)
                RapptrRoundedButton(text: "ANIMATION",
                                    imageName: "ic_animation",
                                    tapHandler: viewModel.animationTapHandler)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding([.leading, .trailing], 32)
        }
        .navigationTitle("Coding Tasks")
        .background {
            Image("bg_home_menu")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(viewModel: MenuView.ViewModel(chatTapHandler: nil,
                                               loginTapHandler: nil,
                                               animationTapHandler: nil))
    }
}
#endif
