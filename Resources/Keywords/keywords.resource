*** Settings ***
Library     SeleniumLibrary
Resource    ../Screens/setup.resource

*** Keywords ***
Abrir Navegador
    [Arguments]     ${url}
    Open Browser    ${url}       chrome
    Maximize Browser Window

Fechar Navegador
    Capture Page Screenshot
    Close Browser

Dado que estou na aplicação
    ${elemento_visivel}=    Run Keyword And Return Status    Element Should Be Visible    xpath=//p[contains(.,'Faça login e comece a usar!')]

    IF    '${elemento_visivel}' == 'False'
        Click Element                xpath=//a[@class='dropdown-toggle'][contains(.,'English')]
        Click Element                xpath=//a[contains(.,'Português')]
        Element Should Be Visible    xpath=//p[contains(.,'Faça login e comece a usar!')]
    END
    
Quando realizo o login
    [Arguments]   ${login}    ${senha}
    Input Text      locator=//input[contains(@type,'text')]       text=${login}
    Input Text      locator=//input[contains(@type,'password')]   text=${senha}
    Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

Então devo visualiza a tela principal
    Wait Until Element Is Enabled    locator=//input[contains(@type,'search')]
    Element Should Be Visible        locator=//input[contains(@type,'search')]

Quando realizo o login com a senha incorreta
    [Arguments]    ${login}    ${senha}
    Input Text      locator=//input[contains(@type,'text')]       text=${login}
    Input Text      locator=//input[contains(@type,'password')]   text=${senha}
    Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

Então devo visualizar a mensagem
    [Arguments]    ${mensagem}
    Wait Until Element Is Enabled    locator=//span[contains(.,'${mensagem}')]
    Element Should Be Visible        locator=//span[contains(.,'${mensagem}')]

Quando realizo o login com a usuario vazio
    [Arguments]    ${senha}    ${mensagem}
    Input Text      locator=//input[contains(@type,'password')]    text=${senha}
    Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

Quando realizo o login com a senha vazia
    [Arguments]    ${login}    ${mensagem}
    Input Text      locator=//input[contains(@type,'text')]    text=${login}
    Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

Quando realizo o login com os campos vazios
    Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

Quando troco de idioma
    Click Element    locator=//a[contains(@class,'dropdown-toggle')]
    Click Element    locator=//a[contains(.,'English')]

A pagina deve ficar em ingles
    Page Should Contain           text=Username
    Page Should Contain           text=Password
    Page Should Contain Button    locator=//button[@type='submit'][contains(.,'Log In')]

Dado que estou logado na aplicação e clico na aba nós
    Dado que estou na aplicação
    Quando realizo o login    ${LOGIN.QW50}    ${SENHA.QW50}
    Wait Until Element Is Visible    locator=//a[contains(.,'Projetos')]
    Click Element                    locator=//a[contains(.,'Projetos')]
    Wait Until Element Is Enabled    locator=//input[contains(@type,'text')]
    Input Text                       locator=//input[contains(@type,'text')]    text=QATestes
    Wait Until Element Is Enabled    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    Click Element                    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    Wait Until Element Is Visible    locator=//i[contains(@class,'vsm--icon fas fa-server fa-lg')]
    Click Element                    locator=//i[contains(@class,'vsm--icon fas fa-server fa-lg')]

Quando acesso nós e clico no icone de valores atribuidos
    Wait Until Element Is Visible    locator=//a[contains(@class,'nodefilterlink btn btn-default btn-xs')]
    Click Element                    locator=//a[contains(@class,'nodefilterlink btn btn-default btn-xs')]
    Wait Until Element Is Visible    locator=//i[contains(@class,'auto-caret text-muted')]
    Click Element                    locator=//i[contains(@class,'auto-caret text-muted')]

