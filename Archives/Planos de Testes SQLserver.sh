SQLserver:
Testar sempre após atualizações:

- Execuções de teste respeitando horarios
- Fluxo de JOBS
- Dependencias entre projetos
- ForceRun
- ForceRun de JOB pelo monitoramento 
- Hold/Release(Individual e Full)
    - Hold com JOB Ciclico/Normal executando(Verificar se não sai do hold) #Quando acontece o HOLD com jobciclico executando, após acabar a execução o job sai de hold.
- Pendencias da Daily Hab/Des 
- Opção para alterar horário de execução do JOB sem alterar o agendamento padrão
- Cadastro de Incidente
- Execução dos jobs após servidor off no periodo do agendamento
    - Verificar se o fluxo roda certo, depois de ja ter rodado o fluxo anteriormente na Daily
- Entrada correta na Virada da Daily
    - Jobs rodando na virada da Daily
    - Verificar os Jobs que não devem entrar na Daily
- Entrada correta na Virada da Daily com Servidor Off 
    - Verificar Pendencias
- E-mail
- Jobs Ciclicos
    - Reagendamento correto em caso de exceder horário
    - Flag de parar ou contuniar o agendamento
    - Comportamento ao derrubar o servidor com job ciclico rodando #falha inconcistente

Novos Testes:






atualizações 4.8.4:
melhoria colocar icone no grafico de fluxo para vizualizar o fluxo de outro projeto, mostra fluxo entre outros projeto.
melhoria de auditoria(Agora mostra modificações)
interface para criar editar acls 
Relatorio sendo gerado de acordo com dados filtrados
melhoria adicionar procedimentos agendamentos jobs ciclicos (flag "N")
Botoes reduzinos no monitoramento
Tirar hold na tela e monitoramento
Banners do monitoramento interativos