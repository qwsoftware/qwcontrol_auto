*** Settings ***
Resource    ../Resources/Screens/setup.resource

Test Setup       Abrir Navegador    ${URL.QW50}
Test Teardown    Fechar Navegador

*** Variables ***
${JOB001}    job001


*** Test Cases ***
CT-J01: Filtrar um Job pelo nome
    Dado que estou na aba "Jobs"
    Quando eu digito o nome do JOB no campo de filtro por nome    ${JOB001}
    Então apenas os jobs com nome correspondente devem ser exibidos    ${JOB001}

CT-J02: Executar um Job manualmente
    Dado que estou na aba "Jobs"
    E um job chamado filtrado está listado    ${JOB001}
    Quando eu clico no botão de execução do job    ${JOB001}
    Então o job deve ser iniciado com sucesso

CT-J03: Acessar os detalhes de um Job
    Dado que estou na aba "Jobs"
    Quando clico no nome do job  ${JOB001}
    Então devo ser redirecionado para a tela de detalhes desse job

CT-J04: Ativar execução para múltiplos jobs
    Dado que estou na aba "Jobs"
    E selecionei múltiplos jobs
    Quando escolho a ação "Ativar execução"
    E confirmo a operação
    Então os jobs devem ter a execução ativada

CT-J05 - Criar um job
    Dado que estou na aba "Jobs"
    Quando clico no botão "+ Novo job"
    E preencho todos os campos nescessarios
    Então devo visualiza a pagina do teste

CT-J06 - Deletar um job
    Dado que estou na aba "Jobs"
    Quando clico em Ações e depois em "Excluir essa tarefa"
    Então devo vizualizar a mensagem de exclusão

CT-J07: Visualizar status de agendamento
    Dado que estou na aba "Jobs"
    # Quando um job está agendado
    # Então deve ser exibido o tempo restante até a próxima execução
