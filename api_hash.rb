require 'uri'
require 'net/http'
require 'openssl'
require 'json'




def obtener_datos(endpoint, api_key)
  sol = "photos?sol=0&api_key="
  url_endpoint = endpoint + sol + api_key
  url = URI(url_endpoint)
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  response = http.request(request)
  result = JSON.parse(response.read_body)
  hash = result
  buid_web_page(hash)
end

def buid_web_page(hash)
  url_imagen = []
  hash.each do |photos, value|
    print "photos #{photos}"
    puts " "
    
    value.each do |atributos|
      print "atributos  #{atributos}"
      puts " "
      atributos.each do |key, valores|
        print "valores #{key} #{valores}"
        puts " "
        valores = valores.to_s + " "
        if key == "img_src"
          url_imagen += valores.split(" ")
          #print "url imagen #{url_imagen}"
          #puts " "
          
        end
      end
    end
  end
  
  pagina = "<html>
  <head>
  </head>
  <body>
    <ul>
      <li>
        "
  url_imagen.each do |url|
    pagina += "<img src= '#{url}'></li>\n        "
  end
  pagina += "\n    </ul>
  </body>
  </html>"
  
  
  File.write('index.html',pagina)
end

#print obtener_datos("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/", "yzcmtFAavpxRrh3CR0nQtGHs07tV9Nzx7l0LhuC4")

obtener_datos("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/", "yzcmtFAavpxRrh3CR0nQtGHs07tV9Nzx7l0LhuC4")

