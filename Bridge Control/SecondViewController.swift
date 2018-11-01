//
//  SecondViewController.swift
//  Bridge Control
//
//  Created by Chase Costner on 10/31/18.
//  Copyright © 2018 Chase Costner. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var engineSwitch:UISwitch!
    @IBOutlet var warpFactorSlider:UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onEngineSwitchTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
    }
    
    @IBAction func onWarpSliderDragged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
    }
    @IBAction func onSettingsButtonTapped(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshFields()
    }
    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
    }
}

