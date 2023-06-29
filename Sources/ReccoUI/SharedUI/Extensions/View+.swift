import SwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    func addCloseSDKToNavbar() -> some View {
        toolbar {
            ToolbarItem {
                Button {
                    currentSDKNavigationController?.dismiss(animated: true)
                } label: {
                    Image(resource: "close_ic")
                        .renderingMode(.template)
                        .foregroundColor(.reccoPrimary)
                }
            }
        }

    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
