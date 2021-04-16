/// <reference types = "Cypress" />

import cadastroElements from '../elements/cadastroElements'
const cadastroelements = new cadastroElements
const url = Cypress.config("baseurl")
class CadastroPage{


    acessarSite(){
        cy.visit(url)
    }

    inserirNome(nome){
        cy.get(cadastroelements.inserirNome()).type(nome)
    }

    inserirEmail(email){
        cy.get(cadastroelements.inserirEmail()).type(email)
    }

    inserirSenha(senha){
        
        cy.get(cadastroelements.inserirSenha()).type(senha)
    }

    clicarCadastrar(){
        cy.get(cadastroelements.btnCadastrar()).click()
        cy.screenshot()
    }

    conferircadastro(usuarios){
        cy.get(cadastroelements.nRegistrosCadastro()).should('have.length', usuarios)
        cy.screenshot()
    }

    msgErro(erro){

        cy.get(cadastroelements.campoObrigatorio()).contains(erro)
    }    

    excluir(nome){
        cy.get(cadastroelements.registroTabela()).contains(nome).parent().find(cadastroelements.btnExcluir()).click()
        cy.screenshot()
    }



}

export default CadastroPage;