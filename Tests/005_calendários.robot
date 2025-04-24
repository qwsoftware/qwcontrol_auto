*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***

Caso de Teste 01 - Acessar Pagina de Calendarios por Projetos
    Dado que estou logado na aplicação
    Quando clico na aba Calendarios em Projetos
    Então devo visualiza a pagina dos Calendarios

Caso de Teste 02 - Vizualizar calendário por Projetos
    Dado que estou logado na aplicação
    Quando clico na aba Calendarios em Projetos
    E clico em "Ações" e "Vizualizar Calendario"