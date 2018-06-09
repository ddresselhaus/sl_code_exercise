defmodule SalesLoftCodeExercise.Person do
  defstruct [:first_name, :last_name, :email_address, :job_title, :id]

  def map_sales_loft_to_struct(record) do
    id = record["id"]
    email = record["email_address"]
    first_name = record["first_name"]
    last_name = record["last_name"]
    job_title = record["title"]

    %__MODULE__{
      id: id,
      email_address: email,
      first_name: first_name,
      last_name: last_name,
      job_title: job_title
    }
  end
end
