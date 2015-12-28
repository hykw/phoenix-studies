defmodule HelloPhoenix.PageController do
  use HelloPhoenix.Web, :controller

  def __index(conn, params) do
  #    redirect conn, to: "/redir"
  #    redirect conn, external: "http://elixir-lang.org/"
  redirect conn, to: redirect_text_path(conn, :redirect_text)


    #   conn
    #   |> put_status(:not_found)
    #   |> render "index.text", message: params["message"]
  end

  def redirect_text(conn, _params) do
    text conn, "Redirect text!"
  end

  def _index(conn, _params) do
    conn
    #    |> put_flash(:info, "Welcome to Phoenix, from flash info!")
    #|> put_flash(:error, "Let's pretend we have an error.")
    #    |> clear_flash
    #    |> put_layout(false)
    #|> put_layout("app.html")
    |> put_layout("admin.html")
    |> render("index.html")
    #    render conn, "index.html"
  end

  def index(conn, _params) do
    render conn, "index.html"
  end


end
