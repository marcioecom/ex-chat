defmodule PusherWeb.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use PusherWeb, :controller

  # This clause handles errors returned by Ecto's insert/update/delete.
  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: PusherWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end

  # This clause is an example of how to handle resources that cannot be found.
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> put_view(html: PusherWeb.ErrorHTML, json: PusherWeb.ErrorJSON)
    |> render(:"404")
  end

  # This clause handles errors of pattern matching.
  def call(conn, _payload) do
    conn
    |> put_status(:internal_server_error)
    |> put_view(html: PusherWeb.ErrorHTML, json: PusherWeb.ErrorJSON)
    |> render(:"500")
  end
end
