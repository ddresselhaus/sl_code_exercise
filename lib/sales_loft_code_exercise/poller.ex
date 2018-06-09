defmodule SalesLoftCodeExercise.Poller do
  use GenServer
  alias SalesLoftCodeExercise.FetchPeople
  alias SalesLoftCodeExercise.StorePeople
  alias SalesLoftCodeExercise.Store
  alias SalesLoftCodeExerciseWeb.ApiChannel
  @fetch_config Application.get_env(:sales_loft_code_exercise, FetchPeople)
  @interval 10_000
  @timer_ref :poll_timer_ref

  def start_link(opts \\ nil) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    fetch_module = @fetch_config[:module]

    state =
      %{fetch_module: fetch_module}
      |> start_poll_timer
      |> hydrate_store

    {:ok, state}
  end

  def handle_info(:fetch_new_people, state) do
    new_state =
      state
      |> start_poll_timer
      |> hydrate_store

    {:noreply, state}
  end

  def start_poll_timer(state) do
    case Map.get(state, @timer_ref) do
      nil -> nil
      pid -> Process.cancel_timer(pid)
    end

    timer_ref = Process.send_after(self(), :fetch_new_people, @interval)
    Map.put(state, @timer_ref, timer_ref)
  end

  def hydrate_store(state) do
    response = state.fetch_module.execute()

    case StorePeople.execute(response) do
      {:ok, :no_op} ->
        state

      {:ok, :update} ->
        broadcast_update(state)
        state
    end
  end

  def broadcast_update(state) do
    records = Store.get_all_person_records()
    ApiChannel.broadcast_update_payload(records)
    state
  end
end
