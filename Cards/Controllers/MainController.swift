//
//  MainController.swift
//  Cards
//
//  Created by Apple M1 on 10.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .systemBlue
        
        view.addSubview(buttonNewGame)
    }
    
    lazy var buttonNewGame = getNewGameButton()
    
    private func getNewGameButton() -> UIButton {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.center.x = view.center.x
        
        let padding: CGFloat = 250
        
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let topPadding = window!.safeAreaInsets.top
        button.frame.origin.y = topPadding + padding
        
        button.setTitle("New Game", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.systemRed, for: .highlighted)
        button.backgroundColor = .cyan
        button.layer.cornerRadius = 10
        
        button.addTarget(nil, action: #selector(newGame(_:)), for: .touchUpInside)
        
        return button
    }
    
    @objc func newGame(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let boardGameController = storyboard.instantiateViewController(identifier: "BoardGameController")
        boardGameController.modalPresentationStyle = .fullScreen
        self.present(boardGameController, animated: true)
    }
}
