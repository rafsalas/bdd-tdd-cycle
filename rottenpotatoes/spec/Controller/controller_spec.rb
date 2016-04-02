require "spec_helper"

describe MoviesController, :type => :controller do
  before :each do
      Movie.create(title:'a',rating:'R',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'b',rating:'R',director:'terentino',release_date:'1987-19-2')
      Movie.create(title:'c',rating:'G',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'d',rating:'PG',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'e',rating:'PG',director:'spielberg',release_date:'1987-19-2')
      Movie.create(title:'f',rating:'PG',director:'terentino',release_date:'1987-19-2')
      Movie.create(title:'g',rating:'G',director:'raf',release_date:'1987-19-2')
      Movie.create(title:'h',rating:'G',director:'',release_date:'1987-19-2')
  end
  describe "similar" do
    it "finds similar movies" do
      get :director, :id => '1'
      assert_not_nil assigns(:movies)
      expect(assigns(:movies).length).to eq 4
    end
    it 'should redirect for no director info' do
      get :director, {:id => "8"}
      response.should redirect_to(movies_path)
    end
  end

  describe 'find a movie' do
    it 'should show the movie information' do
      get :show, {:id => '1'}
      response.should render_template('show')
    end
  end
  
  describe 'should edit' do
    it 'should be able to edit movie' do
      get :edit, {:id => '1'}
      response.should render_template('edit')
    end
  end
  
  describe 'list movies' do
    it 'should show index page with results' do
      get :index
      response.should render_template('index')
    end
    it 'should movies with rating G' do
      get :index, {:ratings => 'G'}
      response.should redirect_to(:ratings => 'G')
    end
    it 'should show index page with sorted titles and Pg ratings selected' do
      get :index, {:sort => 'title', :ratings => 'PG'}
      response.should redirect_to(:sort => 'title', :ratings => 'PG')
    end
    it 'should show index page with sorted release dates and Pg ratings selected' do
      get :index, {:sort => 'release_date', :ratings => 'PG'}
      response.should redirect_to(:sort => 'release_date', :ratings => 'PG')
    end
  end
  describe 'create new movie' do
    it 'should create new movie' do
      movie = double('Movie',:title => 'new_movie')
      Movie.should_receive(:create!).and_return(movie)
      post :create, :movie => movie
      response.should redirect_to(movies_path)
    end
  end
    describe 'delete a movie' do
    it 'should delete the movie' do
      delete :destroy, :id => '1'
      response.should redirect_to(movies_path)
    end
  end
end