- [Beleza App](#beleza-app)
  - [Arquitetura](#arquitetura)
    - [Clean Architecture](#clean-architecture)
  - [Gestão de estados](#gestão-de-estados)
  - [Injeção de dependência](#injeção-de-dependência)
  - [Gerenciamento de Rotas](#gerenciamento-de-rotas)
  - [Design System](#design-system)
  - [Tratamento de erros](#tratamento-de-erros)
  - [Internacionalização](#internacionalização)
  - [Observabilidade](#observabilidade)
  - [Testes](#testes)

# Beleza App

O Objetivo deste projeto é exemplificar algumas situações rotineiras em uma aplicação de grande porte na tentattiva de encontrar as melhores soluções e padrões utilizados no mercado com o intuito de melhorar a experiência do desenvolvedor, seja ele(a) Júnior, Pleno ou Sênior,

Neste sentido e no contexto de uma aplicação flutter para dispositivos móveis, podemos identificar alguns dos principais pontos de atenção que serão exemplificados neste projeto:



## Arquitetura
Para uma melhor organização do projeto ele será segmentado em pacotes (módulos), visando o mínimo de dependencia possível entre cada módulo.
A divisão se dará da seguinte forma:

|Nome do pacote | Descrição            |
|----------|---------------------------|
| beleza_app | Ponto de entrada da aplicação |
| core | Guarda a rota incial de tos os os outros pacotes e também inicializa o Eventbus|
| col 3 is | right-aligned             |



### Clean Architecture

- data
- - datasources
- - models
- infrastructure
- - datasources
- - repositories
- domain
- - entities
- - errors
- - usecases
- - repositories
- presentation
- - feature
- - - bloc

## Gestão de estados

- Pacotes utilizados:
- - bloc
- - flutter_bloc

**Observação:**<br/>
Trabalhar com bloc de duas formas:
- Uma Classe para cada estado: [Exemplo](../home/lib/src/login/presentation/login/bloc/login_state.dart) <br/>
- Uma Classe com uma propriedade Enum que denomina o estado: [Exemplo](../home/lib/src/login/presentation/login/bloc/login_state.dart) <br/>
 
## Injeção de dependência
- Pacote utilizado:
- - flutter_modular
## Gerenciamento de Rotas
- Pacote utilizado:
- - flutter_modular
## Design System

## Tratamento de erros
- Pacote utilizado:
- - dartz
## Internacionalização
- Pacote utilizado:
- - flutter_modular
- 
## Observabilidade
- Crashlitics
- Analytics
- Tagueamento
## Testes

> Gestão de rotas mais sucinta e descentralizada
> EventBus (Pubsub)
> Analytics
> CrashLytics
> Tagueamento

> Alertas, Modais e Toast messages

> HttpClient abstraído e centralizado
> Tratamento de erros <- Either

> Design System (Atomic Design) 

> Testes 

> Multi Brands (flavors) Theme Extension, prevendo unificação das marcas no app. <<

> Monorepo 
> Cache (cache de imagens, cache de dados)
