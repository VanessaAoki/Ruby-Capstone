require '../lib/search'

describe Search do
  let(:search) { Search.new(input, var) }
  let(:new_search) { Search.new(['star_wars'], var) }
  let(:input) { ['movie'] }
  let(:var) { 'h1#firstHeading' }

  describe '#initialize' do
    it 'returns the wikipedia url' do
      expect(search.website).to eq('https://en.wikipedia.org/wiki/movie')
    end

    it 'returns the wikipedia url with another input' do
      expect(new_search.website).to eq('https://en.wikipedia.org/wiki/star_wars')
    end
  end

  describe '#browser_new' do
    it 'returns the wikipedia title' do
      expect(search.browser_new).to eq('Film')
    end

    it 'returns the wikipedia title for second example' do
      expect(new_search.browser_new).to eq('Star Wars')
    end
  end
end
