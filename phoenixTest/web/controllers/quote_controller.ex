defmodule PhoenixTest.QuoteController do 
	use Phoenix.Controller
	
	alias PhoenixTest.Router
	import PhoenixTest.Router.Helpers
	
	plug :action
	
	def homepage(conn, _params) do 
		render conn, "homepage.html"
	end
	
	def index(conn, _params) do
		conn
		|> assign(:quotes, Repo.all(PhoenixTest.Quote))
		|> render("index.html")
	end
	
	def new(conn, _params) do
		render conn, "new.html"
	end
	
    def create(conn, %{"quote" => %{"saying" => saying, "author" => author}}) do
       q = %PhoenixTest.Quote{saying: saying,  author: author}
       Repo.insert(q)

       redirect conn, to: quote_path(conn, :index)
     end
end

