//
//  ViewController.swift
//  AnimationImageView
//
//  Created by Борис Сонин on 09.12.2022.
//

import UIKit
import SpringAnimation

class ViewController: UIViewController {
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var labelSetting: UILabel!
    @IBOutlet var buttonSettings: SpringButton!
    
    private let presets:[String] = AnimationPreset.allCases.map { $0.rawValue }
    private let curves:[String] = AnimationCurve.allCases.map { $0.rawValue }
    private let randomForce = 0.1...2.0
    private let randomDuration = 0.1...2.0
    private let randomDelay = 0.1...1
    
    private var randomPreset: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomPreset = presets.randomElement()
        setAnimationPreset()
        buttonSettings.setTitle("Run", for: .normal)
        labelText()
    }
    
    @IBAction func startSpringAnimation(_ sender: SpringButton) {
        setAnimationPreset()
        labelText()
        buttonSettings.setTitle("Run \(randomPreset ?? "pop")", for: .normal)
    }
    
    private func setAnimationPreset () {
        springAnimationView.animation = "\(randomPreset ?? "pop")"
        springAnimationView.curve = "\(curves.randomElement() ?? "spring")"
        springAnimationView.force = round(.random(in: randomForce) * 100) / 100
        springAnimationView.duration = round(.random(in: randomDuration) * 100) / 100
        springAnimationView.delay = round(.random(in: randomDelay) * 100) / 100
        springAnimationView.animate()
        randomPreset = presets.randomElement()
    }
    
    private func labelText() {
        labelSetting.text = """
                                preset: \(springAnimationView.animation)
                                curve: \(springAnimationView.curve)
                                force: \(springAnimationView.force)
                                duration: \(springAnimationView.duration)
                                delay: \(springAnimationView.delay)
                                """
    }
}

