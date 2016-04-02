require "spec_helper"

describe Movie do
  describe "funtions" do
    before :each do
      Movie.create(title:'a',rating:'pg',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'b',rating:'pg',director:'terentino',release_date:'1987-19-2')
      Movie.create(title:'c',rating:'pg',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'d',rating:'pg',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'e',rating:'pg',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'f',rating:'pg',director:'terentino',release_date:'1987-19-2')
      Movie.create(title:'g',rating:'pg',director:'raf',release_date:'1987-19-2')
      Movie.create(title:'h',rating:'pg',director:'',release_date:'1987-19-2')
    end
    it "finds similar movies" do
      @movie = Movie.where("title='a'").first
      expect(Movie.find_all_by_director(@movie.director).length).to eq(4)
    end
  end
end