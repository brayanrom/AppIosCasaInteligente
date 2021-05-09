//
//  InfoPerfilUsuarioViewController.swift
//  CasaInteligente
//
//  Created by Brayan Romero on 5/6/21.
//  Copyright © 2021 Brayan Romero. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class InfoPerfilUsuarioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        verificarData()
        
    }

    func verificarData() {
        
        //agarrar los delegados
        let delegado = UIApplication.shared.delegate as! AppDelegate
        //cosas de la api
        let url=delegado.urlServicio + "/mostrar/perfil"
        
        //aqui va el token
        let header:HTTPHeaders=["Accept":"application/json","Authorization":delegado.Token]
        
        //lo que se va a enviar
        request(url, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: header)
            
            .responseJSON(completionHandler: { (resultado) in
                if(resultado.response?.statusCode==200)
                {
                    //entra a la app

                    let json = JSON(resultado.value!)
                    print("Estes es el Id")
                    delegado.id=json["id"].int!
                    print(delegado.id)
                    print("------------>")

                    print("Estes es el Rol_Id")
                    delegado.rol_id=json["rol_id"].int!
                    print(delegado.rol_id)
                    print("------------>")
                    
                }
                else
                {
                    delegado.mensajeEnergente(titulo: "ERROR", contenido: "Error en el inicio de secion",aceptar: "Reintentar",vista: self)
                }
            })
    }
}

