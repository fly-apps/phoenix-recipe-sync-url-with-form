defmodule FormUrlRecipe.BlogFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `FormUrlRecipe.Blog` context.
  """

  @doc """
  Generate a post.
  """
  def post_fixture(attrs \\ %{}) do
    {:ok, post} =
      attrs
      |> Enum.into(%{
        author: "some author",
        description: "some description",
        title: "some title"
      })
      |> FormUrlRecipe.Blog.create_post()

    post
  end
end
