defmodule Shindabet.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :msisdn, :string
    field :password_hash, :string
    field :role, :string
    belongs_to :access_level, Shindabet.Users.AccessLevel
    has_many :bets , Shindabet.Bet

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :msisdn])
    |> validate_required([:first_name, :last_name, :email, :msisdn])
  end
end
