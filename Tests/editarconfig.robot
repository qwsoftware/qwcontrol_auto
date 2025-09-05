*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***
CT-EC01
    Dado que estou logado na aplicação
    Quando clico em editar configurações
    Então devo visualiza
