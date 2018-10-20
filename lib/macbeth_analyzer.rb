require 'nokogiri';
require 'open-uri'
url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
file = File.open()
document = Nokigirl::XML(file)

document.root.xpath('speech').each do |speech|
  name        = speech.xpath('speaker').text
  line  = speech.xpath('line')
  origin      = speech.xpath('origin').text

  puts "#{name}, a #{line.count}"
end


