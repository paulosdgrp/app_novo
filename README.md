# Gateway I-SENSI App

---

<div style="display: flex; justify-content: center; align-items: center">
<img src="assets/images/logo.png" alt="Logo" height="100">
</div>

---

O Gateway I-Sensi App é uma solução para dispositivos móveis, disponível para sistemas operacionais Android e iOS,
destinada à configuração e gerenciamento de dispositivos em uma plataforma IoT.

---

## Descrição

O Gateway I-Sensi App oferece uma interface amigável e intuitiva para configuração e gerenciamento de dispositivos em
plataformas IoT, disponível para Android e iOS.

## Funcionalidades Principais:

- **Conexões e Integrações:** Suporta Wi-Fi, Bluetooth, integração com Tago e Thingsboard e comunicação com ESP32 via
  HTTP.
- **Gestão de Dispositivos:** Visualização, criação, edição e gerenciamento de grupos e dispositivos.
- **Configuração Avançada:** Assistente de configuração, escaneamento de redes Wi-Fi, seleção de modo de conexão,
  rastreamento por GPS e configuração manual de IP.
- **Beacons:** Gestão e escaneamento de QR Codes para beacons.

---

**Nota:** Atualmente, este aplicativo foi construído apenas no frontend.

---

## Arquitetura do projeto:

- **constants:** Armazena constantes globais, como cores e imagens.

- **models:** Define a estrutura dos objetos utilizados.

- **shared:** Widgets reutilizáveis por toda a aplicação.

- **views:** Páginas do aplicativo com seus componentes individuais.

## Status do Desenvolvimento

- **Finalizadas (frontend)**
- [x] Splash
- [x] Login
- [x] Home
- [x] Cadastro de grupos
- [x] Dispositivos

- **Em Andamento:**
- [ ] Assistente de configuração de novo dispositivo

- **Pendente:**
- [ ] Dispositivos (Outras funções)
- [ ] Novo beacon

---

## Todo:

- [ ] Criar tema padrão do app utilizando ThemeContext do Flutter.
- [ ] Aplicar o tema às páginas existentes

---

## Instalação

### Instalando o Chocolatey

O Chocolatey é um gerenciador de pacotes para Windows. Para instalá-lo

1. Abra o PowerShell como administrador.
2. Copie e cole o seguinte comando e pressione Enter:

```sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

3. Espere a instalação concluir e feche o PowerShell.

### Instalando o Android Studio (chocolatey)

1. Abra o PowerShell como administrador.
2. Copie e cole o seguinte comando e pressione Enter:

```sh
choco install androidstudio
```

3. Espere a instalação concluir e feche o PowerShell.
4. O Chocolatey instalará o Android Studio e configurará as variáveis de ambiente necessárias.

### Instalando o Flutter (chocolatey)

**Se você ainda não possui o Flutter instalado:**

No CMD ou PowerShell (como administrador), execute:

```sh
choco install flutter --version=3.13.0
```

**Se você já possui o Flutter instalado:**

No CMD ou PowerShell (como administrador), execute:

```sh
flutter upgrade
```

---

## Criar sua própria Página no Flutter

### 1. Estrutura de Pastas

**views/:** Aqui é onde você colocará todas as suas páginas principais.
**views/widgets/:** Esta pasta conterá todos os widgets que são específicos da sua página.

### 2. Criando a Página

1. Na pasta views, crie um novo diretório com o nome da sua página (por exemplo, **login**).
2. Para widgets individuais que são específicos da sua página, crie-os dentro da pasta views/login/widgets/ (adapte o
   nome de acordo com a sua página).

### 3. Defina o Stateful Widget

A maioria das páginas que têm estados mutáveis utilizam o StatefulWidget:

```dart
class NomeDaSuaPagina extends StatefulWidget {
  static const routeName = '/nomeDaRota';

  const NomeDaSuaPagina({Key? key}) : super(key: key);

  @override
  State<NomeDaSuaPagina> createState() => _NomeDaSuaPaginaState();
}
```

### 4. Implemente o Estado do Widget

Nesta classe, você definirá a lógica e a UI da página:

```dart
class _NomeDaSuaPaginaState extends State<NomeDaSuaPagina> {

  @override
  void initState() {
    super.initState();
    // Inicializações, se necessárias.
  }

  // Declare variáveis, controladores, etc.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Estrutura da página, como AppBar, Body, etc.
    );
  }
}
```

### 5. Construa a Estrutura da Página

Dentro da função build, adicione os principais componentes da página, como AppBar, Body, BottomNavigationBar etc:

```dart
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text("Título da Página")),
      body: // Conteúdo principal da página aqui,
// Outros componentes, se necessário.
  );
}
```

### 6. Adicionando a Rota

Após criar sua página e seus widgets, é hora de adicionar a rota no arquivo main.dart para que a página possa ser
acessada através da navegação:

1. No **main.dart**, importe o arquivo da sua página:

```dart
import 'views/nomeDaSuaPagina/nomeDaSuaPagina.dart';
```

2. Adicione a rota no widget **MainApp**:

```dart
Widget build(BuildContext context) {
  return MaterialApp(
    initialRoute: NomeDaSuaPagina.routeName,
    routes: {
      Login.routeName: (context) => const Login(),
      // ... outras rotas
      NomeDaSuaPagina.routeName: (context) => const NomeDaSuaPagina(),
    },
    builder: (context, child) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: AppColors.PrimaryDark.withOpacity(0.92),
              statusBarIconBrightness: Brightness.light,
              statusBarBrightness: Brightness.dark
          )
      );
      return SafeArea(child: child!);
    },
  );
}
```
