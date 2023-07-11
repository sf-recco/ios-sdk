import SwiftUI

struct BookmarksView: View {
    @StateObject var viewModel: BookmarksViewModel

    private let gridLayout = [
        GridItem(.flexible(), spacing: .XXS, alignment: .top),
        GridItem(.flexible(), spacing: .XXS, alignment: .top),
        GridItem(.flexible(), spacing: .XXS, alignment: .top)
        ]
    
    var body: some View {
        ReccoLoadingView(viewModel.isLoading) {
            if viewModel.items.isEmpty {
                emptyBookmarksView
            } else {
                RefreshableScrollView(
                    refreshAction: viewModel.getBookmarks
                ) {
                    LazyVGrid(columns: gridLayout, spacing: .S) {
                        ForEach(viewModel.items, id: \.self) { item in
                            Button {
                                viewModel.goToDetail(of: item)
                            } label: {
                                FeedItemView(item: item)
                            }
                        }
                    }
                    .padding(.S)
                }
            }
        }
        .padding(.top, .M)
        .reccoErrorView(
            error: $viewModel.error,
            onRetry: { await viewModel.getBookmarks() }
        )
        .background(
            Color.reccoBackground.ignoresSafeArea()
        )
        .addCloseSDKToNavbar(viewModel.dismiss)
        .navigationTitle("bookmarks.navTitle".localized)
        .navigationBarHidden(false)
        .task {
            if viewModel.items.isEmpty {
                await viewModel.getBookmarks()
            }
        }
    }
    
    var emptyBookmarksView: some View {
        VStack(alignment: .center, spacing: .L) {
            Spacer()
            Text("bookmarks.empty".localized)
                .body1()
            Image(resource: "no_content_image")
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }
}

struct BookmarksView_Previews: PreviewProvider {
    static var previews: some View {
        withAssembly { r in
            BookmarksView(viewModel: r.get())
        }
    }
}
