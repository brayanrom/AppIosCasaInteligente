//
//  RegistrarViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 4/26/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class RegistrarViewController: UIViewController {
    @IBOutlet weak var LblNombre: UILabel!
    @IBOutlet weak var LblContrasena: UITextField!
    @IBOutlet weak var LblContrasena2: UITextField!
    @IBOutlet weak var LblCorreo: UITextField!
    @IBOutlet weak var BtnRegistrarAccion: UIButton!
    @IBOutlet weak var BtnIniciarSecion: UIButton!
    @IBOutlet weak var LblRol: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func BtnRegistrar(_ sender: Any) {
        //cosas de la api
        
        let rol=LblRol.text!
        var TipoRol=0
        switch rol {
        case "Administrador":
            TipoRol=1
            print(TipoRol)
        case "Usuario":
            TipoRol=2
            print(TipoRol)
        default:
            print("Algo raro paso  y fallo")
        }
        
        let delegado = UIApplication.shared.delegate as! AppDelegate
        let url=delegado.urlServicio + "/registro"
        
        let nombre=LblNombre.text
        let clave=LblContrasena.text
        let confirmarClave=LblContrasena2.text
        let correo=LblCorreo.text
        
        if clave==confirmarClave
        {
            //preparacion de los datos para despues enviarlos
            let parametros:Parameters = ["nombre":nombre!, "password":clave!, "email":correo!,"rol_id":2]

            //se manda la solicitud
            request(url, method: .post, parameters: parametros, encoding: JSONEncoding.default, headers: nil)
                
                .responseJSON(completionHandler: { (resultado) in
                    switch (resultado.result)
                    {
                    case .failure:
                        print(resultado.result)
                        delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de autenticacion",aceptar: "Reintentar",vista: self)
                    case .success:
                        if(resultado.response?.statusCode==200)
                        {
                            //ocultar botones
                            self.BtnRegistrarAccion.isHidden=true
                            self.BtnRegistrarAccion.isEnabled=false
                            self.BtnIniciarSecion.isHidden=false
                            self.BtnIniciarSecion.isEnabled=true
                            
                            //Se ha registrado
                            delegado.mensajeEnergente(titulo: "Correcto", contenido: "Se ha registrado Satisfactoriamente",aceptar: "Aceptar",vista: self)
                        }
                        else
                        {
                            delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar",vista: self)
                        }
                    }})
        }else
        {
            //error en confirmar contrasena
            delegado.mensajeEnergente(titulo: "ERROR", contenido: "Verificar Contrasena",aceptar: "Corregir Ahora",vista: self)
        }
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue,sender:Any?)
    {
        if segue.identifier=="RegistroLogin"{
            let ventana=segue.destination as! LogInViewController
            ventana.correo=LblCorreo.text!
            ventana.contrasena=LblContrasena.text!
        }
    }
}
