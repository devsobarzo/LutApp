//
//  SpotifyViewController.swift
//  LutApp
//
//  Created by Rober on 05/09/23.
//

import UIKit

class SpotifyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        presentSheetView()
    }
    

    func presentSheetView() {
        let sheetViewController = UIViewController()
        sheetViewController.view.backgroundColor = .white


        sheetViewController.modalPresentationStyle = .pageSheet
        present(sheetViewController, animated: true, completion: nil)
    }


}
