defmodule PusherWeb.RoomJSON do
  alias Pusher.Rooms.Room

  @doc """
  Renders a list of rooms.
  """
  def index(%{rooms: rooms}) do
    %{data: for(room <- rooms, do: data(room))}
  end

  @doc """
  Renders a single room.
  """
  def show(%{room: room}) do
    %{data: data(room)}
  end

  defp data(%Room{} = room) do
    %{
      id: room.id,
      name: room.name,
      code: room.code
    }
  end
end
