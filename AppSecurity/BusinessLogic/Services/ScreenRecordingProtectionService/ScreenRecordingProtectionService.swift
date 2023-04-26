//
//  ScreenRecordingProtectionService.swift
//  AppSecurity
//
//  Created by Illia Khrypunov on 20.04.2023.
//

import UIKit
import Photos

final class ScreenRecordingProtectionService {
    // MARK: - Lazy properties
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Screen recording is not allowed at our app!"
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var warningWindow: UIWindow = {
        let window = UIWindow()
        window.backgroundColor = .white
        window.windowLevel = UIWindow.Level.statusBar + 1
        window.clipsToBounds = true
        return window
    }()
    
    private var appWindow: UIWindow? {
        return (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.window
    }
    
    // MARK: - Init
    init() {
        setupUI()
    }
    
    // MARK: - Start
    func startPreventingRecording() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(didDetectRecording),
                                               name: UIScreen.capturedDidChangeNotification,
                                               object: nil)
    }
}

// MARK: - Private methods
private extension ScreenRecordingProtectionService {
    func setupUI() {
        warningWindow.addSubview(infoLabel)

        NSLayoutConstraint.activate([
            infoLabel.centerXAnchor.constraint(equalTo: warningWindow.centerXAnchor),
            infoLabel.centerYAnchor.constraint(equalTo: warningWindow.centerYAnchor),
            infoLabel.leadingAnchor.constraint(
                greaterThanOrEqualTo: warningWindow.leadingAnchor,
                constant: Constants.Layout.infoLabelHorizontalIndent
            ),
            infoLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: warningWindow.trailingAnchor,
                constant: -Constants.Layout.infoLabelHorizontalIndent
            )
        ])
    }
    
    func hideScreen() {
        appWindow?.isHidden = UIScreen.main.isCaptured
    }
    
    func presentWarningWindow() {
        warningWindow.removeFromSuperview()
        warningWindow.windowScene = nil

        guard let frame = appWindow?.bounds else { return }

        let windowScene = UIApplication.shared
            .connectedScenes
            .first {
                $0.activationState == .foregroundActive || $0.activationState == .foregroundInactive
            }
        
        if let windowScene = windowScene as? UIWindowScene {
            warningWindow.windowScene = windowScene
        }

        warningWindow.frame = frame
        warningWindow.isHidden = false

        UIView.animate(withDuration: 0.15) { [weak self] in
            self?.infoLabel.alpha = 1.0
            self?.infoLabel.transform = .identity
        }
        
        warningWindow.makeKeyAndVisible()
    }
}

// MARK: - Objc
private extension ScreenRecordingProtectionService {
    @objc func didDetectRecording() {
        DispatchQueue.main.async { [weak self] in
            self?.appWindow?.isHidden = UIScreen.main.isCaptured
            
            if UIScreen.main.isCaptured {
                self?.presentWarningWindow()
            } else {
                self?.warningWindow.removeFromSuperview()
                self?.warningWindow.windowScene = nil
            }
        }
    }
}

// MARK: - Constants
private enum Constants {
    enum Layout {
        static let infoLabelHorizontalIndent = 20.0
    }
}
