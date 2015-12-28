defmodule HelloPhoenix.PageView do
  use HelloPhoenix.Web, :view

  def message do
    "Hello from the view(def message)"
  end


  def handler_info(conn) do
    "Request Handled By: #{controller_module conn}.#{action_name conn}"
  end

  def connection_keys(conn) do
    conn
    |> Map.from_struct()
    |> Map.keys()
  end

end
