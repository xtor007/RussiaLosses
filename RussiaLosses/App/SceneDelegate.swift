//
//  SceneDelegate.swift
//  RussiaLosses
//
//  Created by Anatoliy Khramchenko on 23.08.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    private let dataService = DataService()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let loadingVC = LoadingViewController()
        window?.rootViewController = loadingVC
        dataService.fetchDataFromInet { result in
            switch result {
            case .success(let losses):
                print(losses)
            case .failure(let error):
                print(error)
            }
        }
        window?.makeKeyAndVisible()
    }

}
