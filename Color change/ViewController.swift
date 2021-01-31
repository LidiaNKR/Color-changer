//
//  ViewController.swift
//  Color change
//
//  Created by Лидия Ладанюк on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var mainLabel: UIView!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSliderValue: UILabel!
    @IBOutlet var blueSliderValue: UILabel!
    @IBOutlet var redSliderValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func changerColor() {
        mainLabel.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    @IBAction func sliderChsnger() {
    greenSliderValue.text = String(format: "%.2f",
                                       greenSlider.value)
        blueSliderValue.text = String(format: "%.2f",
                                      blueSlider.value)
        redSliderValue.text = String(format: "%.2f",
                                     redSlider.value)
    }
    
    @IBAction func colorChanger() {
        changerColor()
    }
}
