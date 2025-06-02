*** Settings ***
Library           SSHLibrary
Library           OperatingSystem
Library           SeleniumLibrary
Resource    ../Resources/Screens/setup.resource

*** Variables ***
${VM_HOST}    192.168.220.106
${VM_USER}    qwcontrol
${VM_PASS}    lucas0206
${ARQUIVO}    /tmp/teste.json
${DESTINO}    /home/qwcontrol/filetransfer/teste.json

*** Test Cases ***
Ativar Monitor E Transferir Arquivo
    Open Connection    ${VM_HOST}
    Login              ${VM_USER}    ${VM_PASS}

    # Comandos diretos
    Execute Command    sudo chmod +x /opt/qwcontrol-watcher/monitor_qwcontrol.sh
    Execute Command    sudo systemctl daemon-reexec
    Execute Command    sudo systemctl daemon-reload
    Execute Command    sudo systemctl enable monitor_qwcontrol.service
    Execute Command    sudo systemctl restart monitor_qwcontrol.service

    # Criar e mover o arquivo
    Execute Command    echo '{"id": 1, "nome": "Lucas", "status": "teste"}' > ${ARQUIVO}
    Execute Command    cp ${ARQUIVO} ${DESTINO}

    # Verificar se foi copiado
    ${output}=         Execute Command    ls /home/qwcontrol/filetransfer
    Log To Console     ${output}
    Should Contain     ${output}    teste.json

    Close Connection

    # # 3. Acessar a interface Web e verificar execução
    # Open Browser       ${URL_WEB}    chrome
    # Input Text      locator=//input[contains(@type,'text')]       text=${USER}
    # Input Text      locator=//input[contains(@type,'password')]   text=${PASS}
    # Click Button    locator=//button[@type='submit'][contains(.,'Entrar')]

    # Wait Until Page Contains    Lucas
    # Page Should Contain Element    xpath=//td[contains(text(), 'Lucas') and following-sibling::td[contains(text(), 'Concluído')]]

    # [Teardown]    Close Browser