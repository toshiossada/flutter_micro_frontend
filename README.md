#  PADRÕES E BOAS PRÁTICAS - FLUTTER
#### Versão 1.0

# I - Introdução

O objetivo deste documento é definir e apresentar os padrões e melhores práticas do time de Flutter da ioasys. O objetivo é que este documento seja usado como guia para o desenvolvimento de projetos dentro da ioasys, estabelecendo de forma comum a todo time as práticas, metodologias, arquiteturas, padrões, frameworks etc. que podem/devem ser usados.

Este ponto é importante, pois uma vez que estabelecida uma "linguagem comum" entre todo o time, pontos como controle de qualidade, alinhamento técnico do time, manutenibilidade, etc. são favorecidos, por isso é de extrema importância contar com a colaboração de todos para que o que aqui estabelecido seja seguido.

Outro aspecto importante, o conteúdo deste guia não será estático, ou seja, podendo ser alterado a medida que novas tecnologias e necessidades surgirem, por isso o time de Android está sempre aberto a escutar propostas e melhorias que possam ser agregadas a este documento. Para tal basta editar este documento e submeter um  _pull request_  com alteração ou abrir uma  _issue_  [neste](https://bitbucket.org/ioasys/best-pratices/src/master/)  repositório.

# II - FVM

A Versão do flutter que é utilizada neste projeto foi a 2.12.1, este projeto utiliza do Flutter Version Management (FVM) para utiliza-lo é necessário ativa-lo **pub global activate fvm** troque o apontamento do PATH do flutter para **C:\Users\Usuario\fvm\default\bin**
Agora dentro do projeto execute **fvm install** para instalar a verão.
Agora será necessário configurar as preferencias do VS CODE aperte **F1**

![Preferencias do VS CODE](https://i.ibb.co/ZcpB8B1/Sem-t-tulo.png)

Adicione o trecho abaixo a configuração

    {
	    ...
	    "dart.flutterSdkPaths": [".fvm/flutter_sdk"]
    }

Agora basta pressionar **F1** e selecionar **Flutter: Change SDK**

![Change SDK](https://i.ibb.co/GnZn5ts/Screenshot-1.png)

e escolher a versão no projeto

![setar versao](https://i.ibb.co/7NhxwvG/Screenshot-2.png)

# III - Apresentação geral da arquitetura 
A arquitetura do projeto é dividia de forma modular subdividido em micro apps, onde tem o menor índice de acoplamento possível.
Cada modulo contem seu próprio ecossistema de arquitetura e a proposta adotada foi a do clean dart.
Veja a documentação sobre CLEAN [aqui](./CLEAN.md)
![CleanDart](https://github.com/Flutterando/Clean-Dart/blob/master/imgs/img3.png?raw=true)

## Propostas de arquitetura
Dependendo de cada projeto podemos ter estrutura de projetos diferentes podendo estar em 

 - [**MONÓLITO**](./monolito/)
 - [**MONOREPO**](./monorepo/)
 - [**MULTIREPO**](./multirepo/)

# IV - Pull Requests
Veja a documentação sobre Pull Request [aqui](./PULL_REQUESTS.md)
# V - Git Flow
Veja a documentação sobre Git Flow [aqui](./GIT_FLOW.md)
# VI - Testes
Teste é algo de grande importância para garantir a qualidade dos projetos, com a implantação do Clean Dart facilita a criação dos testes
## Estrutura de pastas
É importante e bastante eficaz que a estrutura de pastas do testes sigam a mesma estrutura do projeto 
![Estrutura de pasta de testes](image)(https://user-images.githubusercontent.com/2637049/116997874-c342f200-acb3-11eb-8a99-163973ebe84e.png)

## Given-When-Then (Dado-Quando-Então)
![Given-When-Then](https://abap101.com/wp-content/uploads/2014/01/Given-When-Then-300x225.jpg)

O conceito Given-When-Then visa criar um “template” usado em todo e qualquer tipo de documentação escrita. Este template terá sempre 3 palavras já definidas e obviamente nem preciso falar quais são. Veja um exemplo de documentação de requisito escrito neste template

### Given - Dado
O Given é a parte que você define o cenário. Qual a situação atual? O que deve existir/acontecer de antemão para que o problema ou o requisito aconteça?
### When - Quando
When é o “trigger” da situação. Quando o problema é percebido? Quando a nova funcionalidade é chamada?
### Then - Então
Obviamente, o Then descreve a consequência do problema ou o resultado esperado do novo requisito
### Exemplo

    test('''
          Dado uma requisição para buscar empresas
          Quando retorno for sucesso
          Então deve retornar Lista de Empresas
    ''', () async {
    }

## Mocks
Para Mocks utilizaremos o mockito, na versão nova é a utilização do build_runner para geração das classes mockadas.
Para isto basta adicionar a classe a ser mockada na annotation **GenerateMocks**.

    @GenerateMocks([IEnterpriseDatasource])
    void main() {
      late EnterpriseRepository _repository;
      final _datasource = MockIEnterpriseDatasource();
    
      setUp(() {
        _repository = EnterpriseRepository(_datasource);
      });
    
      group('Testes de sucesso', () {
        test('''
              Dado uma requisição para buscar empresas
              Quando retorno for sucesso
              Então deve retornar Lista de Empresas
        ''', () async {
          //prepare
          when(_datasource.get()).thenAnswer((_) async => <EnterpriseModel>[]);
    
          //execute
          final result = await _repository.get();
    
          // assert
          expect(result.fold(id, id), isA<List<EnterpriseEntity>>());
          verify(_datasource.get()).called(1);
          verifyNoMoreInteractions(_datasource);
        });
      });
    }
## Recursos de terceiros

É importante que o time esteja alinhado sobre quais recursos de terceiros (libraries, frameworks, SDK's) podem ser utilizadas nos projetos do time de flutter, uma vez que essas dependências podem ter um impacto significativo no desenvolvimento e manutenção de um projeto (depreciação, bugs em aberto, incompatibilidades etc.). 

Antes de adicionar um recursos que não esteja na lista abaixo, observar os seguintes itens: 

- Issues abertas Github
- Likes, Pub Points, Popularity
- Data ultima alteração
- Resolução de bugs encontrados
- Atualização para recursos mais novos do Flutter/Dart, ex. Null Safety

Segue abaixo a lista dos recursos que podem ser utilizados: 

- [Bloc](https://pub.dev/packages/flutter_bloc)
- [Dartz](https://pub.dev/packages/dartz)
- [Dio](https://pub.dev/packages/dio)
- [Equatable](https://pub.dev/packages/equatable)
- [HTTP](https://pub.dev/packages/http)
- [Triple](https://pub.dev/packages/flutter_triple)
- [Mobx](https://pub.dev/packages/mobx)
- [Mockito](https://pub.dev/packages/mockito)
- [Hive](hhttps://pub.dev/packages/hive)
- [Secure Storage](https://pub.dev/packages/flutter_secure_storage)
- [Shared Preferences](https://pub.dev/packages/shared_preferences)
- [Asuka](https://pub.dev/packages/asuka)
- [Effective Dart](https://pub.dev/packages/effective_dart)
- Todas os recursos do core do Flutter 
- Todos os recursos do [firebase](https://firebase.google.com/?hl=pt-br)
# VIII - Boas práticas de desenvolvimento
Para garantir que as boas práticas de desenvolvimento seguindo a [guia oficial do Dart](https://dart.dev/guides/language/effective-dart) utilizamos o package [Effective Dart](https://pub.dev/packages/effective_dart) 
Isso ira gerar Avisos de linhas que não  condiz com as boas praticas do Flutter e com um [link](https://dart-lang.github.io/linter/lints/prefer_relative_imports.html) para a documentação oficial do Dart explicando como corrigi-lo

![Warning com o problema de boa prática](https://live.staticflickr.com/65535/51143729112_2546a9f7c2_z.jpg)

![Documentação oficial do Effective Dart](https://live.staticflickr.com/65535/51144405196_0cf4496961_b.jpg)
# IX - Bibliografias

Abaixo há alguns links de documentações e artigos que possam ser consultados

-  [Testes](https://medium.com/cristiano-cunha/testes-automatizados-dart-cf9df0e741ab)
-  [White Label Apps](https://itnext.io/white-label-apps-in-flutter-613b2d0a80ce)
-  [White Label in Flutter](https://medium.com/@ramiechaarani/how-to-make-a-white-label-app-in-flutter-6c3ea40fd7d5)
-  [Modular](https://medium.com/flutterando/quais-os-problemas-que-o-flutter-modular-veio-resolver-deaed96b71b3)
-  [Triple](https://medium.com/flutterando/triple-pattern-um-novo-padr%C3%A3o-para-ger%C3%AAncia-de-estado-no-flutter-2e693a0f4c3e)
-  [Get_IT](https://blog.usejournal.com/flutter-di-a-true-love-story-1e5a5ae2ba2d)
-  [Bloc](https://bloclibrary.dev/#/)
