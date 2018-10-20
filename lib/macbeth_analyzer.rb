require 'nokogiri';
require 'open-uri'

url = "http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml"
xml_file = open(url).read
# file = File.open()
document = Nokogiri::XML(xml_file)



document.search('speech').each do |speech|
  name = speech.xpath('speaker').text
  p name
  line = speech.xpath('line')
  origin = speech.xpath('origin').text
  puts "#{name}, a #{line.count}"
end


