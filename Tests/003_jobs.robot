*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***
CT-J01 - Acessar tela de jobs
    Dado que estou logado na aplicação
    Quando clico na aba jobs
    Então devo visualiza a tela de jobs

CT-J02 - Digitar parte do nome no campo de busca
    Dado que estou logado na aplicação
    Quando clico na aba jobs e vizualizo a tela de jobs
    E digito parte do nome no campo de busca e clico em buscar
    Então devo vizualizar o texto de busca

CT-J03 - Clicar no botão "Executar" do Job
    Dado que estou logado na aplicação
    E clico na aba jobs
    
CT-J02 - Criar um job
    Dado que estou logado na aplicação
    E clico na aba jobs
    Quando clico no botão "+ Novo job"
    E preencho todos os campos nescessarios
    Então devo visualiza a pagina do teste

Caso de Teste 3 - Deletar um job
    Dado que estou logado na aplicação
    E clico na aba jobs 
    Quando clico em Ações e depois em "Excluir essa tarefa"
    Então devo vizualizar a mensagem de exclusão
