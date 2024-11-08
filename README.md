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
- **Banco de Dados**: SQLite (padrão) / SQL (planejado para migração)
- **Front-end**: HTML, CSS, Bootstrap (para estilização básica)

---

## Instalação e Configuração

### Pré-requisitos
- **Python** 3.7+
- **pip** (gerenciador de pacotes do Python)
- **Virtualenv** (recomendado para isolar o ambiente do projeto)
- Para uso com PostgreSQL ou MySQL, instale também o driver apropriado.

### Passo a Passo

1. **Clone o repositório**:
    ```bash
    git clone https://github.com/seu-usuario/picafe.git
    cd picafe
    ```

2. **Crie e ative um ambiente virtual**:
    ```bash
    python -m venv venv
    source venv/bin/activate   # Linux e macOS
    venv\Scripts\activate      # Windows
    ```

3. **Instale as dependências**:
    ```bash
    pip install -r requirements.txt
    ```

4. **Configuração do Banco de Dados**
   - Para SQLite (padrão):
     ```bash
     python manage.py migrate
     ```

5. **Carregue dados de exemplo (opcional)**:
    ```bash
    python manage.py loaddata db.json
    ```

6. **Crie um superusuário** (para acesso ao painel de administração):
    ```bash
    python manage.py createsuperuser
    ```

7. **Inicie o servidor de desenvolvimento**:
    ```bash
    python manage.py runserver
    ```

8. Acesse a aplicação no navegador em [http://localhost:8000](http://localhost:8000).

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
