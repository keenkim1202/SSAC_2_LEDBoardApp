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
  
  
  
  // MARK: Properties
  let colors: [UIColor] = [.red, .cyan, .yellow, .systemGreen, .systemTeal, .systemPink, .orange]
  
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
    view.endEditing(true)
  }
  
  @IBAction func onTextColorChange(_ sender: UIButton) {
    let resultTextColor = resultLabel.textColor
    var nextTextColor = colors.randomElement()
    while resultTextColor == nextTextColor {
      nextTextColor = colors.randomElement()
    }
    resultLabel.textColor = nextTextColor
  }
  
  @IBAction func onKeyboardReturned(_ sender: UITextField) {
    view.endEditing(true)
  }
  
  @IBAction func onViewTapped(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
    
    if userInputView.isHidden {
      userInputView.isHidden = false
    } else {
      userInputView.isHidden = true
    }
  }
  
}
