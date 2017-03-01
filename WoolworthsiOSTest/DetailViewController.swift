//
//  DetailViewController.swift
//  WoolworthsiOSTest
//
//  Created by Tantia, H. on 27/02/2017.
//  Copyright © 2017 Kreativ Apps, LLC. All rights reserved.
//

import UIKit
import CoreLocation

class DetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    private var data: [Line]?

    var detailItem: Stn? {
        didSet {
            self.configureView()
        }
    }
    
    private func configureView() {
        if let lines = self.detailItem?.lines?.line {
            data = lines
            DispatchQueue.main.async(execute: {
                self.tableView.reloadData()
            })
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.title = "Lines"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showTraffic(_ sender: UIBarButtonItem) {
        launchTrafficViewController()
    }
    
    private func launchTrafficViewController() {
        let vc = TrafficDataViewController(nibName: "TrafficDataViewController", bundle: nil)
        
        if let x = detailItem?.x, let y = detailItem?.y, let lat = Double(y), let long = Double(x) {
            vc.cordinates = CLLocation(latitude: lat, longitude: long)
        }
        
        self.showDetailViewController(vc, sender: self)
    }

    // MARK: - Table View
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data {
            return data.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if let object = data?[indexPath.row] {
            cell.textLabel?.text = object.name
            cell.detailTextLabel?.text = object.dir
            if let at = object.at {
                let result = at.filter { $0.id == "color" }.last
                if let hexColor = result?.value {
                    cell.backgroundColor = UIColor(hex: hexColor)
                }
            }
        }
        return cell
    }
}

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 1
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

