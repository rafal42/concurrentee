defmodule ConcurrenteeWeb.NotificationRoom do
  use Phoenix.Channel

  def join("notification:me", _message, socket) do
    {:ok, socket}
  end
end
