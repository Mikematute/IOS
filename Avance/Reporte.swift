//
//  Reporte.swift
//  ProyectoSwift
//
//  Created by Alejandro Henkel on 4/9/16.
//  Copyright © 2016 JuanOrdaz. All rights reserved.
//

import UIKit

class Reporte: NSObject {
    
    var fecha : NSDate!
    var Acumulado1 : Int!
    var Acumulado2 : Int!
    var Acumulado3 : Int!
    var Acumulado4 : Int!
    
    override init() {
        fecha = NSDate()
        Acumulado1 = 0
        Acumulado2 = 0
        Acumulado3 = 0
        Acumulado4 = 0
    }

}
