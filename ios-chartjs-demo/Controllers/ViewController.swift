//
//  ViewController.swift
//  ios-chartjs-demo
//
//  Created by Kushida　Eiji on 2017/02/25.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!    
    var chartType = ChartType.line
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {
        webView.delegate = self
        loadLocalHtmlSource()
    }
    
    private func loadLocalHtmlSource() {
        
        do {
            
            if let path = Bundle.main.path(forResource: chartType.fileName(), ofType: "html") {
                let htmlFile = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
                webView.loadHTMLString(htmlFile, baseURL: URL(fileURLWithPath: Bundle.main.bundlePath))
                webView.scalesPageToFit = false
            } else {
                fatalError("HTMLファイルが見つかりません")
            }
            
        } catch let error as NSError {
            fatalError(error.localizedDescription)
        }
    }
}

//MARK:- UIWebViewDelegate
extension ViewController: UIWebViewDelegate {
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        if webView.isLoading { return }
        renderGraph()
    }
    
    private func renderGraph() {
        webView.stringByEvaluatingJavaScript(
            from: chartType.query(xaxis: chartType.xaxis(),
                                  data: chartType.data(),
                                  precedent: chartType.precedent()))
    }    
}

