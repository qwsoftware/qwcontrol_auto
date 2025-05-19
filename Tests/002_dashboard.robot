*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***
CT-DSH001 - Acessar Dashboard
    Dado que estou logado na aplicação
    Quando clico na aba Dashboard
    Então devo visualizar o painel do Dashboard

        