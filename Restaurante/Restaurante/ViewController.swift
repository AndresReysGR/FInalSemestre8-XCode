//
//  ViewController.swift
//  Restaurante
//
//  Created by Alberto Hoyos on 12/05/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {


    //Botones Outlet
    @IBOutlet weak var btnEnviar: UIButton!
    @IBOutlet weak var btnPre1Si: UIButton!
    @IBOutlet weak var btnPre1No: UIButton!
    @IBOutlet weak var btnPre2Si: UIButton!
    @IBOutlet weak var btnPre2No: UIButton!
    @IBOutlet weak var btnPre3Ex: UIButton!
    @IBOutlet weak var btnPre3Bue: UIButton!
    @IBOutlet weak var btnPre3Mal: UIButton!
    @IBOutlet weak var btnPre4Si: UIButton!
    @IBOutlet weak var brnPre4No: UIButton!
    @IBOutlet weak var btnPre5Si: UIButton!
    @IBOutlet weak var btnPre5No: UIButton!
    @IBOutlet weak var btnPre6Si: UIButton!
    @IBOutlet weak var lblGracias: UILabel!
    @IBOutlet weak var btnPre6No: UIButton!
    
    let yellow = UIColor(red: 255/255, green: 195/255, blue: 51/255, alpha: 1)

    
    var encuesta = Encuesta(id_pregunta1: 1, id_pregunta2: 1, id_pregunta3: 1, id_pregunta4: 1, id_pregunta5: 1, id_pregunta6: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblGracias.isHidden = true
        
    }
    

    //Botones Action

    @IBAction func doTapEnvi(_ sender: Any) {
        enviarinfo()
        lblGracias.isHidden = false
        
    }
    
    @IBAction func doTapP1Si(_ sender: Any) {
        encuesta.id_pregunta1 = 1
        btnPre1Si.tintColor = yellow
    }
    
    @IBAction func doTapP1No(_ sender: Any) {
        encuesta.id_pregunta1 = 2
        btnPre1No.tintColor = yellow
    }

    @IBAction func doTapP2Si(_ sender: Any) {
        encuesta.id_pregunta2 = 1
        btnPre2Si.tintColor = yellow
    }
    @IBAction func doTapP2No(_ sender: Any) {
        encuesta.id_pregunta2 = 2
        btnPre2No.tintColor = yellow
    }
    
    @IBAction func doTapP3Ex(_ sender: Any) {
        encuesta.id_pregunta3 = 1
        btnPre3Ex.tintColor = yellow
    }
    
    @IBAction func doTapP3Bu(_ sender: Any) {
        encuesta.id_pregunta3 = 2
        btnPre3Bue.tintColor = yellow
    }
    
    @IBAction func doTapP3Ma(_ sender: Any) {
        encuesta.id_pregunta3 = 3
        btnPre3Mal.tintColor = yellow
    }
    
    @IBAction func doTapP4Si(_ sender: Any) {
        encuesta.id_pregunta4 = 1
        btnPre4Si.tintColor = yellow
    }
    
    @IBAction func doTap4No(_ sender: Any) {
        encuesta.id_pregunta4 = 2
        brnPre4No.tintColor = yellow
    }
    
    @IBAction func doTapP5Si(_ sender: Any) {
        encuesta.id_pregunta5 = 1
        btnPre5Si.tintColor = yellow
    }
    
    @IBAction func doTapP5No(_ sender: Any) {
        encuesta.id_pregunta5 = 2
        btnPre5No.tintColor = yellow
    }
    
    @IBAction func doTap6Si(_ sender: Any) {
        encuesta.id_pregunta6 = 1
        btnPre6Si.tintColor = yellow
    }
    
    @IBAction func doTapP6No(_ sender: Any) {
        encuesta.id_pregunta6 = 2
        btnPre6No.tintColor = yellow
    }
    
    
    func enviarinfo(){
        do {
            let url = URL(string: "http://10.129.1.110:8000/api/encuestas")!
           var solicitud = URLRequest(url: url)
           solicitud.httpMethod = "POST"
           solicitud.allHTTPHeaderFields = [
               "Accept" : "aplication/json", "Content-type" : "application/json"
           ]

            let jsonData = try JSONEncoder().encode(encuesta)

               solicitud.httpBody = jsonData

               let task = URLSession.shared.dataTask(with: solicitud) {
                   data , request, error in
                   if let data = data {
                       print(data)
                       DispatchQueue.main.async {
                           //Lo que queremos actualizar
                       }
                   } else if let error = error {
                       print(error.localizedDescription)
                   }
               }
               task.resume()
        }
        catch{print("No se pude condificar objetos en JSON")}
    }
}

