defmodule ResonatingThoughts.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :content, :string
    field :published, :boolean, default: false
    field :title, :string
    belongs_to(:user, ResonatingThoughts.Accounts.User)
    has_many(:comments, ResonatingThoughts.Blog.Comment)

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :content, :published, :user_id])
    |> validate_required([:user_id, :title, :content, :published])
  end
end
