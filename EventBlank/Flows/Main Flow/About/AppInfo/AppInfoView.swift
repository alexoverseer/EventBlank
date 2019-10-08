import UIKit

public protocol AppInfoView: BaseView {
    var viewModel: AppInfoViewModel! { get set }
    var onOpenMapImage: ((UIImage?, UIView) -> Void)? { get set }
}
