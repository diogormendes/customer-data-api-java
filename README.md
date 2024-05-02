# Open Customer Data Api


> Linha adicional de texto informativo sobre o que o projeto faz. Sua introdução deve ter cerca de 2 ou 3 linhas. Não exagere, as pessoas não vão ler.

### About it

This is a open source api to simulate a data sharing using a consent base concept. Basicly to share any client data you need
to request him to consent the sharing. On this API we only have account information to be shared
and it will require the right permission and status to allow the success of the api call.
The security of the api is done using a bearer token as a plaintext base64. All the structures are detailed bellow

## 💻 Requirments

Antes de começar, verifique se você atendeu aos seguintes requisitos:

- Have Git installed
- Have Docker host installed and running


## 🚀 Running the API

To run the Api you must clone this repository and run the following command:

Linux e macOS:

```
make run-local
```
The host will be printed when the docker spins up

## ☕ Using Customer Data Api

The security of the Api consist of a jwt token with a header and payload (the sign part is omitted on purpose).

Header
```
{
  "alg": "none",
  "typ": "JWT"
}

echo -n '{"alg": "none","typ": "JWT"}' | base64
```

Payload
```
{
  "scope": "consents",
  "client_id": "client1"
}

echo -n '{"scope": "consents","client_id": "client1"}' | base64
```
The api supports 2 scopes (consents, accounts)

You must specify each for each call you make


You put together the two parts generate by the commands above and also a dot(.) at the end

```
eyJhbGciOiAibm9uZSIsInR5cCI6ICJKV1QifQ==.eyJzY29wZSI6ICJjb25zZW50cyIsImNsaWVudF9pZCI6ICJjbGllbnQxIn0=.
```

How to create a consent
Permissions allowed:
- ACCOUNTS_READ
- CREDIT_CARD_READ
```
curl --location '<HOST>:8080/test-api/consents/v1/consents' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "data": {
        "permissions": "ACCOUNTS_READ",
        "expirationDateTime": "2024-12-21T13:54:31Z"
    }
}'
```

How to update a consent
Permissions allowed:
- AUTHORISED
- REJECTED
```
curl --location --request PUT '<HOST>:8080/test-api/consents/v1/consents/urn:bank:a8989a61-0acd-4b41-b445-6e8b03d2f9f7' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer <TOKEN>' \
--data '{
    "data": {
        "status": "AUTHORISED"
    }
}'
```

How to get a consent

```
<exemplo_de_uso>
```

How to get list of accounts

```
<exemplo_de_uso>
```

How to get an accounts

```
<exemplo_de_uso>
```

Adicione comandos de execução e exemplos que você acha que os usuários acharão úteis. Fornece uma referência de opções para pontos de bônus!

## 📫 Contribuindo para <nome_do_projeto>

Para contribuir com <nome_do_projeto>, siga estas etapas:

1. Bifurque este repositório.
2. Crie um branch: `git checkout -b <nome_branch>`.
3. Faça suas alterações e confirme-as: `git commit -m '<mensagem_commit>'`
4. Envie para o branch original: `git push origin <nome_do_projeto> / <local>`
5. Crie a solicitação de pull.

Como alternativa, consulte a documentação do GitHub em [como criar uma solicitação pull](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).
