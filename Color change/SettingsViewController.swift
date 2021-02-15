//
//  ViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 30.01.2021.
//

import UIKit

protocol UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField)
}
class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var mainLabel: UIView!
   
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redSliderValueLabel: UILabel!
    @IBOutlet var greenSliderValueLabel: UILabel!
    @IBOutlet var blueSliderValueLabel: UILabel!
    
    @IBOutlet var redColorValueTextField: UITextField!
    @IBOutlet var greenColorValueTextField: UITextField!
    @IBOutlet var blueColorValueTextField: UITextField!
    
    var backGrounColorMainView: UIColor!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        mainLabel.backgroundColor = backGrounColorMainView
        
        changerColor()
        addDoneButtonOnKeyboard()
    }
    
    // MARK: Navigation
    @IBAction func doneBittonPressed(_ sender: UIButton) {
        view.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green:CGFloat(greenSlider.value),
            blue:CGFloat(blueSlider.value),
            alpha: 1)
        dismiss(animated: true)

    }
    
     //MARK: IBActions
    @IBAction func RGBChanger(_ sender: UISlider) {
        changerColor()

        switch sender.tag {
        case 0:
            redSliderValueLabel.text = string(from: sender)
            redColorValueTextField.text = string(from: sender)
        case 1:
            greenSliderValueLabel.text = string(from: sender)
            greenColorValueTextField.text = string(from: sender)
        case 2:
            blueSliderValueLabel.text = string(from: sender)
            blueColorValueTextField.text = string(from: sender)
        default: break
        }
        changerColor()
    }
    
    @IBAction func inputValidation() {
        showAlert(title: "Ooops!", message: "You need to enter a decimal value")
    }
    
    
    private func changerColor() {
        mainLabel.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green:CGFloat(greenSlider.value),
            blue:CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    func setLabelsValue() {
        redSliderValueLabel.text = string(from: redSlider)
        greenSliderValueLabel.text = string(from: greenSlider)
        blueSliderValueLabel.text = string(from: blueSlider)
        }

    func setValueText() {
            redColorValueTextField.text = string(from: redSlider)
            greenColorValueTextField.text = string(from: greenSlider)
            blueColorValueTextField.text = string(from: blueSlider)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Work with keyboard
    private func addDoneButtonOnKeyboard() {
        let doneToolBar = UIToolbar()

        let flexSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil)
        let done = UIBarButtonItem(
            title: "Done",
            style: .done,
            target: self,
            action: #selector(self.doneButtonAction))

        doneToolBar.items = [flexSpace, done]
        doneToolBar.sizeToFit()

        redColorValueTextField.inputAccessoryView = doneToolBar
        greenColorValueTextField.inputAccessoryView = doneToolBar
        blueColorValueTextField.inputAccessoryView = doneToolBar
    }

    @objc func doneButtonAction() {
        view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}

// MARK: Work with labels and textFields
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {

    }
}
// MARK: Work with showAlert
extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
