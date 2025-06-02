*** Settings ***
Library           SSHLibrary
Library           OperatingSystem
Library           SeleniumLibrary
Resource    ../Resources/Screens/setup.resource

*** Variables ***
${VM_HOST}    192.168.220.84
${VM_USER}    qwcontrol
${VM_PASS}    lucas0206


*** Test Cases ***
Ativar Monitor E Transferir Arquivo
    #Cria variavel aleatoria
    ${id_aleatorio}=      Evaluate    __import__('uuid').uuid4().hex
    ${nome_arquivo}=      Set Variable    job_${id_aleatorio}.json
    ${DESTINO}=           Set Variable    /home/qwcontrol/filetransfer/${nome_arquivo}
    Log To Console        Arquivo gerado: "${nome_arquivo}"


    Open Connection    ${VM_HOST}
    Login              ${VM_USER}    ${VM_PASS}

    # Comandos diretos
    Execute Command    sudo chmod +x /opt/qwcontrol-watcher/monitor_qwcontrol.sh
    Execute Command    sudo systemctl daemon-reexec
    Execute Command    sudo systemctl daemon-reload
    Execute Command    sudo systemctl enable monitor_qwcontrol.service
    Execute Command    sudo systemctl restart monitor_qwcontrol.service

    # Criar e mover o arquivo
    Execute Command    echo '{"id": 1, "nome": "Lucas", "status": "teste"}' > ${DESTINO}

    # Verificar se o nome do arquivo aparece no log
    ${log_output}=    Execute Command    cat /opt/qwcontrol-watcher/logs/monitor.log
    Should Contain    ${log_output}    ${nome_arquivo}
    ${verificacao}=    Execute Command    grep ${nome_arquivo} /opt/qwcontrol-watcher/logs/monitor.log
    Should Not Be Empty    ${verificacao}

    #Desliga monitor
    Execute Command    sudo systemctl stop monitor_qwcontrol.service

    Close Connection