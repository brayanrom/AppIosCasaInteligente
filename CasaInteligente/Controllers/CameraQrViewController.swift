//
//  CameraQrViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/26/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import QRCodeScannerFramework

class CameraQrViewController: UIViewController, QrScannerDelegate {
    
    
    func getScannedData(data: String) {
        print(data) //here's the scan result

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = QRScannerController()
        vc.qrScannerDelegate = self
        self.navigationController?.pushViewController(vc, animated: true)

        
    
    }
}
