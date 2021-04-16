/* global Given, When, Then */

import cadastroPage from '../pageobject/cadastroPage'
const cadastro = new cadastroPage


Given("que acesso a página de cadastro", () =>{
    cadastro.acessarSite()
})


And("preencho um {} nome composto por nome e sobrenome", (nome) =>{
    cadastro.inserirNome(nome);
})

And("preencho um {} email válido", (email) =>{
    cadastro.inserirEmail(email);
})

And("insiro uma {} senha com oito ou mais digitos", (senha) =>{
    cadastro.inserirSenha(senha);
})

When("clico no botão cadastrar", () =>{
    cadastro.clicarCadastrar()
})

Then("serão exibidos os {} usuários já cadastrados", (usuarios) =>{
    cadastro.conferircadastro(usuarios)
})

Then("deverá informar {} que o campo é obrigatório", (erro) =>{
    cadastro.msgErro(erro)
})

And("preencho o campo {} nome com apenas o primeiro nome", (nome) =>{
    cadastro.inserirNome(nome);  
})

And("preencho um {} email inválido", (email)=>{
    cadastro.inserirEmail(email)
})

And("insiro uma {} senha com menos de oito digitos", (senha)=>{
    cadastro.inserirSenha(senha)
})

Then("deverá informar ao usuário o que está errado {} e como inserir corretamente os dados", (erro)=>{
    cadastro.msgErro(erro)
})

And("tenho usuários cadastrados com nome {} email {} e senha {}", (nome, email, senha) =>{
     cadastro.inserirNome('teste teste')
    cadastro.inserirEmail('teste@teste.com')
    cadastro.inserirSenha('12345678')
    cadastro.clicarCadastrar()

    cadastro.inserirNome(nome)
    cadastro.inserirEmail(email)
    cadastro.inserirSenha(senha)
    cadastro.clicarCadastrar()
})

When("clico para excluir algum usuário {}", (nome) =>{
    cadastro.excluir(nome)
})

Then("o usuário deve ser excluido mantendo os outros usuários {}", (usuarios) =>{
    cadastro.conferircadastro(usuarios)
})