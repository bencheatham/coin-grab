defmodule CoinGrabWeb.PageController do
  use CoinGrabWeb, :controller

  alias CoinGrab.Coins
  alias CoinGrab.Coins.Cryptocurrency

  def index(conn, _params) do
    coins = Coins.tracked_coins()
    changeset = Coins.change_cryptocurrency(%Cryptocurrency{})
    render(conn, "index.html", coins: coins, changeset: changeset)
  end

  def create(conn, %{"cryptocurrency" => %{"name" => name}}) do
    case Coins.track_coin(name) do
      {:ok, _price} ->
        conn
        |> put_flash(:info, "Coin Added")
        |> redirect(to: "/")

      {:error, changeset} ->
        coins = Coins.tracked_coins()
        render(conn, "index.html", coins: coins, changeset: changeset)
    end
  end
end
