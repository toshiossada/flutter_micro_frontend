
# FLUTTER - CORE

#### Versão 1.0
Para rodar o projeto execute o **flutter pub get** para baixar as dependências

# I - Introdução

O core é o coração do nosso app, ele fará a ponte de conversa entre o **base_app** e os **módulos** é nele que estará a configuração das rotas principais e a chamada para o **MaterialApp()**

    Widget build(BuildContext context) {
	      return MaterialApp(
	        title: 'Flutter Slidy',
	        theme: ThemeData(primarySwatch: Colors.blue),
	        initialRoute: initialRoute,
	        builder: asuka.builder,
	      ).modular();
    }


# II - Dependências 

    commons_dependencies:
    	path: "../commons_dependencies"
    module_splash:
    	path: "../module_splash"
    module_login:
    	path: "../module_login"    
    module_home:
    	path: "../module_home"    

