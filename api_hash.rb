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

=begin
def buid_web_page(hash)
  url_imagen = []
  hash.each do |photos, value|
    value.each do |atributos|
      url_imagen = atributos.values_at(:img_src)
    end
  end
  puts url_imagen
=begin
  pagina = File.new("index.html", "w")
  pagina.puts("<html>
  <head>
  </head>
  <body>
  <ul>
  <li><img src= #{url_imagen}")
  pagina.close()
end


buid_web_page(hash)

=end
=begin
hash.each do |photos, value|
  puts "photos: #{photos} , value: #{value}"
  value.each do |atributos|
    puts "atributos: #{atributos} "
    puts '---- '
    puts atributos.keys
    puts '---- '
    puts atributos.values
    puts '---- '
    puts atributos.dig(:camera,:name)
    puts '---- '
    puts '---- '
    puts atributos.dig(:id)
    puts atributos.dig(:camera,:name)
    puts atributos.dig(:img_src)
    puts atributos.dig(:rover, :name)
    puts '---- '
    puts '---- '
  end
end
=end

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
puts '---- '
puts '---- '
#print url_imagen
puts '---- '
puts '---- '

#pagina = File.new("index.html", "w")
pagina = "<html>
<head>
</head>
<body>
  <ul>
    <li>
    "
url_imagen.each do |url|
  puts url
  pagina += "<img src= '#{url}'></li>\n    "

end
pagina += "\n</ul>
</body>
</html>"

File.write('index.html',pagina)