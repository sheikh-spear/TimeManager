defmodule TimeManager.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :is_active, :boolean, default: false
		field :password, :string, virtual: true
    field :password_hash, :string
    field :is_manager, :boolean, default: false
    field :is_general_manager, :boolean, default: false
    field :start, :naive_datetime, default: nil
    field :status, :boolean, default: false
    field :manager, {:array, :binary_id}
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
		|> cast(attrs, [:email, :is_active, :password, :is_manager, :is_general_manager, :start, :status, :manager])
		|> validate_required([])
    |> unique_constraint(:email)
		|> put_password_hash()
  end

	defp put_password_hash(
		%Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
		) do
		change(changeset, Bcrypt.add_hash(password))
	end

	defp put_password_hash(changeset) do
		changeset
	end
end
