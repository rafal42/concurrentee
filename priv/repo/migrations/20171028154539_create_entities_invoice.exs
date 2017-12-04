defmodule Concurrentee.Repo.Migrations.CreateEntities.Invoice do
  use Ecto.Migration

  def change do
    create table(:invoices) do

      timestamps()
    end
  end
end
