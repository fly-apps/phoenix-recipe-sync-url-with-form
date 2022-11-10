defmodule FormUrlRecipeWeb.PostLive.Index do
  use FormUrlRecipeWeb, :live_view

  alias FormUrlRecipe.Blog
  alias FormUrlRecipe.Blog.Post

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :posts, list_posts())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Post")
    |> assign(:post, Blog.get_post!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Post")
    |> assign(:post, %Post{})
  end

  defp apply_action(socket, :index, _params) do
    changeset = Blog.change_post(%Post{})

    socket
    |> assign(:page_title, "Listing Posts")
    |> assign(:post, nil)
    |> assign(:changeset, changeset)
  end

  @impl true
  def handle_event("search_posts", %{"post" => attrs}, socket) do
    changeset = Blog.change_post(%Post{}, attrs)

    {:noreply,
      socket
      |> assign(:changeset, changeset)
      |> assign(:posts, Blog.search_posts(attrs))
    }
  end

  def handle_event("delete", %{"id" => id}, socket) do
    post = Blog.get_post!(id)
    {:ok, _} = Blog.delete_post(post)

    {:noreply, assign(socket, :posts, list_posts())}
  end

  defp list_posts do
    Blog.list_posts()
  end
end
