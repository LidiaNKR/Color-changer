//
//  ViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 30.01.2021.
//

import UIKit


class SettingsViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
   
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!

    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    // MARK: - Public Properties
    var delegate: ColorViewControllerDelegate!
    var colorMainView: UIColor!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        colorView.backgroundColor = colorMainView
        
        setSliders()
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
        addDoneButtonOnKeyboard(to: redTextField, greenTextField, blueTextField)
    }
    
    // MARK: - IB Actions
    @IBAction func doneBittonPressed(_ sender: UIButton) {
        delegate.setColor(colorView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    @IBAction func RGBChanger(_ sender: UISlider) {

        switch sender.tag {
        case 0:
            setValue(for: redLabel)
            setValue(for: redTextField)
        case 1:
            setValue(for: greenLabel)
            setValue(for: greenTextField)
        case 2:
            setValue(for: blueLabel)
            setValue(for: blueTextField)
        default: break
        }
        changerColor()
    }
    
}

    // MARK: - Private Methods
extension SettingsViewController {
    
    private func changerColor() {
        colorView.backgroundColor = UIColor(
            red:CGFloat(redSlider.value),
            green:CGFloat(greenSlider.value),
            blue:CGFloat(blueSlider.value),
            alpha: 1)
    }
    
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redLabel.text = string(from: redSlider)
            case 1: greenLabel.text = string(from: greenSlider)
            case 2: blueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }

    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField.tag {
            case 0: redTextField.text = string(from: redSlider)
            case 1: greenTextField.text = string(from: greenSlider)
            case 2: blueTextField.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func setSliders() {
        let ciColor = CIColor(color: colorMainView)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Work with keyboard
    private func addDoneButtonOnKeyboard(to textFields: UITextField...) {
        
        textFields.forEach { textField in
            let keyboardToolbar = UIToolbar()
            textField.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let flexBarButton = UIBarButtonItem(
                barButtonSystemItem: .flexibleSpace,
                target: nil,
                action: nil
            )
            
            let doneButton = UIBarButtonItem(
                title: "Done",
                style: .done,
                target: self,
                action: #selector(doneButtonAction)
            )
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }

    @objc private func doneButtonAction() {
        view.endEditing(true)
    }

    
    // MARK: - Work with showAlert
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

    // MARK: - UITextFieldDelegate

extension SettingsViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0:
                redSlider.setValue(currentValue, animated: true)
                setValue(for: redLabel)
            case 1:
                greenSlider.setValue(currentValue, animated: true)
                setValue(for: greenLabel)
            case 2:
                blueSlider.setValue(currentValue, animated: true)
                setValue(for: blueLabel)
            default: break
            }
            
            changerColor()
            return
        }
        
        showAlert(title: "Oooops! Wrong format!", message: "Please, enter correct value")
    }
    
}
