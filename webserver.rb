require 'sinatra'
require 'vault'

# Vault.address = "http://127.0.0.1:8200" # Default reads from ENV["VAULT_ADDR"]
# Vault.token   = "abcd-1234" # Default reads from ENV["VAULT_TOKEN"]

get "/" do
  "Hello World!"
end

get "/password" do
  vault_pass = Vault.kv("secret").read("acmepassword")
  "Your Password is #{vault_pass.data[:value]}"
end

run Sinatra::Application.run!
