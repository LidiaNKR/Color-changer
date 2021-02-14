//
//  ViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
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
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.layer.cornerRadius = 10
        
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        
        setValue(for: redSliderValueLabel, greenSliderValueLabel, blueSliderValueLabel)
        
        changerColor()
        
        addDoneButtonOnKeyboard()
    }
    
    // MARK: Navigation
    @IBAction func doneBittonPressed() {
        dismiss(animated: true)
    }
    
    // MARK: IBActions
    @IBAction func sliderChanger(_ sender: UISlider) {
        changerColor()
        
        switch sender.tag {
        case 0: redSliderValueLabel.text = string(from: sender)
        case 1: greenSliderValueLabel.text = string(from: sender)
        case 2: blueSliderValueLabel.text = string(from: sender)
        default: break
        }
    }
    
    private func changerColor() {
        mainLabel.backgroundColor = UIColor(red:CGFloat(redSlider.value),
                                            green:CGFloat(greenSlider.value),
                                            blue:CGFloat(blueSlider.value),
                                            alpha: 1)
    }
    
    // MARK: Work with labels and textFields
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label.tag {
            case 0: redSliderValueLabel.text = string(from: redSlider)
            case 1: greenSliderValueLabel.text = string(from: greenSlider)
            case 2: blueSliderValueLabel.text = string(from: blueSlider)
            default: break
            }
        }
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    // MARK: - Work with keyboard
    private func addDoneButtonOnKeyboard() {
        let doneToolBar = UIToolbar()

        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        doneToolBar.items = [flexSpace, done]
        doneToolBar.sizeToFit()

        redColorValueTextField.inputAccessoryView = doneToolBar
        greenColorValueTextField.inputAccessoryView = doneToolBar
        blueColorValueTextField.inputAccessoryView = doneToolBar
    }

    @objc func doneButtonAction() {
        view.endEditing(true)
    }
    
}
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
