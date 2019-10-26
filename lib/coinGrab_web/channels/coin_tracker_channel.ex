defmodule CoinGrabWeb.CoinTrackerChannel do
  use CoinGrabWeb, :channel

  def join("coin_tracker", payload, socket) do
    {:ok, socket}
  end

end
