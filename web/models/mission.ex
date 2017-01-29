defmodule Test.Mission do
  use Test.Web, :model

  schema "missions" do
    field :titre, :string
    field :description, :string
    field :budget, :float
    field :date_demarrage, Ecto.Date
    belongs_to :etatmissions, Test.Etatmissions, foreign_key: :etatmissions_id

    timestamps()
  end

  @required_fields ~w(titre description budget date_demarrage)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    #|> cast_assoc(:etatmissions, require: false)
  end
end
