# Pull Requests - Flutter

Este documento tem como objetivo orientar a nossa equipe na realização de Code Review e Pull Requests; uma vez que aqui na ioasys nós pedimos aos desenvolvedores que realizem
Code Review/Pull Request antes de integrar uma base de código à `develop` da aplicação. Com isso, acreditamos que assim iremos aumentar a qualidade de nossas entregas.

Fique à vontade para sugerir outros pontos para esse checklist.

# O que é um Code Review

Code review é uma prática de revisão de código que é muito utilizada em projetos open source e também por empresas de desenvolvimento de software. Ela consiste em os membros de uma equipe de desenvolvimento revisarem o código de um colega antes de integra-lo à base de código.

# O que é um Pull Request

Pull Request é quando você envia uma sugestão de melhoria para o repositório.

---

# Ao criar um Pull Request

1. Ao criar um Pull Request, se certifique de adicionar à descrição do PR um comentário que siga o seguinte padrão:


    * **Feature:** Descreva a funcionalidade/correção que você pretende fazer com esse PR
    * **Card:** Link para a tarefa do Teamwork
    * **Libraries/Gems:** (Caso adicionou alguma biblioteca/gema)
        * Nome da lib/gem adicionada - Motivo pelo qual foi adicionada

3. GIT
   - Todos os commits são pequenos e divididos logicamente;
   - As mensagens dos commits são pequenas e descritivas;
   - Tenha certeza de que você não esta commitando arquivos de IDE/editor, sonar ou coisas que não fazem referência ao projeto;
   - Caso a tarefa seja grande, divida a mesma em subtarefas;

# Checklist

## Geral

1. O seu código está funcionando?
2. Você realizou testes relacionados com a tarefa que você desenvolveu?
3. Você realizou testes para saber se a sua alteração quebrou alguma outra parte da aplicação?
4. O seu código esta seguindo os padrões estabelecidos pelo time e projeto?
   - Estrutura do projeto
   - Padrões de código estabelecido pelo time
   - Eslint padrão do time (Dart)
5. O nome de suas variáveis, funções, arquivos e traduções estão seguindo os padrões do projeto?

## Limpeza de código

1. Verificar se o Prettier foi utilizado nos arquivos alterados.
2. Remover `print` e `debugPrint`.
3. Remover todos os comentarios do codigo.

# Efetuando o merge do Pull Request

1. Para efetuar `merge` do Pull Request é preciso de no mínimo 2 aprovações, caso o Pull Request seja complexo é preciso de mais uma aprovação.
   - O que aumenta a complexidade do Pull Request:
     - Adicionar/ atualizar scripts de deploy/build
     - Adicionar dependências/bibliotecas de terceiros;
     - Atualizações de dependências/bibliotecas;
2. Para efetuar `merge` do Pull Request, todos que comentaram precisam aprovar.
3. O criador vai realizar o `merge` do Pull Request.

# Sugestões

1. Caso tenha uma sugestão, faça um Pull Request nesse repositório.
   - Para ser aprovado o mesmo precisa ter 60% de aprovação do time, por exemplo tem 20 pessoas no time de flutter, precisariamos de 12 aprovações.
2. Lembre-se esse é um documento feito pelo time e para o time, tem algum questionamento? Coloque em pauta no grupo de Flutter no Teamwork Chat.
