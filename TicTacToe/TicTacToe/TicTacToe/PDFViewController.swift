//
//  PDFViewController.swift
//  TicTacToe
//
//  Created by Ruairidh Taylor 2015 (N0629719) on 12/01/2019.
//  Copyright © 2019 Ruairidh Taylor 2015 (N0629719). All rights reserved.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    var pdfView: PDFView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create and add the PDF view
        pdfView = PDFView()
        pdfView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pdfView)
        
        // make it take up the full screen
        pdfView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        pdfView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        pdfView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        pdfView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        // load our example PDF and make it display immediately
        let url = Bundle.main.url(forResource: "Rules", withExtension: "pdf")!
        pdfView.document = PDFDocument(url: url)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
