# Picafé ☕️

Bem-vindo ao **Picafé** - Um e-commerce focado em cafés e chás de alta qualidade!

## Sobre o Projeto
O Picafé é um projeto de e-commerce em desenvolvimento, com foco na venda de cafés e chás. Este repositório foi criado para o projeto de avaliação das disciplinas de Engenharia de Software e Laboratório de Banco de Dados do curso de Análise e Desenvolvimento de Sistemas (ADS)

## Funcionalidades
- Cadastro e login de usuários 
- Adição e gerenciamento de produtos no catálogo (somente por administradores) (em desenvolvimento)
- Exibição de produtos em destaque na página principal 
- Estrutura de navegação com barra de menus e rodapé customizados (em desenvolvimento)
- Banco de dados SQL para gerenciamento de dados 

## Tecnologias Utilizadas
- **Linguagem**: Python
- **Framework**: Django
- **Banco de Dados**: SQL
- **Front-end**: HTML, CSS, Bootstrap (para estilização básica)

---

## Instalação e Configuração

### Pré-requisitos
- **Python** 3.7+
- **pip** (gerenciador de pacotes do Python)
- Para uso com PostgreSQL ou MySQL, instale também o driver apropriado.

### Passo a Passo

1. **Clone o repositório**:
    ```bash
    git clone https://github.com/seu-usuario/picafe.git
    cd picafe
    ```


2. **Instale as dependências**:
    ```bash
    pip install -r requirements.txt
    ```

3. **Configuração do Banco de Dados**

O Picafé utiliza **MySQL** como banco de dados padrão. Siga os passos abaixo para configurar:

- **Instale o MySQL Server**:  
   Certifique-se de que o MySQL Server está instalado e rodando em sua máquina. Caso não esteja, siga as instruções do [MySQL](https://dev.mysql.com/downloads/installer/) para instalação.

- **Crie o Banco de Dados**:  
   Antes de executar as migrações, você precisa criar um banco de dados chamado `picafe` (ou escolha outro nome e configure em `settings.py`):
   ```sql
   CREATE DATABASE picafe CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   ```

- **Atualize as configurações no arquivo settings.py**
    No diretório do projeto, localize o arquivo settings.py e edite a configuração do banco de dados:
    ```python
   DATABASES = {
       'default': {
           'ENGINE': 'django.db.backends.mysql',
           'NAME': 'picafe',  # Nome do banco de dados
           'USER': 'seu_usuario',  # Substitua pelo seu usuário MySQL
           'PASSWORD': 'sua_senha',  # Substitua pela sua senha MySQL
           'HOST': 'localhost',  # Padrão é localhost
           'PORT': '3306',  # Porta padrão do MySQL
       }
   }
   ```

- **Instale o driver MySQL para Django (caso ainda não tenha instalado):**
    ```bash
    pip install mysqlclient
    ```

- **Aplique as migrações:**
    ```bash
    python manage.py migrate
    ```

4. **Carregue dados de exemplo (opcional)**:
    ```bash
    python manage.py loaddata db.json
    ```

5. **Crie um superusuário** (para acesso ao painel de administração):
    ```bash
    python manage.py createsuperuser
    ```

6. **Inicie o servidor de desenvolvimento**:
    ```bash
    python manage.py runserver
    ```

7. Acesse a aplicação no navegador em [http://localhost:8000](http://localhost:8000).

---

## Estrutura do Projeto

- `pages/`: App para controle das páginas do e-commerce, como página inicial e de produtos.
- `user/`: App para funcionalidades de cadastro e login de usuários.
- `media/products`: Armazena imagens dos produtos cadastrados no banco de dados.
- `static/`: Arquivos estáticos, como CSS e JavaScript, para estilização e interatividade.

---

## Comandos Úteis

- **Rodar o servidor**:
  ```bash
  python manage.py runserver
