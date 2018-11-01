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
    
    @objc func applicationWillEnterForeground(notification:NSNotification) {
        let defaults = UserDefaults.standard
        defaults.synchronize()
        refreshFields()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func onEngineSwitchTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(engineSwitch.isOn, forKey: warpDriveKey)
        defaults.synchronize()
    }
    
    @IBAction func onWarpSliderDragged(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(warpFactorSlider.value, forKey: warpFactorKey)
        defaults.synchronize()
    }
    @IBAction func onSettingsButtonTapped(_ sender: Any) {
    }
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared
        NotificationCenter.default.addObserver(self, selector: #selector(self.applicationWillEnterForeground(notification:)), name: UIApplication.willEnterForegroundNotification, object: app)
        super.viewWillAppear(animated)
        refreshFields()
    }
    func refreshFields() {
        let defaults = UserDefaults.standard
        engineSwitch.isOn = defaults.bool(forKey: warpDriveKey)
        warpFactorSlider.value = defaults.float(forKey: warpFactorKey)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
}

