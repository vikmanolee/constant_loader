defmodule Test.Schemas.ConstantOne do
  @moduledoc false

  use Ecto.Schema

  @primary_key {:id, :id, autogenerate: true, source: :ID}
  schema "constant_one" do
    field(:name, :string, source: :Name)
    field(:created, :string, source: :mgenCreated)
    field(:create_by, :integer, source: :mgenCreatedBy)
    field(:last_updated, :string, source: :mgenLastUpdated)
    field(:last_updated_by, :integer, source: :mgenLastUpdatedBy)
  end
end
