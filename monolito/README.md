# FLUTTER - Monólito

#### Versão 1.0

# I - Introdução

Este é um projeto de exemplo de Flutter utilizando o conceito de monólito, ou seja, um único projeto com suas classes, widgets e helpers dentro dele.
A arquitetura do projeto esta baseada no Clean Dart com modular, tendo suas funcionalidades quebradas por módulos.

![Estrutura de pastas Modular](https://user-images.githubusercontent.com/2637049/116998708-018ce100-acb5-11eb-8e28-26b4b6dcd7fe.png)


# II - Gerenciamento de Estado

O pacote de gerencia de estado foi o **rx_notifier** entretanto devido a utilização do padrão **triple** isso pode ser facilmente modificado bastando trocar a extensão da store pela classe referente a gerencia de estado que preferir (como a **MobxStore** por exemplo), [consultar documentação](https://pub.dev/packages/flutter_triple)

    class  HomeStore  extends  NotifierStore<Failure, EnterpriseVM> {
    }

     class  HomeStore  extends  MobxStore<Failure, EnterpriseVM> {
     }

## Triple Pattern

O triple é um pacote que propõe um padrão de desenvolvimento para suas gerencias de estado ![Triple](https://miro.medium.com/max/369/0*QcSmCm5f9h2yNRYG.png)

Basicamente ele segmenta o estado da sua aplicação em três, estado de **Load**, estado de **sucesso** e estado de **erro**
Com isso podemos facilmente criar nossa classe de estado e utilizamos o **setLoad(bool)** para atualizar o estado de load, o **update(dynamic)** para atualizar o estado de sucesso e o **setError(Failure)** para atualizar o estado de erro

    class ProductStore extends StreamStore<Exception, ProductList> {

      final ProductRepository repository;

      Counter({required this.repository}): super([]);

      fetchProduct() async {
        setLoading(true);
        try {
          final list = await repository.fetchAllProducts();
          update(list);
        } on Exception catch (e) {
          setError(e);
        } finally {
          setLoading(false);
        }
      }
    }

## ScopedBuilder

Desta forma quando quisermos construir um widget de forma reativa teremos que utilizar o ScopedBuilder que poderemos segmentar por estado e informar o que faremos em cada segmento do estado da aplicação (erro, sucesso ou load)

      Widget build(BuildContext context){
        return Scaffold(
          body: Center(
            child: ScopedBuilder(
                store: counter,
                onState: (context, state) => Text('$state'),
                onError: (context, error) => Text(error.toString()),
                onLoading: (context) => CircularProgressIndicator(),
            );
          ),
        );
      }

## Observer

Se quisermos segmentar a reatividade para executarmos funções em background podemos utilizar o **observer()**

    store.observer(
        onState: (state) => print(state),
        onError: (error) => print(error),
        onLoading: (loading) => print(loading),
    );

Para testes do triple consulte o pacote [triple_test](https://pub.dev/packages/triple_test)

Para mais informações consulte [o artigo](https://medium.com/flutterando/triple-pattern-um-novo-padr%C3%A3o-para-ger%C3%AAncia-de-estado-no-flutter-2e693a0f4c3e)

## PACOTES

- [effective_dart](https://pub.dev/packages/effective_dart) - Auxilia a seguir a guideline do [Dart](https://dart.dev/guides/language/effective-dart)
- [flutter_modular](https://pub.dev/packages/flutter_modular) - Gerencia as rotas e as injeções de dependência, além de ter um sistema de dispose inteligente para eliminar classes que não estão sendo mais utilizadas.
- [flutter_triple](https://pub.dev/packages/flutter_triple) - Auxilia no padrão de gerencia de estado
- [dio](https://pub.dev/packages/dio) - HTTP client poderoso
- [dartz](https://pub.dev/packages/dartz) - Auxilia no retorno de tuplas e também traz o conceito de programação funcional para dentro do DART
- [asuka](https://pub.dev/packages/asuka) - Mostra Snackbars, dialogs, ModalSheets em um único provider de forma simples e limpa
- [flutter_svg](https://pub.dev/packages/flutter_svg) - Renderiza arquivos svg dentro do app
- [hive](https://pub.dev/packages/hive) - Banco de dados local, simples, performático e poderoso
- [build_runner](build_runner) - Pacote utilizado por alguns packages para geração de código (neste caso foi utilizado no mockito)
- [mockito](https://pub.dev/packages/mockito) - Pacote que auxilia na geração de Mocks para testes
