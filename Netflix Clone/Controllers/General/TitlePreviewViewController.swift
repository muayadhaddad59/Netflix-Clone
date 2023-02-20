//
//  TitlePreviewViewController.swift
//  Netflix Clone
//
//  Created by Muayad El-haddad on 18/02/2023.
//

import UIKit
import WebKit


class TitlePreviewViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  .systemFont(ofSize: 22  , weight:  .bold)
        label.text = "Herry potter"
        return label
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = " This is the best movie ever to watch as a kid"
        return label
    }()
    
    private let downloadButton : UIButton = {
        let button = UIButton( )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("Download", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        return button
    }()
    
    private let webview: WKWebView = {
        let web = WKWebView ()
        web.translatesAutoresizingMaskIntoConstraints = false
        
        return web
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
}

extension TitlePreviewViewController {
    private func setup(){
        view.addSubview(webview)
        view.addSubview(titleLabel)
        view.addSubview(overViewLabel)
        view.addSubview(downloadButton)
        view.backgroundColor = .systemBackground
        configureConstants()
    }
    
    private func configureConstants(){
        let webViewConstraints = [
            webview.topAnchor.constraint(equalTo: view.topAnchor , constant: 15),
            webview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webview.heightAnchor.constraint(equalToConstant: 300)
            
        ]
        
        let titleConstraint = [
            titleLabel.topAnchor.constraint(equalTo: webview.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ]
        
        let overViewLableConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor , constant: 15),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ]
        
        
        let downloadConstriants = [
            downloadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            downloadButton.topAnchor.constraint(equalTo: overViewLabel.bottomAnchor , constant: 15),
            downloadButton.widthAnchor.constraint(equalToConstant: 120),
            downloadButton.heightAnchor.constraint(equalToConstant: 40),
        ]
        NSLayoutConstraint.activate(downloadConstriants)
        NSLayoutConstraint.activate(overViewLableConstraints)
        NSLayoutConstraint.activate(titleConstraint)
        NSLayoutConstraint.activate(webViewConstraints)
        
    }
    
    func configure(with model: TitlePreviewViewModel){
        titleLabel.text = model.title
        overViewLabel.text = model.titleOverView
        
        guard let url = URL(string: "https://www.youtube.com/watch?v=FdsqU02xwsE&ab_channel=HeyFlutter%E2%80%A4com")else{return}
        webview.load(URLRequest(url: url))
    }
}
