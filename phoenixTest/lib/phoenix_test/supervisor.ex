defmodule PhoenixTest.Supervisor do
	use Supervisor
	
	def start_link do 
		:supervisor.start_link(__MODULE__,[])
	end
	
	def init([]) do 
		tree = [
			worker(Repo,[]),
			worker(PhoenixTest.Endpoint,[]),
		]
		supervise(tree, strategy: :one_for_one)
	end
end



