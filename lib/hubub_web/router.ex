defmodule HububWeb.Router do
  use HububWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HububWeb.API do
    scope "/v1", V1 do
      pipe_through :api

      resources "/users", UserController, only: [:index, :show, :create, :update, :delete]
    end

    # Other scopes may use custom stacks.
    # scope "/api", HububWeb do
    #   pipe_through :api
    # end
  end
end
