//
//  RemoteImage.swift
//  FoodySwiftUI
//
//  Created by Eder  Padilla on 26/07/22.
//

import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(url: String) {
        NetworkManager.shared.fetchImage(url: url) { [weak self] uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self?.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct FoodyRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let url: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear { imageLoader.load(url: url) }
    }
}

struct FoodyRemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        FoodyRemoteImage(url: "https://seanallen-course-backend.herokuapp.com/images/appetizers/chicken-avocado-spring-roll.jpg")
    }
}
