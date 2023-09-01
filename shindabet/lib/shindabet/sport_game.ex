defmodule Shindabet.SportGame do
  use Ecto.Schema
  import Ecto.Changeset

  schema "games" do
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(sport_game, attrs) do
    sport_game
    |> cast(attrs, [:type, :name])
    |> validate_required([:type, :name])
  end
end
