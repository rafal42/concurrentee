defmodule ConcurrenteeWeb.InvoiceController do
  use ConcurrenteeWeb, :controller
  alias Concurrentee.Entities.Invoice
  alias Concurrentee.Repo

  def index(conn, _params) do
    invoices = Repo.all(Invoice)
    render conn, "index.html", invoices: invoices
  end

  def new(conn, _params) do
    changeset = Invoice.changeset(%Invoice{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, params) do
    %{"invoice" => %{"subject" => subject, "net_amount" => net_amount} } = params

    Repo.insert(%Invoice{subject: subject, net_amount: String.to_integer(net_amount)})
    redirect conn, to: invoice_path(conn, :index)
  end

  def scan(conn, %{"id" => id}) do
    invoice = Repo.get(Invoice, id)
    Task.async(fn -> Concurrentee.Scan.call(invoice) end)
    redirect conn, to: invoice_path(conn, :index)
  end
end
