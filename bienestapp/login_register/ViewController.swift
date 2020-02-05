import UIKit
import Alamofire

var saved_token: String = String()


class ViewController: UIViewController {
    
    var didload:Bool = false
    

    @IBOutlet weak var email_text: UITextField!
    @IBOutlet weak var password_text: UITextField!
    @IBOutlet weak var login_button: UIButton!
    @IBOutlet weak var wrong_crdentials_label: UILabel!
    
    @IBOutlet var all: UIView!
    @IBOutlet weak var hidden_text: UITextField!
    
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
            
         
            
         //   let reqsinv = Requests()
            
            self.login(email: "cevasdf1234@yopmail.com", password: "O0rwW9c8")
       
            
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
                
                self.hidden_text.text = token.token
                
                
                if token.token == "" {
                    self.badlogin()
                    self.wrong_crdentials_label.isHidden = false
                    
                } else {
                    self.continuelogin()
                }
                
                
            }
            
            
            
            //aqui se salvan datos
            
        }
     
        //aqui no
    }
    
    func badlogin() {
        self.login_button.setTitle("LOGIN", for: .normal)
        self.login_button.isEnabled = true
    }
    
   
    func continuelogin(){
 
        self.setSavedToken()
        self.getMainData()
       
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let name = UserDefaults.standard.string(forKey: "token")
        
        didload = true
        all.isHidden = false
        
        
      /*  if name == nil
        {
            didload = true
            all.isHidden = false
            
        } else {
            
            self.hidden_text.text = name
            self.continuelogin()  // aqui hay que decirle que se logue directamente
        }*/
    
    }
    
    func setSavedToken()
    {

        // saved_token = self.hidden_text.text!
        saved_token = self.hidden_text.text!

        
    }
    
    func getMainData(){
        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/myapps", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                   
                    if response.result.isFailure {
                        self.badlogin()
                        
                        saved_token = ""
                        self.didload = true
                        self.all.isHidden = false
                        
                        
                    } else {
                        
                        let date = Date()
                        let format = DateFormatter()
                        format.dateFormat = "yyyy-MM-dd"
                        let formattedDate = format.string(from: date)
                        
                        
                        let data = response.result.value as! [[String : Any]]
                        Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/todayuse", method: .post, parameters: ["date":formattedDate], headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                            
                            let data_daily = response.result.value as! [[String : Any]]
                            
                            var daily_use: [String] = []
                            
                            
                            for i in 0...(data.count-1) {
                                
                                var used_time: String = "0"
                                
                                if !data_daily.isEmpty {
                                    
                                    
                                    for o in 0...(data_daily.count-1) {
                                        
                                        if data[i]["id"] as! Int == data_daily[o]["app_id"] as! Int {
                                            
                                            var double_num: Double = data_daily[o]["used_time"] as! Double
                                            
                                            double_num /= 60000.00
                                            
                                            let int_num:Int = Int(double_num)
                                            
                                            let def_num: String = String(int_num)
                                            
                                            used_time = def_num
                                            
                                        }
                                        
                                    }
                                    
                                }
                                
                                
                                daily_use.append(used_time)
                                
                            }
                            
             
                       cellsdatamain = MainViewData(todo: data, daily_usage: daily_use)
                            
                            Alamofire.request("http://127.0.0.1:8888/Diego/bienestar/public/index.php/api/restrictions", method: .get, headers: ["token": saved_token]).responseJSON { response in // method defaults to `.get`
                                
                                let restriction_data = response.result.value as! [[String : Any]]
                                
                                cellsdatarestrictions = RestrictionData(todo: restriction_data)
                                
                                self.dismiss(animated: true)
                                
                                self.performSegue(withIdentifier: "LoginToMain", sender: Any?.self)
                                
                            }
              
                
                
                
            }
                
                
            }
                
        
            
            }
        }
        
    }
    

    
    /*
     PARA GUARDAR LOS ICONOS:
     https://rss.itunes.apple.com/es-es
     esto va a ser la hostia*/

    

    
    


