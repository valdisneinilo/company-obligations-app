# Company Obligations App

Aplicativo Flutter para gerenciamento de obrigações contábeis de empresas, desenvolvido como parte de um teste técnico.

> **Status do projeto: implementação parcial.**
>
> O desenvolvimento foi encerrado ao término do prazo disponibilizado para o teste. A estrutura inicial da aplicação, a navegação e a integração com a API para consulta de obrigações foram implementadas. Algumas funcionalidades previstas ainda não foram desenvolvidas.

## Tecnologias utilizadas

- **Flutter:** desenvolvimento da aplicação.
- **Dart:** linguagem de programação.
- **Material UI:** componentes de interface.
- **GoRouter:** gerenciamento de rotas e navegação.
- **Riverpod:** gerenciamento de estado e injeção de dependências.
- **Dio:** comunicação HTTP com a API REST.

## Funcionalidades implementadas

### Estrutura e navegação

- Organização do projeto por funcionalidades (*feature-first*).
- Separação de responsabilidades em camadas `data`, `domain` e `presentation`.
- Configuração centralizada de rotas com GoRouter.
- Navegação compartilhada por meio de um menu lateral.
- Configuração global de tema.
- Criação de componente reutilizável para cabeçalho das páginas.

### Obrigações

- Consulta das obrigações cadastradas por meio da API.
- Integração HTTP utilizando Dio.
- Conversão das respostas JSON em entidades do domínio.
- Exibição das seguintes informações:
  - Título da obrigação.
  - Empresa.
  - Responsável.
  - Status.
  - Quantidade de anexos.
  - Data de criação.
- Apresentação dos estados de carregamento, erro e lista vazia.
- Opção para tentar novamente a consulta em caso de erro.

### Arquitetura da integração

A funcionalidade de obrigações utiliza a seguinte organização:

- **Entity:** representa a obrigação no domínio.
- **Model:** realiza a conversão dos dados recebidos da API.
- **DataSource:** executa as requisições HTTP.
- **Repository:** implementa o contrato de acesso aos dados.
- **UseCase:** encapsula a operação de consulta.
- **Provider:** disponibiliza as dependências e gerencia o estado assíncrono.


## Comunicação com a API

A comunicação com o backend é realizada por meio do Dio.

A URL base está centralizada em:

`lib/core/config/app_config.dart`

Para execução no emulador Android, a configuração atual utiliza:

```dart
static const String apiBaseUrl =
    'http://10.0.2.2:8080/api/v1';
```

O endereço `10.0.2.2` permite que o emulador Android acesse a máquina hospedeira.

Para outros ambientes de execução, o endereço deverá ser ajustado conforme a disponibilidade do backend.

A listagem de obrigações utiliza o endpoint:

```http
GET /api/v1/obligations?page=1&size=5
```

## Como executar

### Pré-requisitos

- Flutter SDK compatível com a versão definida no projeto.
- Dart SDK.
- Android Studio ou outro ambiente com dispositivo Flutter configurado.
- Backend disponível e acessível pela URL configurada na aplicação.

### Instalação

Clone o repositório:

```bash
git clone <URL_DO_REPOSITORIO>
```

Entre na pasta:

```bash
cd company-obligations-app
```

Instale as dependências:

```bash
flutter pub get
```

Execute a aplicação:

```bash
flutter run
```

Para verificar problemas de análise estática:

```bash
flutter analyze
```

## Funcionalidades pendentes

Em razão do encerramento do prazo do teste, as seguintes funcionalidades não foram implementadas:

- Listagem e gerenciamento de empresas.
- Cadastro e edição de empresas.
- Ativação e inativação de empresas.
- Listagem e gerenciamento de usuários responsáveis.
- Cadastro e edição de usuários.
- Ativação e inativação de usuários.
- Cadastro e edição de obrigações.
- Tela de detalhes da obrigação.
- Alteração de status das obrigações.
- Listagem e inclusão de metadados de anexos pela interface.
- Implementação de paginação e filtros na listagem.

**Observação:** o backend já disponibiliza operações adicionais, mas a integração dessas operações com o frontend não foi concluída.

## Considerações finais

O desenvolvimento priorizou a organização da estrutura do projeto, a componentização, a navegação e a integração inicial com a API.

Embora a aplicação ainda não contemple todo o escopo solicitado, a implementação realizada estabelece uma base para a continuidade do desenvolvimento, permitindo expandir as funcionalidades seguindo a arquitetura e os padrões já definidos.