func conectarGet() -> String! {
        var result = ""
        let headers = [
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "883a1abf-9868-4d33-bd08-c273bf4b61e4,efcd80f6-d236-4699-bc62-1a69f23bf9da",
            "Host": "vrgrd5ufgg.execute-api.us-east-1.amazonaws.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://vrgrd5ufgg.execute-api.us-east-1.amazonaws.com/default/getKonfioPro?uuid=07B75EC0-8C5C-4E39-BB27-AC2869727578")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
              
                result = String(data: data!, encoding: .utf8)!
                print(result)
                
            }
        })