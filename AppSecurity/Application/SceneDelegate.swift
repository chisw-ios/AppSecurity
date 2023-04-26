//
//  SceneDelegate.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Properties
    var window: UIWindow?

    // MARK: - Funcs
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainFlowFactory.instantiateBankCardPage()
        window?.makeKeyAndVisible()
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = window?.frame ?? .zero
        blurEffectView.tag = AppearanceConstants.Tag.blurEffectView
        
        window?.addSubview(blurEffectView)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        window?.viewWithTag(AppearanceConstants.Tag.blurEffectView)?.removeFromSuperview()
    }
}
