defmodule Winchester.Schemas.Project do
  use Ecto.Schema
  alias Winchester.CustomTypes

  schema "projects" do
    status: CustomTypes.ProjectStatus, source: :project_status_id
  end
end
