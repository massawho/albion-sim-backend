defmodule Albionsim.Resources.Resource do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "resources" do
    field :meta, :map
    field :unique_name, :string

    timestamps()
  end

  @doc false
  def changeset(resource, attrs) do
    resource
    |> cast(attrs, [:unique_name, :meta])
    |> validate_required([:unique_name, :meta])
  end
end
