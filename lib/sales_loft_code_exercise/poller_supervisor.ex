defmodule SalesLoftCodeExercise.PollerSupervisor do
  alias SalesLoftCodeExercise.Poller
  use Supervisor

  def start_link(default \\ %{}) do
    Supervisor.start_link(children(), strategy: :one_for_one)
  end

  def children() do
    children = [
      worker(Poller, [])
    ]
  end
end
