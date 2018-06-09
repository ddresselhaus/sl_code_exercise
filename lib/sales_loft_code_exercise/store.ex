defmodule SalesLoftCodeExercise.Store do
  use GenServer
  @ets_table :ets_store

  def start_link(opts \\ nil) do
    GenServer.start_link(__MODULE__, opts, name: __MODULE__)
  end

  def init(opts) do
    ets = :ets.new(@ets_table, [:named_table, :public, read_concurrency: true])
    {:ok, %{ets: ets}}
  end

  def add_person_record({:person, id}, record) when is_integer(id) do
    id = {:person, id}
    value = {id, :person, record}

    case :ets.insert_new(@ets_table, value) do
      false ->
        [{_id, _, existing_record}] = :ets.lookup(@ets_table, id)

        case record == existing_record do
          true ->
            {:ok, :no_op}

          false ->
            true = :ets.insert(@ets_table, value)
            {:ok, :update}
        end

      true ->
        {:ok, :create}
    end
  end

  def get_all_person_records() do
    :ets.match_object(@ets_table, {:_, :person, :_})
  end
end
