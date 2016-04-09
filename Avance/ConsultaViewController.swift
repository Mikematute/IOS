//
//  ConsultaViewController.swift
//  Avance
//
//  Created by Joel Cantu on 4/4/16.
//  Copyright © 2016 William Miguel Rosado Aíza. All rights reserved.
//

import UIKit

class ConsultaViewController: UIViewController {

    @IBOutlet var semana: UILabel!
    @IBOutlet var informacion: UITextView!
    var datosConsulta : Consulta!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        informacion.text = datosConsulta.agua + "\n" + datosConsulta.ejercicio + "\n" + datosConsulta.socialiar + "\n" + datosConsulta.snack
        semana.text = datosConsulta.semana
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
