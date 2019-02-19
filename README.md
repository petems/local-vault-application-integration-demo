# local-vault-application-integration-demo

A quick demonstration of ways of integrating Vault into your application.

First, run vault in dev mode:

```
vault server -dev
```

Export the environment variables:

```
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN="s.4CgBwktVhLwAIvYjM2rORhkm"
```

Create a secret:

```
export TESTSECRET=`openssl rand -base64 32`
vault kv put secret/acmepassword value=$TESTSECRET
```

Run envconsul to see the secrets injected:

```
envconsul -once -secret secret/acmepassword env
```

And create a local file with the correct value:

```
consul-template -template="config.yml.tpl:config.yml" -once
```

And use a native integration:

```
bundle exec ruby webserver.rb
```
