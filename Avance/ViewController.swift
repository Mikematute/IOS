//
//  ViewController.swift
//  Avance
//
//  Created by William Miguel Rosado Aíza on 4/3/16.
//  Copyright © 2016 William Miguel Rosado Aíza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfDespierta: UITextField!
    @IBOutlet weak var tfDuerme: UITextField!
    
    @IBOutlet weak var tvHorario: UITextView!
    
    let kFilename = "horario.plist"
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory.stringByAppendingString(kFilename)
    }
    
    var iDespierta : Int = 0
    var iDuerme : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var texto : String = ""
        let filePath: String = self.dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(filePath)
        {
            let array = NSArray(contentsOfFile: filePath)
            for horario in array!{
                texto = (texto + "\(horario)")
            }
        }
        tvHorario.text = texto
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GenerarHorario(sender: UIButton) {
        iDespierta = Int(tfDespierta.text!)!
        iDuerme = Int(tfDuerme.text!)!
        let array: NSMutableArray = []
        
        let act1 : Int = ((iDespierta + 14)/2)
        let act2 : Int = ((iDuerme + 14)/2)
        var reloj : Int = iDespierta
        var ilunch : Int = -1
        var texto : String = ""
        while reloj <= iDuerme {
            if reloj == iDespierta {
                texto = (texto + "Buenos Dias. son las \(iDespierta). Recuerda desayunar con algo de agua\n")
                array.addObject("Buenos Dias. son las \(iDespierta). Recuerda desayunar con algo de agua\n")
            }
            if reloj == iDuerme {
                texto = (texto + "Buenas noches. son las \(reloj). Recuerda cenar con algo de agua\n")
                array.addObject("Buenas noches. son las \(reloj). Recuerda cenar con algo de agua\n")
            }
            if reloj == 12 {
                texto = (texto + "Son las \(reloj). Recuerda comer con almenos 1 litro de agua\n")
                array.addObject("Son las \(reloj). Recuerda comer con almenos 1 litro de agua\n")
            }

            if reloj == act1 {
                texto = (texto + "\(reloj): Recuerda (Hacer ejercico/Socializar)\n")
                array.addObject("\(reloj): Recuerda (Hacer ejercico/Socializar)\n")
            }
            if reloj == act2 {
                texto = (texto + "\(reloj): Recuerda (Hacer ejercico/Socializar)\n")
                array.addObject("\(reloj): Recuerda (Hacer ejercico/Socializar)\n")
            }
            ilunch = ilunch + 1
            if ilunch == 3{
                if reloj < 12{
                    if 12-reloj >= 1{
                        texto = (texto + "\(reloj): Ya comiste un lunch?\n")
                        array.addObject("\(reloj): Ya comiste un lunch?\n")
                        ilunch = 0
                    }
                    else{
                        ilunch = -1
                    }
                }
                else{
                    if iDuerme-reloj >= 1{
                        texto = (texto + "\(reloj): Ya comiste un lunch?\n")
                        array.addObject("\(reloj): Ya comiste un lunch?\n")
                        ilunch = 0
                    }
                    else{
                        ilunch = -1
                    }
                }
            }
            reloj = reloj + 1
        }
        tvHorario.text = texto
        array.writeToFile(dataFilePath(), atomically: true)
    }

}

