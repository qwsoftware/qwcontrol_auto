*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***
Caso de Teste 01 - Clicar nos valores de atributo
    Dado que estou logado na aplicação e clico na aba nós
    Quando acesso nós e clico no icone de valores atribuidos
    Então devo vizualizar o texto "Sistema Operacional"

Caso de Teste 02 - Adicionar nós
    Dado que estou logado na aplicação e clico na aba Editar nós
    Quando clico em "Adicionar novo Recurso de Nó" e preencho os dados nescessario
    Então devo visualizar a mensagem de salvamento

Caso de Teste 03 - Deletar nós
    Dado que estou logado na aplicação e clico na aba Editar nós
    Quando clico no botão deletar do nó em questão
    Então o nó deve sumir da lista de nós e vizualizar a mensagem de salvamento    