//
//  LogInViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/25/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class LogInViewController: UIViewController {

    @IBOutlet weak var LblUsuario: UITextField!
    @IBOutlet weak var LblContrasena: UITextField!
    @IBOutlet weak var BtnIniciarSecion: UIButton!
    
    var correo=""
    var contrasena=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LblUsuario.text=correo
        LblContrasena.text=contrasena
    }
    @IBAction func BtnIniciarSecionAction(_ sender: Any) {
        //cosas de la api
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url=delegado.urlServicio + "/login"
        
        //preparacion de los datos para despues enviarlos
        let parametros:Parameters = ["email":correo, "password":contrasena]
        //aqui va el token
        let header:HTTPHeaders=["Accept":"application/json"]
        //lo que se va a enviar
        request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: header)
            .responseJSON(completionHandler: { (resultado) in
                    if(resultado.response?.statusCode==200)
                    {
                        //entra a la app
                        print(resultado.response!)
                        
                        print(delegado.Token)
                        let json = JSON(resultado.value!)
                        delegado.Token=json["token"]["token"].string!
                        print(delegado.Token)
                    }
                    else
                    {
                        print()
                        
                        delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar",vista: self)
                    }
                })
    }
}
