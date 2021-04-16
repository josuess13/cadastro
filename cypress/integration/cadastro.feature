#language:pt

Funcionalidade: tela de cadastro de login

# Passos que se repetem em todos os cenários
Contexto: acessar página de cadastro
  Dado que acesso a página de cadastro

@cadastroSucesso
Esquema do Cenario: Realizar cadastro com sucesso
    
    E preencho um <nome> nome composto por nome e sobrenome
    E preencho um <email> email válido 
    E insiro uma <senha> senha com oito ou mais digitos
   Quando clico no botão cadastrar
   Então serão exibidos os <usuarios> usuários já cadastrados
    Exemplos:
|     nome     |      email     |  senha  |usuarios|
|josué da silva| josue@gmail.com| 12345678|    1   |
|  joão silva  |joao@hotmail.com|123456789|    1   |

@cadastroSemNome
Esquema do Cenario: Realizar cadastro sem preencher o nome
    E preencho um <email> email válido 
    E insiro uma <senha> senha com oito ou mais digitos
   Quando clico no botão cadastrar
   Então deverá informar <erro> que o campo é obrigatório
   Exemplos:
|      email     |  senha  |            erro           |
| josue@gmail.com| 12345678|O campo Nome é obrigatório.|
|joao@hotmail.com|123456789|O campo Nome é obrigatório.|

@cadastroSemEmail
Esquema do Cenario: Realizar cadastro sem preencher o email
    E preencho um <nome> nome composto por nome e sobrenome
    E insiro uma <senha> senha com oito ou mais digitos
   Quando clico no botão cadastrar
   Então deverá informar <erro> que o campo é obrigatório
Exemplos:
|     nome     |  senha  |             erro            |
|josué da silva| 12345678|O campo E-mail é obrigatório.|
|  joão silva  |123456789|O campo E-mail é obrigatório.|

@cadastroSemSenha
Esquema do Cenario: Realizar cadastro sem preencher a senha
    E preencho um <nome> nome composto por nome e sobrenome
    E preencho um <email> email válido 
   Quando clico no botão cadastrar
   Então deverá informar <erro> que o campo é obrigatório
Exemplos:
|     nome     |      email     |            erro            |
|josué da silva| josue@gmail.com|O campo Senha é obrigatório.|
|  joão silva  |joao@hotmail.com|O campo Senha é obrigatório.|

@cadastroUmNome
Esquema do Cenario: Realizar cadastro sem preencher o segundo nome
    E preencho o campo <nome> nome com apenas o primeiro nome
    E preencho um <email> email válido 
    E insiro uma <senha> senha com oito ou mais digitos
   Quando clico no botão cadastrar
   Então deverá informar ao usuário o que está errado <erro> e como inserir corretamente os dados  
Exemplos:
| nome|      email     |  senha  |                erro               |
|josué| josue@gmail.com| 12345678|Por favor, insira um nome completo.|
| joão|joao@hotmail.com|123456789|Por favor, insira um nome completo.|

@cadastroEmailInvalido
Esquema do Cenario: Realizar cadastro preenchendo um email inválido
    E preencho um <nome> nome composto por nome e sobrenome
    E preencho um <email> email inválido
    E insiro uma <senha> senha com oito ou mais digitos
   Quando clico no botão cadastrar
   Então deverá informar ao usuário o que está errado <erro> e como inserir corretamente os dados  
Exemplos:
|     nome     |      email     |  senha  |                erro               |
|josué da silva| josue.gmail.com| 12345678|Por favor, insira um e-mail válido.|
|  joão silva  |joao.hotmail.com|123456789|Por favor, insira um e-mail válido.|

@cadastroSenhaInvalida
Esquema do Cenario: Realizar cadastro com senha menor que oito digitos
    E preencho um <nome> nome composto por nome e sobrenome
    E preencho um <email> email válido 
    E insiro uma <senha> senha com menos de oito digitos
   Quando clico no botão cadastrar
   Então deverá informar ao usuário o que está errado <erro> e como inserir corretamente os dados  
Exemplos:
|     nome     |      email     | senha |                   erro                   |
|josué da silva| josue@gmail.com|  123  |A senha deve conter ao menos 8 caracteres.|
|  joão silva  |joao@hotmail.com|1234567|A senha deve conter ao menos 8 caracteres.|

@excuirUsuario
Esquema do Cenario: Excluir registro existente
    E tenho usuários cadastrados com nome <nome> email <email> e senha <senha>
   Quando clico para excluir algum usuário <nome>
   Então o usuário deve ser excluido mantendo os outros usuários <usuarios>
   Exemplos:
|     nome     |      email     |  senha  |usuarios|
|josué da silva| josue@gmail.com| 12345678|    1   |
|  joão silva  |joao@hotmail.com|123456789|    1   |
 