use Mix.Config

import_config "./#{Mix.env()}.exs"

if File.exists?("#{__DIR__}/#{Mix.env()}.secrets.exs") do
  import_config "./#{Mix.env()}.secrets.exs"
end
