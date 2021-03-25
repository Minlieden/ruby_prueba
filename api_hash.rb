hash = {

  "photos": [
      {
          "id": 102693,
          "sol": 1000,
          "camera": {
              "id": 20,
              "name": "FHAZ",
              "rover_id": 5,
              "full_name": "Front Hazard Avoidance Camera"
          },
          "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
          "earth_date": "2015-05-30",
          "rover": {
              "id": 5,
              "name": "Curiosity",
              "landing_date": "2012-08-06",
              "launch_date": "2011-11-26",
              "status": "active"
          }
      },
      {
          "id": 102694,
          "sol": 1000,
          "camera": {
              "id": 20,
              "name": "FHAZ",
              "rover_id": 5,
              "full_name": "Front Hazard Avoidance Camera"
          },
          "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FRB_486265257EDR_F0481570FHAZ00323M_.JPG",
          "earth_date": "2015-05-30",
          "rover": {
              "id": 5,
              "name": "Curiosity",
              "landing_date": "2012-08-06",
              "launch_date": "2011-11-26",
              "status": "active"
          }
      },
      {
          "id": 102850,
          "sol": 1000,
          "camera": {
              "id": 21,
              "name": "RHAZ",
              "rover_id": 5,
              "full_name": "Rear Hazard Avoidance Camera"
          },
          "img_src": "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/rcam/RLB_486265291EDR_F0481570RHAZ00323M_.JPG",
          "earth_date": "2015-05-30",
          "rover": {
              "id": 5,
              "name": "Curiosity",
              "landing_date": "2012-08-06",
              "launch_date": "2011-11-26",
              "status": "active"
          }
      }
    ]
}
def obtener_datos(endpoint)
  sol = "photos?sol=0&api_key="
  api_key = "yzcmtFAavpxRrh3CR0nQtGHs07tV9Nzx7l0LhuC4"
  url_endpoint = endpoint + sol + api_key
  url = URI(url_endpoint)
  http = Net::HTTP.new(url.host, url.port)
  request = Net::HTTP::Get.new(url)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER
  response = http.request(request)
  result = JSON.parse(response.read_body)
  return result
end

def buid_web_page(result)
  url_imagen = []
  hash.each do |photos, value|
    value.each do |atributos|
      atributos.each do |key, valores|
        valores = valores.to_s + " "
        if key == :img_src
          url_imagen += valores.split(" ")
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

obtener_datos("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/")
buid_web_page(result)

