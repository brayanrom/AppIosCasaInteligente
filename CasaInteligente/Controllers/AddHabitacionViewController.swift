//
//  AddHabitacionViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/26/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AddHabitacionViewController: UIViewController {
    @IBOutlet weak var LblNombreHabitacion: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //cosas de la api
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url=delegado.urlServicio + "/areas"
        
        //aqui va el token
        let header:HTTPHeaders=["Authorization":delegado.Token,"Accept":"application/json"]
        //lo que se va a enviar
        request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header)
            .responseJSON(completionHandler: { (resultado) in
                switch (resultado.result)
                {
                case .failure:
                    delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de autenticacion",aceptar: "Reintentar",vista: self)
                case .success:
                    if(resultado.response?.statusCode==200)
                    {
                        //entra a la app
                        
                    }
                    else
                    {
                        delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar",vista: self)
                    }
                }})
    }
    //btnUsuario.layer.borderWidth=3
    //q.layer.borderColor:ColorReal

    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var aa: UIButton!
    @IBOutlet weak var aaa: UIButton!
    @IBOutlet weak var aaaa: UIButton!
    @IBOutlet weak var aaaaa: UIButton!
    @IBOutlet weak var aaaaaa: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var zz: UIButton!
    @IBOutlet weak var zzz: UIButton!
    
    
    //botones
    @IBAction func BtnBano(_ sender: Any) {
        LblNombreHabitacion.text="Bano"
    }
    @IBAction func BtnDormitorio(_ sender: Any) {
        LblNombreHabitacion.text="Dormitorio Principal"
    }
    @IBAction func BtndormiSec(_ sender: Any) {
        LblNombreHabitacion.text="Dormitorio Secundario"
    }
    @IBAction func BtnDorInf(_ sender: Any) {
        LblNombreHabitacion.text="Habitacion Infantil"
    }
    @IBAction func BtnComedor(_ sender: Any) {
        LblNombreHabitacion.text="Comedor"
    }
    @IBAction func BtnSala(_ sender: Any) {
        LblNombreHabitacion.text="Sala"
    }
    @IBAction func BtnCochera(_ sender: Any) {
        LblNombreHabitacion.text="Cochera"
    }
    @IBAction func BtnCocina(_ sender: Any) {
        LblNombreHabitacion.text="Cocina"
    }
    @IBAction func BtnBiblioteca(_ sender: Any) {
        LblNombreHabitacion.text="Biblioteca"
    }
    
    
    
}
