//
//  VKLoginController.swift
//  fakeVKapp
//
//  Created by Evgeny Alekseev on 04.10.2021.
//

import UIKit
import WebKit

final class VKLoginController: UIViewController {
    @IBOutlet var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    private var urlComponents: URLComponents = {
        var urlComp = URLComponents()
        urlComp.scheme = "https"
        urlComp.host = "oauth.vk.com"
        urlComp.path = "/authorize"
        urlComp.queryItems = [
            URLQueryItem(name: "client_id", value: "7966748"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "336918"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
    ]
        return urlComp
    }()
    
    private lazy var request = URLRequest(url: urlComponents.url!)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.load(request)

    }
}

extension VKLoginController: WKNavigationDelegate {
    func webView(
        _ webView: WKWebView,
        decidePolicyFor navigationResponse: WKNavigationResponse,
        decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
            guard
                let url = navigationResponse.response.url,
                url.path == "/blank.html",
                let fragment = url.fragment
            else { return decisionHandler(.allow) }
            
            let parameters = fragment
                .components(separatedBy: "&")
                .map { $0.components(separatedBy: "=") }
                .reduce([String: String]()) { result, params in
                    var dict = result
                    let key = params[0]
                    let value = params[1]
                    dict[key] = value
                    return dict
                }
            guard
                let token = parameters["access_token"],
                let userIDString = parameters["user_id"],
                let userID = Int(userIDString)
            else { return decisionHandler(.allow) }
            
            Session.instance.token = token
            Session.instance.userID = userID
            
            print("My Token: \(token)")
            print("My UserID: \(userID)\n")
            
            performSegue(
                withIdentifier: "vkLoginSegue",
                sender: nil)
            
            decisionHandler(.cancel)
        }
}
