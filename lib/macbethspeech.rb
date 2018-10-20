class Speech
  def document(url)
    xml_file = open(url).read
    doc = Nokogiri::XML(xml_file)
  end
end
