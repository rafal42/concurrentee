defmodule Concurrentee.Repo.Migrations.CreateInvoices do
  use Ecto.Migration

  def change do
    create table(:invoices) do
      add :subject, :string
      add :net_amount, :integer

      timestamps()
    end
  end
end
