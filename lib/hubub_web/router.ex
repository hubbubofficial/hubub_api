defmodule HububWeb.Router do
  use HububWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", HububWeb.API.V1 do
    pipe_through :api

    resources "/users", UserController, only: [:index, :show, :create, :update, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", HububWeb do
  #   pipe_through :api
  # end
end
