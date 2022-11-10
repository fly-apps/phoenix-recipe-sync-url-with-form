defmodule FormUrlRecipe.BlogTest do
  use FormUrlRecipe.DataCase

  alias FormUrlRecipe.Blog

  describe "posts" do
    alias FormUrlRecipe.Blog.Post

    import FormUrlRecipe.BlogFixtures

    @invalid_attrs %{author: nil, description: nil, title: nil}

    test "list_posts/0 returns all posts" do
      post = post_fixture()
      assert Blog.list_posts() == [post]
    end

    test "get_post!/1 returns the post with given id" do
      post = post_fixture()
      assert Blog.get_post!(post.id) == post
    end

    test "create_post/1 with valid data creates a post" do
      valid_attrs = %{author: "some author", description: "some description", title: "some title"}

      assert {:ok, %Post{} = post} = Blog.create_post(valid_attrs)
      assert post.author == "some author"
      assert post.description == "some description"
      assert post.title == "some title"
    end

    test "create_post/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Blog.create_post(@invalid_attrs)
    end

    test "update_post/2 with valid data updates the post" do
      post = post_fixture()
      update_attrs = %{author: "some updated author", description: "some updated description", title: "some updated title"}

      assert {:ok, %Post{} = post} = Blog.update_post(post, update_attrs)
      assert post.author == "some updated author"
      assert post.description == "some updated description"
      assert post.title == "some updated title"
    end

    test "update_post/2 with invalid data returns error changeset" do
      post = post_fixture()
      assert {:error, %Ecto.Changeset{}} = Blog.update_post(post, @invalid_attrs)
      assert post == Blog.get_post!(post.id)
    end

    test "delete_post/1 deletes the post" do
      post = post_fixture()
      assert {:ok, %Post{}} = Blog.delete_post(post)
      assert_raise Ecto.NoResultsError, fn -> Blog.get_post!(post.id) end
    end

    test "change_post/1 returns a post changeset" do
      post = post_fixture()
      assert %Ecto.Changeset{} = Blog.change_post(post)
    end
  end
end
