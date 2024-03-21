//
//  UIWindow+.swift
//  XHTouchPainter
//
//  Created by paintitcolorful on 2024/3/20.
//

import UIKit
import QMUIKit

extension UIWindow {
    public static var keyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
                return windowScene.windows.first(where: { $0.isKeyWindow })
            } else {
                return UIApplication.shared.windows.first(where: { $0.isKeyWindow })
            }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    /// 获取设备安全区域边距，仅在当前页面加载完毕后生效
    /// - Returns: 设备安全区域边距
    public static var safeAreaInsets: UIEdgeInsets {
        keyWindow?.safeAreaInsets ?? QMUIHelper.safeAreaInsetsForDeviceWithNotch
    }
}
