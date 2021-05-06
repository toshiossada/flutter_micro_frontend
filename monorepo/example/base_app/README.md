# FLUTTER - BASE APP

#### Versão 1.0
Para rodar o projeto execute o **flutter pub get** para baixar as dependências e depois **flutter run**

# I - Introdução

O base app é o ponto de entrada da minha aplicação, ele irá conversar somente com o **CORE** que irá acessar os modulos.
É o único que conhece todo o micro app
Ele irá ter a chamado do runApp()

    void main() => runApp(
      ModularApp(
        module: AppModule(),
        child: AppWidget(
          initialRoute: '/splash',
        ),
      ),
    );

# II - Dependências 
  commons_dependencies:
    path: '../commons_dependencies'
  core:
    path: '../core'
    
# III - Telas
![App](https://user-images.githubusercontent.com/2637049/117363594-28a10980-ae93-11eb-89fa-9a70344a5af0.gif)
