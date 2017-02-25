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
    
    let labels  = ["1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"]
    let data = [65, 59, 80, 81, 56, 55, 40, 65, 59, 80, 81, 56]
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
        renderGraph()
    }
    
    private func renderGraph() {
        webView.stringByEvaluatingJavaScript(from: chartType.query(labels: labels, data: data))
    }    
}

