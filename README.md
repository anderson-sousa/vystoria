# vystoria

## Installing

To run this project, you will need to install the following dependencies on your system:

| Dependencie |Version       |
| :---------: | :---------:  |
| [Elixir](https://elixir-lang.org/install.html)| 1.8.1 |
| [Phoenix](https://hexdocs.pm/phoenix/installation.html)| 1.4.0 |
| [PostgreSQL](https://www.postgresql.org/download/macosx/)| 10.6 |

## Getting started

To get started, run the following commands in your project folder:

```shell
sudo -u postgres psql # log in psql
CREATE ROLE vystoria WITH LOGIN PASSWORD 'vystoria' CREATEDB; # create user to connect database
mix deps.get  # installs the dependencies
mix ecto.setup  # creates the database and run migrations
cd assets && npm i && node node_modules/webpack/bin/webpack.js --mode development && cd .. # install browser dependencies
mix phx.server  # run the application
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Tests

To run the tests for this project, simply run in your terminal:

```shell
mix test
```

## On prod

### Up and Running

```shell
mix deps.get
cd assets && npm i && npx webpack --mode production && cd ..
MIX_ENV=prod elixir --detached -S mix do compile, phx.server
```

### Connect with database

```shell
psql -h vystoria-dev.ce4nq5dtpr8z.sa-east-1.rds.amazonaws.com -p 5432 -U vystoria vystoria
```