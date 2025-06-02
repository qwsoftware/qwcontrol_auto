*** Settings ***
Library           SSHLibrary
Library           OperatingSystem
Library           SeleniumLibrary
Resource    ../Resources/Screens/setup.resource

*** Variables ***
${VM_HOST}        192.168.220.106
${VM_USER}        qwcontrol
${VM_PASS}        lucas0206
${SH_FILE}        /opt/qwcontrol-watcher/monitor_qwcontrol.sh
${ARQUIVO}        /tmp/teste.json
${DESTINO}        /home/qwcontrol/filetransfer/teste.json
${URL_WEB}        http://192.168.220.106:4440
${USER}           admin
${PASS}           admin

*** Test Cases ***
Ativar Monitor E Verificar Job
    # 1. Conectar na VM e iniciar o serviço
    Open Connection    ${VM_HOST}
    Login              ${VM_USER}    ${VM_PASS}

    Write              sudo chmod +x /opt/qwcontrol-watcher/monitor_qwcontrol.sh
    Write              sudo systemctl daemon-reexec
    Write              sudo systemctl daemon-reload
    Write              sudo systemctl enable monitor_qwcontrol.service
    Write              sudo systemctl start monitor_qwcontrol.service

    # 2. Criar o arquivo e mover para o filetransfer
    Write              echo '{"id": 1, "nome": "Lucas", "status": "teste"}' > ${ARQUIVO}
    Write              cp ${ARQUIVO} ${DESTINO}

    Close Connection

    # # 3. Acessar a interface Web e verificar execução
    # Open Browser       ${URL_WEB}    chrome
    # Input Text      locator=//input[contains(@type,'text')]       text=${USER}
    # Input Text      locator=//input[contains(@type,'password')]   text=${PASS}
    # Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

    # Wait Until Page Contains    Lucas
    # Page Should Contain Element    xpath=//td[contains(text(), 'Lucas') and following-sibling::td[contains(text(), 'Concluído')]]

    # [Teardown]    Close Browser