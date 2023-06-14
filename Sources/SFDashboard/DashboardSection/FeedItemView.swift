//
//  SwiftUIView.swift
//  
//
//  Created by Adrián R on 6/6/23.
//

import SwiftUI
import SFEntities
import SFSharedUI
import NukeUI

struct FeedItemView: View {
    let item: AppUserRecommendation
    
    var body: some View {
        LazyImage(
            url: item.imageUrl
        ) { state in
            if let image = state.image {
                image.resizable()
                    .scaledToFill()
                    .opacity(
                        item.status == .viewed ? 0.4 : 1
                    )
            } else if state.error != nil {
                Color.sfPrimary20.overlay(
                    Image(resource: "error_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            } else {
                SFImageLoadingView(feedItem: true)
            }
        }
        .processors([.resize(width: .cardSize.width)])
        .animation(.linear(duration: 0.1))
        .frame(width: .cardSize.width, height: .cardSize.height)
        .overlay(
            Text(item.headline)
                .body3()
                .lineLimit(2)
                .frame(maxWidth: .infinity)
                .padding(.XXS)
                .multilineTextAlignment(.center)
                .frame(height: .L + .M)
                .background(Color.sfBackground),
            alignment: .bottom
        )
        .clipShape(
            RoundedRectangle(cornerRadius: .XXS)
        )
        .background(
            RoundedRectangle(cornerRadius: .XXS)
                .fill(Color.sfBackground)
                .shadowBase()
        )
    }
}

struct FeedItemView_Previews: PreviewProvider {
    static var previews: some View {
        FeedItemView(item: .init(
            id: .init(itemId: "", catalogId: ""),
            type: .articles,
            rating: .like,
            status: .noInteraction,
            headline: "This card is good",
            imageUrl: .init(string: "https://images.pexels.com/photos/708440/pexels-photo-708440.jpeg")
        ))
    }
}
