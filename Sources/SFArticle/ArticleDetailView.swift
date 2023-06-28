import SwiftUI
import SFSharedUI
import SFEntities
import NukeUI

fileprivate struct BoundsPreference: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = max(value, nextValue())
    }
}

public struct ArticleDetailView: View {
    public init(viewModel: ArticleDetailViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }
    
    @Environment(\.presentationMode) var dismiss
    @Environment(\.currentScrollObservable) var scrollOffsetObservable
    @StateObject var viewModel: ArticleDetailViewModel
    
    @State private var offset: CGFloat = .zero
    @State private var contentHeight: CGFloat = .zero
    @State private var totalViewHeight: CGFloat = UIScreen.main.bounds.height
    
    private var headerHeight: CGFloat {
        UIScreen.main.bounds.height * 0.4
    }
    
    private var negativePaddingTop: CGFloat {
        -UIScreen.main.bounds.height * 0.05
    }
    
    private var shadowOpacity: CGFloat {
        if viewModel.isLoading { return 0 }
        let distance = (totalViewHeight + offset) - ((headerHeight + negativePaddingTop) + contentHeight) + .XL + .L // add some padding to account for the view itself
        
        return (-distance/100).clamped(to: 0...0.3)
    }
    
    public var body: some View {
        BouncyHeaderScrollview(
            navTitle: viewModel.heading,
            backAction: { dismiss.wrappedValue.dismiss() },
            closeAction: { fatalError() },
            imageHeaderHeight: headerHeight,
            offset: $offset,
            header: { articleHeader },
            content: {
                VStack(alignment: .leading, spacing: .M) {
                    Text(viewModel.heading)
                        .h1()
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Rectangle()
                        .fill(Color.sfAccent)
                        .frame(height: 2)
                        .frame(maxWidth: .infinity)
                    
                    SFLoadingView(viewModel.isLoading) {
                        if let article = viewModel.article {
                            VStack(alignment: .leading, spacing: .L) {
                                if let lead = article.lead {
                                    Text(lead).body1bold()
                                }
                                
                                if let body = article.articleBodyHtml {
                                    HTMLTextView(text: body)
                                        .isEditable(false)
                                        .isSelectable(true)
                                        .autoDetectDataTypes(.all)
                                }
                            }
                        }
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, .L)
                .padding(.horizontal, .S)
                .background(Color.sfBackground)
                .overlay(
                    GeometryReader { proxy in
                        Color.clear.preference(key: BoundsPreference.self, value: proxy.size.height)
                    }
                )
                .cornerRadius(.L, corners: [.topLeft, .topRight])
                .padding(.top, negativePaddingTop)
            }
        )
        .onPreferenceChange(BoundsPreference.self) { new in
            contentHeight = new
        }
        .overlay(
            Group {
                if let article = viewModel.article {
                    SFContentInteractionView(
                        rating: article.rating,
                        bookmark: article.bookmarked,
                        toggleBookmark: viewModel.toggleBookmark,
                        rate: viewModel.rate
                    )
                    .shadowBase(opacity: shadowOpacity)
                    .padding(.M)
                }
            },
            alignment: .bottom
        )
        .sfErrorView(
            error: $viewModel.initialLoadError,
            onRetry: {
                await viewModel.initialLoad()
            },
            onClose: { dismiss.wrappedValue.dismiss() }
        )
        .background(Color.sfBackground.ignoresSafeArea())
        .sfNotification(error: $viewModel.actionError)
        .overlay(
            GeometryReader { proxy in
                Color.clear.onAppear {
                    totalViewHeight = proxy.size.height
                }
            }
        )
        .showNavigationBarOnScroll(threshold: headerHeight)
        .addCloseSDKToNavbar()
        .navigationTitle(viewModel.heading)
        .onReceive(scrollOffsetObservable) { _, newOffset in
            offset = newOffset
        }
        .task {
            await viewModel.initialLoad()
        }
    }
    
    @ViewBuilder
    private var articleHeader: some View {
        LazyImage(
            url: viewModel.imageUrl
        ) { state in
            if let image = state.image {
                ZStack {
                    image
                        .resizable()
                        .scaledToFill()
                    
                    LinearGradient(
                        colors: [.black.opacity(0.6), .clear, .clear], startPoint: .top, endPoint: .bottom
                    )
                }
            } else if state.error != nil {
                Color.sfPrimary20.overlay(
                    Image(resource: "error_image")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            } else {
                ZStack {
                    SFImageLoadingView(feedItem: false)
                        .scaledToFill()
                    
                    LinearGradient(
                        colors: [.black.opacity(0.6), .clear, .clear], startPoint: .top, endPoint: .bottom
                    )
                }
            }
        }
        .processors([.resize(width: UIScreen.main.bounds.width)])
        .animation(.linear(duration: 0.3))
    }
}

struct ArticleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        withAssembly { r in
            ArticleDetailView(viewModel: r.get(argument: (
                ContentId(itemId: "", catalogId: "")
                , "This is a header",
                URL(string: "https://images.pexels.com/photos/708440/pexels-photo-708440.jpeg"),
                { (asdf: ContentId) in }
            )))
        }
    }
}
