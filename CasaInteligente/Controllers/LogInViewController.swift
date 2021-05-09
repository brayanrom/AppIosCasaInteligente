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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func BtnIniciarSecionAction(_ sender: Any) {
        
        let correo=LblUsuario.text!
        let contrasena=LblContrasena.text!
        
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
                        print("Estes es el response")
                        print(resultado.response!)
                        print("------------>")

                        print("Estes es el delegado token original")
                        print(delegado.Token)
                        print("------------>")

                        let json = JSON(resultado.value!)
                        delegado.Token=json["token"]["token"].string!
                        print("Estes es el token nuevo")
                        print(delegado.Token)
                        print("------------>")
                        self.performSegue(withIdentifier: "irInfoPerfil", sender: self)
                    }
                    else
                    {                        
                        delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar",vista: self)
                    }
                })
    }
}
