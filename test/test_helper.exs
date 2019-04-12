ExUnit.start()

Test.Application.start(:constant_loader, :temporary)

# File.read!("test/sql/seed.sql")
# |> String.replace("\r\n", " ")
# |> IO.inspect()
# |> Test.Repo.query!()
