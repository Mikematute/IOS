//
//  PDFViewController.swift
//  Avance
//
//  Created by Joel Cantu on 4/4/16.
//  Copyright © 2016 William Miguel Rosado Aíza. All rights reserved.
//

import UIKit

class PDFViewController: UIViewController {
    @IBOutlet var pdf: UIWebView!
    var path = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        path = NSBundle.mainBundle().pathForResource("calAbril", ofType: "pdf")!
        
        let url = NSURL.fileURLWithPath(path)
        self.pdf.loadRequest(NSURLRequest(URL:url))
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
