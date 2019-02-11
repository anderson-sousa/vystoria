defmodule VystoriaWeb.UserView do
  use VystoriaWeb, :view
  alias VystoriaWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      id: user.id,
      first_name: user.first_name,
      last_name: user.last_name,
      is_active: user.is_active,
      is_push_notifications_activated: user.is_push_notifications_activated,
      is_email_notifications_activated: user.is_email_notifications_activated,
      email: user.email
    }
  end
end
