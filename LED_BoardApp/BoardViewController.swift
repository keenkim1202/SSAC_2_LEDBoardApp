//
//  BoardViewController.swift
//  LED_BoardApp
//
//  Created by KEEN on 2021/10/04.
//

import UIKit

class BoardViewController: UIViewController {
  // MARK: UI
  @IBOutlet weak var resultLabel: UILabel!
  @IBOutlet weak var userTextField: UITextField!
  @IBOutlet weak var userInputView: UIView!
  @IBOutlet weak var sendButton: UIButton!
  @IBOutlet weak var textColorButton: UIButton!
  
  // MARK: View Life-Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configure()
  }
  
  // MARK: Configure
  func configure() {
    // button text
    if let sendLabel = sendButton.titleLabel {
      sendLabel.text = "보내기"
      sendLabel.textColor = .black
    }
    
    if let textColorLabel = textColorButton.titleLabel {
      textColorLabel.text = "Aa"
      textColorLabel.textColor = .red
    }
    
    // button border
    setBorder([sendButton, textColorButton])
    
    // user InputView
    userInputView.layer.cornerRadius = CGFloat(8)
    
    // resultLabel
    resultLabel.font = .systemFont(ofSize: 130)
    resultLabel.textAlignment = .center
    resultLabel.textColor = .cyan
    resultLabel.adjustsFontSizeToFitWidth = true
  }
  
  func setBorder(_ buttons: [UIButton]) {
    for bt in buttons {
      bt.layer.borderColor = UIColor.black.cgColor
      bt.layer.borderWidth = CGFloat(2)
      bt.layer.cornerRadius = CGFloat(8)
    }
  }
 
  // MARK: Actions
  @IBAction func onSend(_ sender: UIButton) {
    resultLabel.text = userTextField.text
    userTextField.text = ""
  }
  
  @IBAction func onTextColorChange(_ sender: UIButton) {
  }
  
}
