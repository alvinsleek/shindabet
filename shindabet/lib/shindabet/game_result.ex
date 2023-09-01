defmodule MyApp.GameResult do
  use Ecto.Schema

  schema "game_results" do
    field :final_score, :string
    field :winner, :string
    field :details, :string

    belongs_to :sport_game, ShindaBet.SportGame

    timestamps()
  end
end
