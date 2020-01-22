import UIKit
import Alamofire

var answer: String = ""

class ViewController: UIViewController {
    
    var didload:Bool = false

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var wrong_crdentials_label: UILabel!
    
   
    
    @IBAction func press_login_button(_ sender: UIButton) {
        
        if self.didload {
            
            let parameters: [String: String] = [
              //  "email": email_text.text!,
              //  "password": password_text.text!
                "email": "cevasdf1234@yopmail.com",
                "password": "O0rwW9c8"
            ]
            
            // LoginToMain
            
            login_button.setTitle("Loading...", for: .normal )
            
            login_button.isEnabled = false
            
           
            
            
         
            /* Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/users").responseJSON { response in // method defaults to `.get`
                print(response)
             }
 */
            
          
                
            /* Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/login", method: .post, parameters: parameters).responseJSON { response in
                    switch response.result {
                    case .success:
                        
                     print(response)
                       
                    case let .failure(error):
                        print(error)
                    }
                
            }*/
        
         //   let reqsinv = Requests()
            
            login(email: "cevasdf1234@yopmail.com", password: "O0rwW9c8")
            
            
            
            
          
            
           // reqsinv.getTonterias()
        
            
         
        }
    }
    
    func login(email: String, password:String) {
        let url = URL(string: "http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/login")
        let params = ["email": email, "password": password]
        
        
        Alamofire.request(url!, method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if let json = response.result.value {
                
                self.wrong_crdentials_label.isHidden = true
                
                let token: Token = Token(json: json as! [String : Any])
                
               // self.hiddenlabel.text = token.token
                
                
                
                if token.token == "" {
                     self.wrong_crdentials_label.isHidden = false
                    self.login_button.setTitle("LOGIN", for: .normal)
                    self.login_button.isEnabled = true
                } else {
                    self.continuelogin()
                }
                
                
            }
            
            
            
            //aqui se salvan datos
            
        }
        
        //aqui no
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToMain" {
            if let nextViewController = segue.destination as? MainViewController {
            //    nextViewController.token_string = self.hiddenlabel.text!
                print("he pasado por aqui")
            } else {
                print("o no")
            }
        }
    }
    
    func continuelogin(){
 
   //     let vc = MainViewController()
   //     vc.token_string = self.hiddenlabel.text!
        
        performSegue(withIdentifier: "LoginToMain", sender: Any?.self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        didload = true
    
    }
    

    
    /*
     PARA GUARDAR LOS ICONOS:
     https://rss.itunes.apple.com/es-es
     esto va a ser la hostia*/

    
}
    
    


