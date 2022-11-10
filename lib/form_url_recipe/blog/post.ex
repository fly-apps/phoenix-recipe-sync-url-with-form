defmodule FormUrlRecipe.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :author, :string
    field :description, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :description, :author])
    |> validate_required([:title, :description, :author])
  end
end
