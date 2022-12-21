- [Beleza App](#beleza-app)
  - [Arquitetura](#arquitetura)
    - [Clean Architecture](#clean-architecture)
  - [Gestão de estados](#gestão-de-estados)
  - [Injeção de dependência](#injeção-de-dependência)
  - [Gerenciamento de Rotas](#gerenciamento-de-rotas)
  - [Armazenamento local](#armazenamento-local)
  - [DeepLink / dynamicLinks](#deeplink--dynamiclinks)
  - [Design System](#design-system)
  - [Tratamento de erros](#tratamento-de-erros)
  - [Internacionalização](#internacionalização)
  - [Observabilidade](#observabilidade)
  - [Testes](#testes)
- [Observações](#observações)

# Beleza App
O Objetivo deste projeto é exemplificar algumas situações rotineiras em uma aplicação de grande porte na tentattiva de encontrar as melhores soluções e padrões utilizados no mercado com o intuito de melhorar a experiência do desenvolvedor, seja ele(a) Júnior, Pleno ou Sênior,

Neste sentido e no contexto de uma aplicação flutter para dispositivos móveis, podemos identificar alguns dos principais pontos de atenção que serão exemplificados neste projeto:

## Arquitetura
Para uma melhor organização do projeto ele será segmentado em pacotes (módulos), visando o mínimo de dependencia possível entre cada módulo.
A divisão se dará da seguinte forma:

|Nome do pacote | Descrição            |
|----------|---------------------------|
| beleza_app | Ponto de entrada da aplicação |
| core | Guarda a rota incial de todos os outros pacotes e também inicializa o Eventbus|
| splash | Exibe uma SplashPage ao iniciar o App |
| home | Login, Cadastro, Recuperação de senha |
| dashboard | Página inicial do app |
| package_manager | Gerenciamento de pacotes externos |
| event_bus | Comunicação entre os módulos |
| design_system | Widgets, Fontes, Cores e Ícones |
| shared | Informações compartilhadas entre os pacotes (sessão por exemplo) |
| profile | Informações relativas ao usuário logado |
| http | Abstração de pacotes para acesso a API'S (Dio, Uno, Http, etc.) |
| todos os outros | Pacotes que compoem seu app |

### Clean Architecture
- data
  - datasources
  - models
- infrastructure
  - datasources
  - repositories
- domain
  - entities
  - errors
  - usecases
  - repositories
- presentation
  - feature
    - bloc

## Gestão de estados
- Pacotes utilizados:
  - bloc
  - flutter_bloc

**Observação:**<br/>
Trabalhar com bloc de duas formas:

- Uma Classe para cada estado: [Exemplo](https://github.com/euclidesgc/beleza_app/blob/989cce295965f59b12ddc3f14c5e04305cc8b4bd/home/lib/src/login/presentation/login/bloc/login_state.dart) <br/>
- Uma Classe com uma propriedade Enum que denomina o estado: [Exemplo](https://github.com/euclidesgc/beleza_app/blob/989cce295965f59b12ddc3f14c5e04305cc8b4bd/home/lib/src/login/presentation/login/bloc/login_state.dart) <br/>
 
## Injeção de dependência
- Pacote utilizado:
  - flutter_modular

A injeção de dependencias que este pacote oferece nos permite segmentar toda aplicação por pacotes, agrupando e organizando essas dependências dentro do contexto ao qual elas pertecem, facilitando a compreensão e manutenção.

## Gerenciamento de Rotas
- Pacote utilizado:
  - flutter_modular

## Armazenamento local
- Pacote utilizado:
  - flutter_secure_storage

Armazenamento de dados local com segurança

## DeepLink / dynamicLinks
- Pacote utilizado:
  - firebase

## Design System
- Atomic Design

## Tratamento de erros
- Pacote utilizado:
  - dartz

Quando você pensa em erros, existem dois tipos possíveis deles:

1. Erros dos quais seu software pode se recuperar: <br/>
   **Ex: Uma senha inválida**
2. Erros dos quais seu software não pode se recuperar ou não faz sentido recuperar: <br />
   **Ex: Conversão de um valor nulo para inteiro**

Se não houver uma maneira de se recuperar de um erro a melhor forma de lidar com isso é maximizar a proprabilidade de um engenheiro lidar com isso para que a solução seja tomada da forma mais rápida.

No Dart, a maneira de sinalizar um erro para o chamador é lançando um `Exception` ou `Error`.

Agora observe a seguinte função:

````dart
Uri getUri(String url){
  if(url.isEmpty){
    throw ArgumentError('url não pode ser vazio!')
  }
  return Uri.parse(url);
}
````
> Como o chamador saberá que precisa lidar com erros lançados por sua função?

A função acima deverá converter uma URL em uma URI, porém caso a string passada não estiver no formato esperado, uma exeção será disparada.
Esta função tem um erro implícito.

Quando o erro é imlplícito, o desenvolvedor precisa consultar a documentação ou os comentários da função para verificar se a mesma pode retornar alguma exceção e se previnir quanto a isso. Nesse caso, é um risco de que o tratamento correto não seja realmente feito ocasionando um mal funcionamento do sistema. 

1. Se você puder se recuperar do erro, isso significa sinalizar para o chamador imediato (um ou dois níveis mais alto na cadeia) para que ele possa lidar com isso normalmente.
2. Se você não conseguir se recuperar do erro, em algum lugar central do seu programa, você registra o erro e aborta. Por exemplo, no Crashlytics do Firebase.

Existe uma forma de transformar erros implícitos em explícitos através do tipo de retorno `Either`. 

Ao seguir esse padrão, você garante que o usuário do seu método nunca perca o cenário de erro. Ele/Ela tem que tomar uma decisão sobre o que fazer com o erro. Tratar ou repassar para a camada superior que pode lidar com isso.

## Internacionalização
- Pacote utilizado:
  - intl

Existe um pluggin para vscode e android studio que ajuda na implementação dessas strings para internacionalização do app e a própria documentação desta extensão mostra como utilizá-la.

## Observabilidade
- Crashlitics
- Analytics
- Tagueamento

## Testes
- Testes unitários
- Testes de widget
- Golden Test

# Observações
Ainda será preciso verificar a situação deste app trabalhar com vários flavors simultaneamente, e neste caso em duas situações:

1. Um main.dart para cada flavor
2. Um único main.dart porém com marcas segmentadas internamente no app/

- E ainda, como lídar com cache das informações? [Cache strategy](https://medium.com/@romaingreaume/implementing-a-cache-strategy-in-your-flutter-app-5db3e316e7c9)
- [Toast Messages](https://itnext.io/create-your-own-toast-without-using-any-packages-6d3828816f7c)
