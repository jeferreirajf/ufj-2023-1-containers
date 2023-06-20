# Exemplo de projeto Docker
Este projeto é um exemplo da utilização de um deploy docker.

O projeto está dividido em dois serviços principais:

```
mysql_db: Serviço MySQL com um banco chamado "teste"
```
```
nodeapp: Serviço NodeJS escutando a porta 3000.
```

## Rodando o projeto
Basta clonar esse repositório e executar o comando:
```
docker-compose up -d
```

Obs: É necessário ter o [Docker](https://docs.docker.com/) [instalado](https://docs.docker.com/engine/install/ubuntu/).

## Building
O arquivo ``docker-compose.yml`` possui três definições de serviços:

  * **mysql_db**:
   Este é o serviço de banco de dados MySQL. Nele definimos um banco chamado ``teste``, e uma senha para o usuário root como ``root``.
   
  * **sql_migration**:
   Este serviço é necessário para criar as tabelas de acordo com o esquema do [Prisma](https://www.prisma.io/docs) definido no arquivo ``schema.prisma``.
   
  * **nodeapp**:
   Este serviço sobe um servidor web utilizando [Express](https://expressjs.com/en/starter/hello-world.html) na porta ``3000``. Nele, estão definidos dois endpoints: (1) /, onde uma lista de usuários é exibida quando uma requisição do tipo **GET** chega. (2) /create, onde um usuário é aleatoriamente criado e guardado no banco de dados quando uma requisição do tipo **GET** chega.

## Detalhes
A construção do serviço **nodeapp** é feita em dois estágios. No primeiro, todas as dependências são inicialmente instaladas para a correta instalação do ``Prisma``. No segundo estágio, somente as dependências de produção são instaladas e então os arquivos necessários para que o ``Prisma`` funcione corretamente são copiados do primeiro estágio.

Estes estágios estão definidos no arquivo ``@production.dockerfile`` dentro da pasta ``nodeapp``.

## Dúvidas
Caso tenha alguma dúvida, por favor entre em contato com o professor.