defmodule HelloPhoenix.HelloController do
  use HelloPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  plug :assign_welcome_message, "Plugデフォルト"

  def show(conn, %{"messenger" => messenger}) do
    #    render conn, "show.html", messenger: messenger
    conn
    #    |> assign(:messenger, "Welcome Back!")
    |> assign(:name, "assignしたname")
    |> render("show.html")
  end


  defp assign_welcome_message(conn, msg) do
    assign(conn, :messenger, msg)
  end


  def showid(conn, %{"id" => id}) do
  #    text conn, "Showing id #{id}"
    json conn, %{id: id}
  end

  def htmlhere(conn, %{"id" => id}) do
    html conn, """
     <html>
       <head>
          <title>Passing an Id</title>
       </head>
       <body>
         <p>You sent in id #{id}</p>
       </body>
     </html>
    """
  end

  def resp404(conn, _params) do
    a = """
     <html>
       <body>
         <h1>title</h1>
         <p>html</p>
       </body>
     </html>
    """

    conn
    |> put_resp_content_type("text/html")
    |> send_resp(404, a)
  end


end
