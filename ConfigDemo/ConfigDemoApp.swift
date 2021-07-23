//
//  ConfigDemoApp.swift
//  ConfigDemo
//
//  Created by admin on 23/07/2021.
//

import SwiftUI

@main
struct MainApp {
    static func main() {
        if #available(iOS 14.0, *) {
            MyNewUI.main()
        } else {
            UIApplicationMain(
                CommandLine.argc,
                CommandLine.unsafeArgv,
                nil,
                NSStringFromClass(AppDelegate.self))
        }
    }
}

@available(iOS 14.0, *)
struct MyNewUI: App {
    var body: some Scene {
        WindowGroup {
            Text("This is my new UI! Pretty basic, huh?")
        }
    }
}

//@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let config:Configuration = ConfigLoader.parseFile()
        NSLog("[ConfigDemo] key1 = \(config.key1) key2 = \(config.key2)")
        return true
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        let contentView = ContentView()
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        
    }
    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }
    func sceneWillResignActive(_ scene: UIScene) {
        
    }
    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }
    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }
}
