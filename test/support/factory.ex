defmodule Vystoria.Factory do
  use ExMachina.Ecto, repo: Vystoria.Repo

  def user_factory do
    %Vystoria.Accounts.User{
      # name: "Jane Smith",
      # email: sequence(:email, &"email-#{&1}@example.com"),
      # role: sequence(:role, ["admin", "user", "other"]),
      first_name: "Jose",
      last_name: "Silva",
      email: sequence(:email, &"jose.silva-#{&1}@email.com"),
      password_hash: Comeonin.Bcrypt.hashpwsalt("s3cr3t")
    }
  end

  def session_factory do
    user = insert(:user)
    {:ok, now} = DateTime.now("America/Sao_Paulo")

    %Vystoria.Auth.Session{
      revoked: false,
      revoked_at: now,
      token: Vystoria.Auth.get_user_token(user),
      user: user
    }
  end

  # def article_factory do
  #   title = sequence(:title, &"Use ExMachina! (Part #{&1})")
  #   # derived attribute
  #   slug = Vystoria.Article.title_to_slug(title)
  #   %Vystoria.Article{
  #     title: title,
  #     slug: slug,
  #     # associations are inserted when you call `insert`
  #     author: build(:user),
  #   }
  # end

  # # derived factory
  # def featured_article_factory do
  #   struct!(
  #     article_factory(),
  #     %{
  #       featured: true,
  #     }
  #   )
  # end

  # def comment_factory do
  #   %Vystoria.Comment{
  #     text: "It's great!",
  #     article: build(:article),
  #   }
  # end
end
