defmodule Mix.Tasks.Secrex.Encrypt do
  @moduledoc """
  Encrypts secrets to the configured files.
  """

  use Mix.Task

  import Mix.Secrex

  @shortdoc "Encrypts secrets to the configured files"

  @impl true
  def run(_args) do
    key = encryption_key()

    for path <- secret_files() do
      Mix.shell().info("Encrypting #{path}")

      {:ok, encrypted} = encrypt(path, key)

      File.write!(encrypted_path(path), encrypted)
    end

    Mix.shell().info("Files have been encrypted")
  end
end
