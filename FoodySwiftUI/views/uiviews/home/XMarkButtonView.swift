//
//  XMarkButtonView.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

struct XMarkButtonView: View {
    var body: some View {
        Button(action: {
            print("dismiss")
        }, label: {
            ZStack {
                Circle()
                    .frame(width: 30,
                           height: 30)
                    .foregroundColor(.white)
                    .opacity(0.4)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44,
                           height: 44)
                    .foregroundColor(.gray)
            }
        })
    }
}

struct XMarkButtonView_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButtonView()
            .preferredColorScheme(.dark)
    }
}
