describe Search do
  let(:search) {Search.new}
  describe "#new_search" do
    it "returns browser quit" do
      expect(search.new_search).to eql("Hi")
    end
  end
end