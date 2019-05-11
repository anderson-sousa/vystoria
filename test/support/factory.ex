defmodule Vystoria.Factory do
  use ExMachina.Ecto, repo: Vystoria.Repo

  def user_factory do
    %Vystoria.Accounts.User{
      email: sequence(:email, &"email-#{&1}@example.com"),
      first_name: "Jose",
      last_name: "Silva",
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

  def inspection_factory do
    %Vystoria.Inspections.Inspection{
      motivation: "some motivation",
      status: "some status"
    }
  end

  def place_factory do
    %Vystoria.Inspections.Place{
      cep: "some cep",
      city: "some city",
      complement: "some complement",
      flors: 42,
      number: 42,
      state: "some state",
      type: "some type"
    }
  end

  def representative_factory do
    %Vystoria.Inspections.Representative{
      address: "some address",
      cep: "some cep",
      city: "some city",
      complement: "some complement",
      cpf: "some cpf",
      email: "some email",
      name: "some name",
      number: "some number",
      phone: "some phone",
      state: "some state",
      type: "some type"
    }
  end

  def environment_factory do
    %Vystoria.Inspections.Environment{
      name: "some name"
    }
  end

  def item_factory do
    %Vystoria.Inspections.Item{
      description: "some description",
      name: "some name",
      state: "some state"
    }
  end

  def measurer_factory do
    %Vystoria.Inspections.Measurer{
      description: "some description",
      name: "some name",
      quantity: "some quantity",
      unit: "some unit"
    }
  end
end
