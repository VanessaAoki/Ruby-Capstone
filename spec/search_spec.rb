require '../lib/search'

describe Search do
  let(:input) {'movie'}
  describe "#fetch_terms(input)" do
    it "returns search_web(input) if the input is not empty" do
      expect(fetch_terms(input)).to eql(https://en.wikipedia.org/wiki/movie)
    end
  end
end