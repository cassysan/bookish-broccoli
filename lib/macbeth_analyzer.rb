require 'nokogiri'
require 'open-uri'
require_relative 'macbethspeech'

class MacBethAnalyzer
  def analyze
    doc = Speech.new.document("http://www.ibiblio.org/xml/examples/shakespeare/macbeth.xml")
    results = Hash.new #create a hash to store the speaker names and the # ofresults
    doc.search('//SPEECH').each do |speech|
      name = speech.at('SPEAKER').text
      results[name] = 0 if results[name].nil? #create the key and set it to 0, won't override otherwise
      line_count = speech.xpath('LINE').count #grab the number ofresults per speech of character
      results[name] += line_count #add the number back to the hash
    end
    results.delete('ALL') # delete the "all" value from the hash, don't need it.
    results.each do |speaker|
      puts "#{speaker[1]} #{speaker[0]}" #push to console.
    end
    results
  end
  analyze
end

