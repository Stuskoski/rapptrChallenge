//
//  AnimationView.swift
//  Rapptr iOS Test
//
//  Created by Rutkoski,Augustus on 5/7/22.
//

import SwiftUI

/**
 * =========================================================================================
 * INSTRUCTIONS
 * =========================================================================================
 * 1) Make the UI look like it does in the mock-up.
 *
 * 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
 *
 * 3) User should be able to drag the logo around the screen with his/her fingers
 *
 * 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
 *    section in Swfit to show off your skills. Anything your heart desires!
 *
 */

struct AnimationView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Image("ic_logo")
                .position(viewModel.location)
                .gesture(viewModel.simpleDrag)
                .opacity(viewModel.imageOpacity)

            Spacer()
            RapptrButton(buttonTitle: viewModel.fadeInOut.rawValue,
                         tapHandler: {
                withAnimation {
                    viewModel.fadeInOutButtonTap()
                }
            })
            .padding(.horizontal, 30)
        }
        .navigationTitle("Animation")
    }
}

#if DEBUG
struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView(viewModel: AnimationView.ViewModel(backBtnTapHandler: {}))
    }
}
#endif
