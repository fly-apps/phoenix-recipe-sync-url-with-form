defmodule FormUrlRecipe.Repo do
  use Ecto.Repo,
    otp_app: :form_url_recipe,
    adapter: Ecto.Adapters.Postgres
end
