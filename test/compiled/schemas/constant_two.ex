defmodule Test.Schemas.ConstantTwo do
  @moduledoc false

  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: true, source: :ID}
  schema "constant_two" do
    field(:name, :string, source: :Name)
    field(:created, :utc_datetime, source: :mgenCreated)
    field(:create_by, :integer, source: :mgenCreatedBy)
    field(:last_updated, :utc_datetime, source: :mgenLastUpdated)
    field(:last_updated_by, :integer, source: :mgenLastUpdatedBy)
  end
end
