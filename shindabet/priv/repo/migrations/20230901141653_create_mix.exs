defmodule Shindabet.Repo.Migrations.CreateMix do
  use Ecto.Migration

  def change do
    create table(:mix) do
      add :"ecto.migrate", :string

      timestamps()
    end
  end
end
