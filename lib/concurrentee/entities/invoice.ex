defmodule Concurrentee.Entities.Invoice do
  use Ecto.Schema
  import Ecto.Changeset
  alias Concurrentee.Entities.Invoice

  schema "invoices" do
    field :net_amount, :integer
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(%Invoice{} = invoice, attrs) do
    invoice
    |> cast(attrs, [:subject, :net_amount])
    |> validate_required([:subject, :net_amount])
  end
end
