//
//  ViewController.swift
//  UIKIT Swift
//
//  Created by Usuário Convidado on 20/04/17.
//  Copyright © 2017 Agesandro Scarpioni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var meuSegmento: UISegmentedControl!
    @IBOutlet weak var lblAno: UILabel!
    @IBOutlet weak var lblKm: UILabel!
    @IBOutlet weak var lblRota: UILabel!
    @IBOutlet weak var meuStepper: UIStepper!

    @IBAction func trocarCategoria(_ sender: Any) {
        switch(meuSegmento.selectedSegmentIndex){
        case 0:
            print("Voce clicou no botao 1")
            break;
        case 1:
            print("Voce clicou no botao 2")
            break;
        case 2:
            print("Voce clicou no botao 3")
            break;
        default:
            break;
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        self.lblAno.text = "\(Int(meuStepper.value))"
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        self.lblKm.text = "\(Int(sender.value))"
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        //exibe true ou false
        print(sender.isOn)
        //exibe 0 ou 1
        print(Int(NSNumber(value: sender.isOn)))
        
    }
  
    
    @IBAction func escolherRota(_ sender: Any) {
        let alerta = UIAlertController(
            title: "Forma para receber a rota",
            message: "Faça sua escolha",
            preferredStyle: UIAlertControllerStyle.actionSheet)
        
        alerta.addAction(UIAlertAction(
            title: "SMS",
            style: UIAlertActionStyle.default,
            handler: { (action) in
                self.lblRota.text = action.title
        }))

        alerta.addAction(UIAlertAction(
            title: "E-mail",
            style: UIAlertActionStyle.default,
            handler: { (action) in
                self.lblRota.text = action.title
        }))
        
        alerta.addAction(UIAlertAction(
            title: "Cancelar",
            style: UIAlertActionStyle.cancel,
            handler: nil))

        present(alerta, animated: true, completion: nil)
        
    }
    
    
    @IBAction func salvar(_ sender: Any) {
        var msg:String
        var tipo:String
        
        if (meuSegmento.selectedSegmentIndex < 0){
            msg = "Selecione um veículo"
        }
        else{
            tipo = meuSegmento.titleForSegment(at: meuSegmento.selectedSegmentIndex)!
            msg = "Gravando os dados para o veículo do tipo \(tipo) do ano \(lblAno.text!)"
        }
        
        let alerta = UIAlertController(
            title: "Atenção",
            message: msg,
            preferredStyle: UIAlertControllerStyle.alert)
        
        alerta.addAction(UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: { (action) in
                self.lblRota.text = action.title
        }))
        
        present(alerta, animated: true, completion: nil)
    }
    
}
