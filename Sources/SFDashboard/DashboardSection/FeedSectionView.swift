import SwiftUI
import SFEntities
import SFSharedUI

struct FeedSectionView: View {
    @Binding var performedUnlockAnimation: Bool
    var section: FeedSectionViewState
    var items: [AppUserRecommendation]
    var goToDetail: (AppUserRecommendation) -> Void
    var pressedLockedSection: (FeedSection) -> Void
    
    private var showSectionLoading: Bool {
        section.isLoading && !section.section.locked && items.isEmpty
    }
    
    private var hideSection: Bool {
        items.isEmpty && !section.isLoading && !section.section.locked
    }
    
    private var showLockedSectionView: Bool {
        section.section.locked || !performedUnlockAnimation
    }
        
    @ViewBuilder
    var body: some View {
        if hideSection {
            EmptyView()
        } else {
            VStack(alignment: .leading, spacing: .S) {
                Text(section.section.type.displayName)
                    .h4()
                    .padding(.horizontal, .M)
                
                if showSectionLoading {
                    LoadingSectionView()
                } else {
                    if showLockedSectionView {
                        LockedSectionView(
                            isLocked: section.section.locked,
                            performedUnlockAnimation: $performedUnlockAnimation
                        )
                        .onTapGesture {
                            pressedLockedSection(section.section)
                        }
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: .XS) {
                                Spacer(minLength: .S)
                                ForEach(items, id: \.self) { item in
                                    Button {
                                        goToDetail(item)
                                    } label: {
                                        FeedItemView(item: item)
                                    }
                                }
                                Spacer(minLength: .M)
                            }
                            .frame(height: .cardSize.height)
                            .padding(.bottom, .M)
                        }
                    }
                }
            }
            .padding(.top, .S)
        }
    }
}

struct FeedSectionView_Previews: PreviewProvider {
    static var previews: some View {
        FeedSectionView(
            performedUnlockAnimation: .constant(false),
            section: .init(
                section: .init(type: .mostPopular, locked: true),
                isLoading: false
            ),
            items: [.init(id: .init(itemId: "", catalogId: ""), type: .articles, rating: .like, status: .viewed, headline: "This item", imageUrl: .init(string: "https://images.pexels.com/photos/708440/pexels-photo-708440.jpeg"))],
            goToDetail: { _ in},
            pressedLockedSection: {_ in}
        )
    }
}
