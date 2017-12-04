defmodule Concurrentee.Scan do
  def call(%Concurrentee.Entities.Invoice{} = invoice) do
    :timer.sleep(5000)

    ConcurrenteeWeb.Endpoint.broadcast("notification:me", "scan_finished", %{
      "body" => "Scan for invoice #{invoice.subject} finished!"
    })
  end
end
