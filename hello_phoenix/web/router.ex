defmodule HelloPhoenix.Router do
  use HelloPhoenix.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/about", PageController, :about
    get "/test", PageController, :test
  end

  # ↑と重複してもOK
  scope "/", HelloPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/hello", HelloController, :index
    get "/hello/:messenger", HelloController, :show
    get "/helloid/:id", HelloController, :showid
    get "/html/:id", HelloController, :htmlhere

    get "/hello404", HelloController, :resp404

    #     #    resources "users", UserController
    #
    #     #resources "posts", PostController, only: [:index, :show]
    #     resources "comments", CommentController, except: [:delete]
    #
    #     resources "users", UserController do
    #       resources "posts", PostController
    #     end

  end

  scope "/", HelloPhoenix do
    get "/redir", PageController, :redirect_text, as: :redirect_text
  end




  scope "/admin", HelloPhoenix.Admin, as: :admin do
    pipe_through :browser

    resources "/images", ImageController
    resources "/reviews", ReviewController
    resources "/users", UserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", HelloPhoenix do
  #   pipe_through :api
  # end

  scope "/api", HelloPhoenix.Api, as: :api do
    pipe_through :api

    scope "/v1", V1, as: :v1 do
      resources "/images",  ImageController
      resources "/reviews", ReviewController
      resources "/users",   UserController
    end
  end

end
