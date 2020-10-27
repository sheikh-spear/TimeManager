defmodule TimeManager.ClockPointer.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "clocks" do
    field :start, :naive_datetime
    field :status, :boolean, default: false
    field :user, :binary_id

    timestamps()
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:start, :status, :user])
    |> validate_required([:start, :status, :user])
  end
end
