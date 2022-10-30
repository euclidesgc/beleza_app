# Beleza App

O Objetivo deste projeto é exemplificar algumas situações rotineiras em uma aplicação de grande porte na tentattiva de encontrar as melhores soluções e padrões utilizados no mercado com o intuito de melhorar a experiência do desenvolvedor, seja ele(a) Júnior, Pleno ou Sênior,

Neste sentido e no contexto de uma aplicação flutter para dispositivos móveis, podemos identificar alguns dos principais pontos de atenção:

- [Arquitetura](#arquitetura)
- [Gestão de Estado](#gestão-de-estados)
- Injeção de dependência
- Gerenciamento de Rotas
- Design System
- Tratamento de erros
- Internacionalização
- Observabilidade
- Testes


# [Star Formation Theory][sft]
[Reference to this section](#sft)

## <a name="arquitetura"></a>Arquitetura

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
