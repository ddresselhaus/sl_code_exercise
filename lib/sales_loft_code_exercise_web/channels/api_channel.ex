defmodule SalesLoftCodeExerciseWeb.ApiChannel do
  use Phoenix.Channel
  alias SalesLoftCodeExercise.Store
  alias SalesLoftCodeExercise.UpdatePayload

  def broadcast_update_payload(records) do
    payload = UpdatePayload.execute(records)
    SalesLoftCodeExerciseWeb.Endpoint.broadcast!("api", "updated_payload", %{payload: payload})
  end

  def join("api", _message, socket) do
    records = Store.get_all_person_records()
    payload = UpdatePayload.execute(records)
    {:ok, %{payload: payload}, socket}
  end
end
