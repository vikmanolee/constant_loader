defmodule Test.Repo do
    @moduledoc false

    use Ecto.Repo,
    otp_app: Mix.Project.config()[:app],
    adapter: Tds.Ecto
end
