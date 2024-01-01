defmodule Pusher.RoomsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Pusher.Rooms` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        code: "some code",
        name: "some name"
      })
      |> Pusher.Rooms.create_room()

    room
  end
end
