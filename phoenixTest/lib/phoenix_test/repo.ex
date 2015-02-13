defmodule Repo do
	use Ecto.Repo, adapter: Ecto.Adapters.Postgres
	
	def conf do
		parse_url Application.get_env(:phoenix, :database)[:url]
	end
	
	def priv do
		app_dir(:phoenix_test, "priv/repo")
	end
end
