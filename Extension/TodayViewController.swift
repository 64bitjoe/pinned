//
//  TodayViewController.swift
//  Extension
//
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		if #available(iOSApplicationExtension 10.0, *) {
			extensionContext?.widgetLargestAvailableDisplayMode = .expanded
		}
		self.preferredContentSize.height = 200
    }
	
	// MARK: - NCWidgetProviding
	
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
    }
	
	func widgetMarginInsets(forProposedMarginInsets defaultMarginInsets: UIEdgeInsets) -> (UIEdgeInsets) {
		return UIEdgeInsets.zero
	}
	
	@available(iOSApplicationExtension 10.0, *)
	func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
		if activeDisplayMode == .expanded {
			preferredContentSize = CGSize(width: maxSize.width, height: 300)
		}
		else if activeDisplayMode == .compact {
			preferredContentSize = maxSize
		}
	}
	
    
    //Stbx
   
    @IBAction func gotostbx(_ sender: Any) {
        let myAppUrl = NSURL(string: "https://developer.apple.com")!
        extensionContext?.open(myAppUrl as URL, completionHandler: { (success) in
            if (!success) {
                // let the user know it failed
            }
        })
        
    }
    
    //Home
    @IBAction func goHome(_ sender: Any) {
        let myAppUrl = NSURL(string: "https://developer.apple.com")!
        extensionContext?.open(myAppUrl as URL, completionHandler: { (success) in
            if (!success) {
                // let the user know it failed
            }
        })
        
    }
    
    //Apple
    @IBAction func gotoapple(_ sender: Any) {
        // 41.312763, -72.933807
        let myAppUrl = NSURL(string: "us.joeis.Starbucks")!
        extensionContext?.open(myAppUrl as URL, completionHandler: { (success) in
            if (!success) {
                // let the user know it failed
                print("fail")
            }
        })

    }
}
