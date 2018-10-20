require_relative "../lib/macbeth_analyzer"

describe MacBethAnalyzer do
  describe ".analyze"  do
    context "#analyze" do
      it "returns the number of lines per speaker" do
        analyzer = MacBethAnalyzer.new

        results = analyzer.analyze

        expect(results['MACBETH'].to eq(719))
        expect(results["BANQUO"]).to eq(113)
        expect(results["DUNCAN"]).to eq(70)
        expect(results["ALL"]).to be_zero
    end
  end

  end
end
