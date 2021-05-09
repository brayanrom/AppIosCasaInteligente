//
//  RegistrarUsuarioViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/26/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegistrarUsuarioViewController: UIViewController {
    
    @IBOutlet weak var LblNombre: UILabel!
    @IBOutlet weak var LblContrasena: UITextField!
    @IBOutlet weak var LblContrasena2: UITextField!
    @IBOutlet weak var LblCorreo: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func BtnIniciarSecionAction(_ sender: Any) {
        //cosas de la api
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url=delegado.urlServicio + "/registro"
        
        let clave=LblContrasena.text
        let confirmarClave=LblContrasena2.text
        let correo=LblCorreo.text
        if clave==confirmarClave
        {
            //self.performSegue(withIdentifier: "RegistroLogin", sender: self)
            //preparacion de los datos para despues enviarlos
            let parametros:Parameters = ["nombre":clave, "password":confirmarClave, "email":correo]
            
            request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil)
                .responseJSON(completionHandler: { (resultado) in
                    switch (resultado.result)
                    {
                    case .failure:
                        self.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de autenticacion",aceptar: "Reintentar")
                    case .success:
                        if(resultado.response?.statusCode==200)
                        {
                            //entra a la app
                            self.performSegue(withIdentifier: "seguePrincipal", sender: self)
                        }
                        else
                        {
                            self.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar")
                            
                        }
                    }})


        }else
        {
            //cosas por si algo sale mal al entrar
            //self.mensajeEnergente(titulo: "ERROR", contenido: "Verificar Campos",aceptar: "Corregir Ahora")
            
        }
        

    }
    
    
    
    //mensaje emergente
    func mensajeEnergente(titulo:String,contenido:String,aceptar:String){
        let ventana = UIAlertController(title:titulo,message:contenido, preferredStyle: .alert)
        let botonOK=UIAlertAction(title: aceptar, style: .default, handler:nil)
        ventana.addAction(botonOK)
        self.present(ventana, animated: true, completion: nil)
    }
}

