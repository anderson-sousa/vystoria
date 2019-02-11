defmodule Vystoria.Email do
  import Bamboo.Email
  use Bamboo.Phoenix, view: VystoriaWeb.EmailView

  def confirm_account_email(to, verification_url) do
    new_email()
    |> to(to)
    |> from("vystoria.squarefive@gmail.com")
    |> subject("Ative a sua conta no Vystoria")
    |> assign(:verification_url, verification_url)
    |> render("confirmation.html", verification_url: verification_url)
  end
end
