//
//  TableViewController.swift
//  Avance
//
//  Created by Joel Cantu on 4/4/16.
//  Copyright © 2016 William Miguel Rosado Aíza. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var listaConsulta: NSArray = []
    
    let kFilename = "consulta.plist"
    
    func dataFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory,.UserDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory.stringByAppendingString(kFilename)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        let array: NSMutableArray = []
        let rep = Reporte()
        
        array.insertObject(rep, atIndex: 0)
        array.insertObject(rep, atIndex: 0)
        array.insertObject(rep, atIndex: 0)
        
        
        array.writeToFile(dataFilePath(), atomically: true)
        
        
        let filePath: String = self.dataFilePath()
        if NSFileManager.defaultManager().fileExistsAtPath(filePath)
        {
            listaConsulta = NSArray(contentsOfFile: filePath)!
        }else{
            listaConsulta = [rep,rep,rep]
        }
        
        
        /*
        let dia1 : Consulta = Consulta(di: 1, ag: "Tomar 2 vasos de agua", sn: "Snacks 3 veces al dia", ej: "Ejercicio 3 veces al dia", socia: "Socializar 3 veces", sem: "Lunes 4 de abril")
        
        let dia2 : Consulta = Consulta(di: 2, ag: "Tomar 4 vasos de agua", sn: "Snacks 1 veces al dia", ej: "Ejercicio 2 veces al dia", socia: "Socializar 3 veces", sem: "Martes 5 de abril")
        let dia3 : Consulta = Consulta(di: 3, ag: "Tomar 3 vasos de agua", sn: "Snacks 2 veces al dia", ej: "Ejercicio 3 veces al dia", socia: "Socializar 1 veces", sem: "Miercoles 6 de abril")
        let dia4 : Consulta = Consulta(di: 4, ag: "Tomar 4 vasos de agua", sn: "Snacks 1 veces al dia", ej: "Ejercicio 4 veces al dia", socia: "Socializar 3 veces", sem: "Jueves 7 de abril")
        
        listaConsulta.append(dia1)
        listaConsulta.append(dia2)
        listaConsulta.append(dia3)
        listaConsulta.append(dia4)
        */
 
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return listaConsulta.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Celda", forIndexPath: indexPath)

        // Configure the cell...
        let semana = listaConsulta[indexPath.row] as? Reporte
        
        let formato: NSDateFormatter = NSDateFormatter()
        formato.dateFormat = "dd/MM"
        
        cell.textLabel?.text = ("Semana del" + formato.stringFromDate((semana?.fecha)!))
        
        return cell
    }
  

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let viewDetalle = segue.destinationViewController as! ConsultaViewController
        let indexPath = tableView.indexPathForSelectedRow
        //viewDetalle.datosConsulta = listaConsulta[(indexPath?.row)!]

        
    }
    

}
