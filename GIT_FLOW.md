# Controle de Versão

## Git Flow e Organização das Branchs

- A forma com que organizamos as branchs do projeto, se basea no modelo criado por [Vicent Driessen](https://nvie.com/posts/a-successful-git-branching-model/).
  O [Git Flow](https://danielkummer.github.io/git-flow-cheatsheet/index.pt_BR.html) é uma ferramenta de prompt de comando que auxilia o processo de criação e manejo das branches. Ao iniciar um novo projeto ou ao clonar um repositorio localmente, deve ser iniciado o controle do git flow como explicado na documentação do mesmo.

## Nomeclatura

- **Develop:** A branch develop será responsável por receber as ultimas atualizações de código proveniente de features ou correções. Nela é contido o código que ainda está sendo trabalhado A branch develop só deverá ser atualizada através de pull-request, sendo **terminantemente proibido o commit direto**.

* **Feature:** A branch feature é responsável por conter as novas funcionalidades da aplicação. Ela é gerada a partir da branch develop e após a conclusão da tarefa a ela destinada, deve ser gerado um pull-request para que as alterações sejam incluídas a branch develop. **Essa branch pode receber commit diretamente**.

- **Release:** A branch release é destinada a geração de código para produção, ela deverá ser gerada a partir da branch develop e tageada com a versão da aplicação seguindo o padrão de nomeclaturas.

- **Master:** Toda a base de código contida na branch master deverá ser passível de execução em produção, ou seja, presume-se que a branch **master** contém as ultimas alterações validadas pelo desenvolvedor e que podem ser submetidas ao ambiente de produção. A branch master só deverá ser atualizada através de releases ou hotfix, sendo **terminantemente proibido o commit direto**.

- **Hotfix:** A branch hotfix é gerada a partida da branch master e é responsavel por correções que precisam ser feitas em produção. Ao gerar um hotfix você estará alterando a base de código referente a ultima versão de produção do seu sistema. Ao concluir o hotfix será efetuado um merge tanto na master quanto na sua branch develop.

## Fluxo

![Getting Started](./img/git_flow.png)
