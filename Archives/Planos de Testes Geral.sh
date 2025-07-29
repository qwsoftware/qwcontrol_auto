PostgreSQL:
Testar sempre após atualizações:

- Execuções de teste respeitando horarios
- Fluxo de JOBS
- Dependencias entre projetos
- ForceRun
- ForceRun de JOB pelo monitoramento 
- Hold/Release(Individual e Full)
- Pendencias da Daily Hab/Des
- Opção para alterar horário de execução do JOB sem alterar o agendamento padrão
- Cadastro de Incidente
- Execução dos jobs após compose down no periodo do agendamento
    - Verificar se o fluxo roda certo, depois de ja ter rodado o fluxo anteriormente na Daily
- Entrada correta na Virada da Daily
    - Verificar se Jobs que não devem entrar na Daily
    - Jobs rodando na virada da Daily
- Entrada correta na Virada da Daily com Servidor Off
    - Verificar Pendencias
- E-mail
- Jobs Ciclicos
    - Comportamento com Job rodando durante a virada da daily
    - Reagendamento correto em caso de exceder horário
    - Flag de parar ou contuniar o agendamento
    - Comportamento ao derrubar o servidor com job ciclico rodando

SQLserver:
Testar sempre após atualizações:

- Execuções de teste respeitando horarios
- Fluxo de JOBS
- Dependencias entre projetos
- ForceRun
- ForceRun de JOB pelo monitoramento
- Hold/Release(Individual e Full)
- Pendencias da Daily Hab/Des 
- Opção para alterar horário de execução do JOB sem alterar o agendamento padrão
- Cadastro de Incidente
- Execução dos jobs após servidor off no periodo do agendamento
    - Verificar se o fluxo roda certo, depois de ja ter rodado o fluxo anteriormente na Daily
- Entrada correta na Virada da Daily
    - Jobs rodando na virada da Daily
    - Verificar se Jobs que não devem entrar na Daily
- Entrada correta na Virada da Daily com Servidor Off 
    - Verificar Pendencias
- E-mail
- Jobs Ciclicos
    - Reagendamento correto em caso de exceder horário
    - Flag de parar ou contuniar o agendamento
    - Comportamento ao derrubar o servidor com job ciclico rodando

