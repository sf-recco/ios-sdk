import SwiftUI

public struct SFLoadingView<Content: View>: View {
    public init(_ isLoading: Bool, @ViewBuilder content: @escaping () -> Content) {
        self.isLoading = isLoading
        self.content = content
    }
    
    public var isLoading: Bool
    public var content: () -> Content
    
    public var body: some View {
        if isLoading {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .primary))
                .padding(.M)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        } else {
            content()
        }
    }
}