Então devo vizualizar o texto "Sistema Operacional"
    Element Should Be Visible    locator=(//td[@class='key'][contains(.,'Sistema operacional')])[1]

Dado que estou logado na aplicação e clico na aba Editar nós
    Dado que estou na aplicação
    Quando realizo o login    ${LOGIN.QW50}    ${SENHA.QW50}
    Wait Until Element Is Visible    locator=//a[contains(.,'Projetos')]
    Click Element                    locator=//a[contains(.,'Projetos')]
    Wait Until Element Is Enabled    locator=//input[contains(@type,'text')]
    Input Text                       locator=//input[contains(@type,'text')]    text=QATestes
    Wait Until Element Is Enabled    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    Click Element                    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    Wait Until Element Is Enabled    locator=//i[contains(@class,'vsm--icon fas fa-cogs fa-lg')]
    Mouse Over                       locator=//i[contains(@class,'vsm--icon fas fa-cogs fa-lg')]
    Wait Until Element Is Visible    locator=//span[contains(.,'Editar nós')]
    Click Element                    locator=//span[contains(.,'Editar nós')]

Quando clico em "Adicionar novo Recurso de Nó" e preencho os dados nescessario
    Wait Until Element Is Enabled    locator=(//button[@class='btn btn-primary'][contains(.,'Adicionar um Novo Nó')])[1]
    Sleep    1
    Click Button                     locator=(//button[@class='btn btn-primary'][contains(.,'Adicionar um Novo Nó')])[1]
    Wait Until Element Is Visible    locator=//a[contains(.,'file_titleReads a file containing node definitions in a supported format')]
    Click Element                    locator=//a[contains(.,'file_titleReads a file containing node definitions in a supported format')]
    Sleep    2
    Wait Until Element Is Enabled    locator=(//input[@class='form-control input-sm'])[1]
    Input Text                       locator=(//input[@class='form-control input-sm'])[1]    text=resourceyaml  
    Select From List By Label        xpath=//select[@class='form-control input-sm']          resourceyaml
    Input Text                       locator=(//input[@class='form-control input-sm'])[2]    text=/home/qwcontrol/server/data/nodehomolog.yaml
    Click Element                    locator=(//input[@type='checkbox'])[1]
    Checkbox Should Be Selected      locator=(//input[@type='checkbox'])[1]
    Click Element                    locator=(//input[@type='checkbox'])[2]
    Checkbox Should Be Selected      locator=(//input[@type='checkbox'])[2]
    Click Element                    locator=(//input[@type='checkbox'])[4]
    Checkbox Should Be Selected      locator=(//input[@type='checkbox'])[4]
    Click Element                    locator=//a[@class='btn btn-cta btn-xs']
    Wait Until Element Is Visible    locator=//a[@class='btn btn-cta'][contains(.,'Salvar')]
    Click Element                    locator=//a[@class='btn btn-cta'][contains(.,'Salvar')]

Então devo visualizar a mensagem de salvamento
    Wait Until Element Is Visible    locator=(//div[contains(.,'Configuration Saved')])[4]

Quando clico no botão deletar do nó em questão
    Wait Until Element Is Visible    locator=(//button[@class='btn btn-default btn-xs btn-danger'][contains(.,'Deletar')])[2]
    Click Button                     locator=(//button[@class='btn btn-default btn-xs btn-danger'][contains(.,'Deletar')])[2]

Então o nó deve sumir da lista de nós e vizualizar a mensagem de salvamento
    Element Should Not Be Visible    locator=(//button[@class='btn btn-default btn-xs btn-danger'][contains(.,'Deletar')])[2]
    Wait Until Element Is Visible    locator=//a[@class='btn btn-cta'][contains(.,'Salvar')]
    Click Element                    locator=//a[@class='btn btn-cta'][contains(.,'Salvar')]
    Wait Until Element Is Visible    locator=(//div[contains(.,'Configuration Saved')])[4]

Dado que estou logado na aplicação
    Dado que estou na aplicação
    Quando realizo o login    ${LOGIN.QW50}    ${SENHA.QW50}
    Wait Until Element Is Visible    locator=//a[contains(.,'Projetos')]
    Click Element                    locator=//a[contains(.,'Projetos')]
    Wait Until Element Is Enabled    locator=//input[contains(@type,'text')]
    Input Text                       locator=//input[contains(@type,'text')]    text=QATestes
    Wait Until Element Is Enabled    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    Click Element                    locator=//span[@class='text-ellipsis'][contains(.,'QATestes QaTestesFuncionais')]
    
Quando clico na aba Dashboard
    Wait Until Element Is Visible    locator=//i[contains(@class,'vsm--icon fas fa-tachometer-alt fa-lg')]
    Click Element                    locator=//i[contains(@class,'vsm--icon fas fa-tachometer-alt fa-lg')]

Então devo visualizar o painel do Dashboard
    Wait Until Element Is Visible    locator=//span[@class='text-h3'][contains(.,'Dashboard')]

Então devo visualiza a tela de jobs
    Wait Until Element Is Visible    locator=//a[@class='link-quiet'][contains(.,'Todos os Jobs')]

Quando clico na aba jobs e vizualizo a tela de jobs
    Wait Until Element Is Visible    locator=//i[contains(@class,'vsm--icon fas fa-list-ol fa-lg')]
    Click Element                    locator=//i[contains(@class,'vsm--icon fas fa-list-ol fa-lg')]
    Wait Until Element Is Visible    locator=//a[@class='link-quiet'][contains(.,'Todos os Jobs')]
   
E digito parte do nome no campo de busca e clico em buscar
    Input Text    locator=//input[contains(@type,'search')]    text=fluxo
    Click Element    locator=//input[contains(@name,'Search')]

Então devo vizualizar o texto de busca
    Wait Until Element Is Visible    locator=//span[@class='text-secondary'][contains(.,'Nome do Job:')]

Quando clico no botão "+ Novo job"
    Wait Until Element Is Visible    locator=//a[contains(@class,'btn btn-primary')]
    Click Element                    locator=//a[contains(@class,'btn btn-primary')]

E preencho todos os campos nescessarios
    Wait Until Element Is Visible    locator=//input[contains(@name,'jobName')]
    Input Text                       locator=//input[contains(@name,'jobName')]    text=testeautomação
    Click Element                    locator=//a[contains(.,'Fluxo de trabalho')]
    Wait Until Element Is Visible    locator=(//span[contains(.,'- Execute um comando remoto')])[1]
    Click Element                    locator=(//span[contains(.,'- Execute um comando remoto')])[1]
    Wait Until Element Is Enabled    locator=//input[@placeholder='Digite o comando shell, por exemplo: echo este é um teste']
    Input Text                       locator=//input[@placeholder='Digite o comando shell, por exemplo: echo este é um teste']    text=ls -la
    Click Element                    locator=//span[@class='btn btn-cta btn-sm'][contains(.,'Salvar')]
    Click Element                    locator=//a[contains(.,'Agendamento')]
    Wait Until Element Is Enabled    locator=//input[contains(@id,'scheduledTrue')]
    Click Element                    locator=//input[contains(@id,'scheduledTrue')]
    Click Element                    locator=//a[@data-toggle='tab'][contains(.,'Calendário')]
    Wait Until Element Is Visible    locator=//label[contains(.,'Clique aqui para selecionar um calendário:')]
    Select From List By Label        xpath=//label[normalize-space(.)='Clique aqui para selecionar um calendário:']/following-sibling::select    CalendarioAutomação
    Select From List By Label        xpath=//label[normalize-space(.)='Regra para Feriado:']/following-sibling::select[1]    Nunca
    Select From List By Label        xpath=//label[normalize-space(.)='Dia de Execução']/following-sibling::select[1]    Dia Util Seguinte/Anterior
    Click Button                     locator=(//button[@class='btn btn-success btn-lg'][contains(.,'Adicionar')])[2]
    Click Element                    locator=//input[contains(@name,'Create')]

Então devo visualiza a pagina do teste
    Wait Until Element Is Visible    locator=//a[contains(.,'testeautomação')]

Quando clico em Ações e depois em "Excluir essa tarefa"
    Wait Until Element Is Enabled    locator=(//button[@type='button'][contains(.,'Ações')])[15]
    Mouse Over                       locator=(//button[@type='button'][contains(.,'Ações')])[15]
    Sleep    1
    Click Element                     locator=(//button[@type='button'][contains(.,'Ações')])[15]
    Wait Until Element Is Visible    locator=//a[contains(@title,'Excluir este job')]  
    Click Element                    locator=//a[contains(@title,'Excluir este job')]
    Wait Until Element Is Visible    locator=//input[@value='Excluir jobs']
    Click Element                   locator=//input[@value='Excluir jobs']

Então devo vizualizar a mensagem de exclusão
    Wait Until Element Is Visible    locator=//li[contains(.,'A tarefa foi excluída com sucesso:')]

Quando clico na aba Calendarios em Projetos
    Wait Until Element Is Enabled    locator=//i[contains(@class,'vsm--icon fas fa-calendar-alt fa-lg')]
    Click Element                    locator=//i[contains(@class,'vsm--icon fas fa-calendar-alt fa-lg')]

Então devo visualiza a pagina dos Calendarios
    Wait Until Element Is Visible    locator=//a[@class='link-quiet'][contains(.,'Calendários')]

E clico em "Ações" e "Vizualizar Calendario"
    Element Should Be Enabled        locator=(//i[contains(@class,'fas fa-list')])[2]
    Click Element                    locator=(//i[contains(@class,'fas fa-list')])[2]
    Wait Until Element Is Visible    locator=(//a[@role='button'][contains(.,'Visualizar Calendário')])[1]
    Click Element                    locator=(//a[@role='button'][contains(.,'Visualizar Calendário')])[1]

Dado que estou na aba "Jobs"
    Dado que estou logado na aplicação
    Wait Until Element Is Visible    locator=//i[contains(@class,'vsm--icon fas fa-list-ol fa-lg')]
    Click Element                    locator=//i[contains(@class,'vsm--icon fas fa-list-ol fa-lg')]

Quando eu digito o nome do JOB no campo de filtro por nome
    [Arguments]    ${jobname}
    Wait Until Element Is Enabled    locator=//input[contains(@type,'search')]
    Input Text    locator=//input[@placeholder='Buscar']    text=${jobname}
    Click Element    locator=//input[contains(@id,'Search')]

Então apenas os jobs com nome correspondente devem ser exibidos
    [Arguments]    ${jobname}
    Wait Until Element Is Visible    locator=//span[@class='text-info'][contains(.,'${jobname}')]

E um job chamado filtrado está listado
    [Arguments]    ${jobname}
    Quando eu digito o nome do JOB no campo de filtro por nome    ${jobname}
    Então apenas os jobs com nome correspondente devem ser exibidos    ${jobname}

Quando eu clico no botão de execução do job
    [Arguments]    ${jobname}
    Click Element    locator=//div[@class='jobname job_list_row hover-reveal-hidden' and @data-job-name='Job001']//a[contains(@class, 'act_execute_job')]
    Wait Until Element Is Visible    locator=//button[@type='submit'][contains(.,'Executar')]
    Click Element    locator=//button[@type='submit'][contains(.,'Executar')]

Então o job deve ser iniciado com sucesso
    Wait Until Element Is Visible    locator=//span[contains(@class,' execstate execstatedisplay overall')]
    Page Should Contain Element    locator=//span[contains(@class,' execstate execstatedisplay overall')]

Quando clico no nome do job
    [Arguments]    ${jobname}
    Wait Until Element Is Visible    locator=(//a[@href='/project/QaTestesFuncionais/job/show/7b2abd42-7b04-49ef-ace8-f0e55ddbd2dc'][contains(.,'Job001')])[1]
    Click Element    locator=(//a[@href='/project/QaTestesFuncionais/job/show/7b2abd42-7b04-49ef-ace8-f0e55ddbd2dc'][contains(.,'Job001')])[1]

Então devo ser redirecionado para a tela de detalhes desse job
    Page Should Contain Element    locator=//a[contains(.,'Estatísticas')]