//
//  Consulta.swift
//  Avance
//
//  Created by Joel Cantu on 4/4/16.
//  Copyright © 2016 William Miguel Rosado Aíza. All rights reserved.
//

import UIKit

class Consulta: NSObject {
    var dia : Int = 0
    var agua : String = ""
    var snack : String = ""
    var ejercicio : String = ""
    var socialiar : String = ""
    var semana : String = ""
    
    init(di: Int, ag : String, sn : String, ej : String, socia : String, sem : String){
        dia = di
        agua = ag
        snack = sn
        ejercicio = ej
        socialiar = socia
        semana = sem
    }
}
