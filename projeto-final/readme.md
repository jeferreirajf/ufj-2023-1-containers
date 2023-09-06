# Descrição do Projeto Final da Disciplina

A aplicação do projeto final consiste em um sistema de ***newsletter*** simplificado. Ela deverá permitir que usuários se cadastrem na ***newsletter*** com seu nome e e-mail e também deverá permitir que o administrador da ***newsletter*** envie mensagens para os usuários cadastrados. Contudo, o administrador deverá informar uma senha para que as novidades sejam enviadas. Mais detalhes sobre este envio serão descritos mais a frente.

## Introdução

No trabalho final, você deverá criar três contêiners:

1. Gateway
2. App
3. Bd

O *Gateway* será a porta de entrada para a sua aplicação. O *App* será a aplicação que você desenvolverá para comunicar com o banco de dados. O *Bd* será o banco de dados da aplicação.

## BD

Será um container baseado em `MySQL` que irá conter um banco de dados com uma tabela. A tabela deverá comportar três campos: 1) id; 2) nome; 3) email.

## App

Essa aplicação deverá servir dois *endpoints*:

1. GET /users
   Essa rota deverá retornar uma lista com todos os usuários cadastrados.

2. POST /users
   Essa rota deverá receber um objeto JSON com os campos `name` e `email`. O objeto deverá gerar um usuário e o usuário deve ser cadastrado no banco de dados.

3. POST /newsletter
   Essa rota deverá receber um objeto JSON com o campo `message` e retornar uma lista de usuários juntamente com a mensagem, no seguinte formato:
   ```
   {
      "users": [
         {
            "name": "UserName",
            "email": "UserEmail@email.com"
         }  
      ],
      "message": "A mensagem digitada"
   }
   ```

## Gateway

Essa aplicação deverá servir dois *endpoints*:

1. GET /
   Retorna um formulário com os campos `name` e `email`. Este formulário vai permitir o cadastro de um novo usuário para o ***endpoint***