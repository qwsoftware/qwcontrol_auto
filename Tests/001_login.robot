*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Test Cases ***

CT-L01 - Login com usuário e senha corretos
    Dado que estou na aplicação    
    Quando realizo o login    ${LOGIN.QW50}    ${SENHA.QW50}
    Então devo visualiza a tela principal

CT-L02 - Usuário correto, senha incorreta
    Dado que estou na aplicação
    Quando realizo o login com a senha incorreta    ${LOGIN.QW50}    senhaerrada
    Então devo visualizar a mensagem    Nome de usuário e senha inválidos.

CT-L03 - Usuário vazio
    Dado que estou na aplicação
    Quando realizo o login com a usuario vazio    ${SENHA.QW50}    Usuário não inserido
    Então devo visualizar a mensagem    Usuário não inserido

CT-L04 - Senha vazia
    Dado que estou na aplicação
    Quando realizo o login com a senha vazia    ${LOGIN.QW50}    Nome de usuário e senha inválidos.
    Então devo visualizar a mensagem    Nome de usuário e senha inválidos.

CT-L05 - Ambos os campos vazios
    Dado que estou na aplicação
    Quando realizo o login com os campos vazios
    Então devo visualizar a mensagem    Usuário não inserido

CT-L06 - Espaços em branco
    Dado que estou na aplicação    
    Quando realizo o login    ${LOGIN.QWEsp}    ${SENHA.QW50}
    Então devo visualiza a tela principal

CT-L07 - Mudança de idioma
    Dado que estou na aplicação
    Quando troco de idioma
    A pagina deve ficar em ingles