# Programação para Dispositivos Móveis
XXXXXXX
Disciplinada por Rafael Rubiati Scalvenzi.
  
## Vamos Começar 🚀  
## 06/08/2024 - Início
**Flutter:** Desenvolvimento de aplicativos multiplataforma(Windows, IOS, Android, Web,
Linux e MacOS (Cross-platform)
 - Única base de código
 - Dart como linguagem de programação
 - Iniciado em 2014, estreia em 2017
 - 2018 -> versão 1.0
 - Criado e mantido pela Google
 - Plugins para acesso a recursos nativos do mobile
 - Aparência nativa
 - Renderização através da Engine **SKIA**, que área uma árvore de widgets
  
**Flutter x Dart**
- Flutter: Framework
- Dart: Linguagem oferece recursos como hot load e hot start

Dart -> Compilações JIT (JEST IN TIME) e AOT (AHEAD-OF-TIME)

**Arquitetura do Flutter** 
- Flutter Engine (SKIA): Renderização
- Framework Flutter: Camada de abstração de alto nível (bibliotecas, apis e ferramentas)
- Widgets: Blocos de construção fundamentais do aplicativo. A interface de usuário é contruída a partir de widgets compostos hierarquiamente.

**Dart:** Criada em 2011 pela necessidade de unir front-end, aplicações móveis e o lado servidor. Multiplataforma.
- Maior segurança em termos de erro de desenvolvimento (complicada, type-safe)
- Pouco tempo de mercado
- Sem diversidade de frameworks
- Alta velocidade

Dart inclui uma VM Dart com compilações JIT e AOT para produzir código de máquina para as plataformas nativa.
- Para Web, traduz DART para JavaScript
- Sintaxe C-Like
- Orientada a objetos
- Fortemente tipida, com interferência de tipos
Tipos são sempre objetos, os mais básicos:
- Number (subtipos int, double, num)
- String
- Boolean (bool)
- Dynamic
- Function
- Hist
- Map

## 12/08/2024
Aula totalmente prática, pode ser encontrada em ```/projects```

## 26/08/2024
Ciclo de Vida
No flutter, tudo é widget, ou seja, todos os elementos utilizados para a contenção de UI são widgets. Uma caixa de texto, botão, tela, it são widgets, ligados entre si através de uma árvore. O comportamento de um widget sempre será o mesmo,  desenhar algo na tela.
    - O sistema base dos widgets se dividem em duas classes:
        - Stateless: sem estado
        - Stateful: com estado

Por definição, um widget sem estado não pode se redesenhar, mas pode ser atualizado. Um widget com estado, pode se redesenhar ou seja, tem controle sobre UI. Ele cria um objeto State, onde seu estado é guardado. O método setState() notifica que um estado foi alterado, e assim reconstruir o widget com valoers atualizados.
~~~dart
class MeuApp extends StateLessWidget {
        @override
        Widget build(BuildContext context){
            return Text('Home');
        }
    }


    class MyButton extends StateFullWidget{
        @override
        MyButtonState createState() => MyButtonState();
    }

    class MyButtonState extends State <MyButton>{
        void AlgumaCoisa(){
            setState();
        }
    }

    Widget build (BuildContext context){
        return Text('blabla');
    }
~~~
![arvore](arvore.png)

## 16/09/2024 - Resumão
- Dart: linguagem de programação, fortemente tipada. Pode ser compilada em JIT(just in time => compila a aplicação por partes) ou OAT(compila a aplicação inteira).
    - Todos os tipos são objetos. Os tipos básicos (build-types):
        - Number (int, double e num)
        - String
        - Boolean (bool)
        - Dynamic
        - Function, List[] e Map{}

- Flutter: Framework de desenvolvimento multiplataforma
- Widgets: blocos de construção com estado: blocos de construção com estado. (Estado: informação alterada em tempo de execução.)
- Stateful: altera o estado de um componente
    - setState: método que altera o estado e chama o método build para reconstruir o widget com valores atualizados.
    - State: onde o estado e guardado
- Stateless: o estado mostra o mesmo valor em todo o ciclo de vida. O método *build* é chamado "apenas 1x".
- Widgets de Interface: Text, TextField, Iconbutter, image
- Widgets de Layout: Row, Column, Center, Sizebox, Container, Scaffold
~~~dart
class _Carro // _ é private (somente a mesma pasta acessa)
{
    String cor;
    int doc;
    Carro(this.cor, this.doc); // construtor
    Carro.Outro(this.cor);
}
~~~

## 30/09/2024 - Novo projeto
1 - Adicionar pasta images e uma imagem na pasata (logo.png). Será um ícone então escolha uma imagem "pequena".
2 - Fazer a modificação pubsec.yam para registrar a imagem.
3 - Criar pastas
    - models
    - screens
    - widgets
Na pasta models, adicionar
    - notes.dart
Nesse arquivo:
~~~dart
class Notes {
    final String titulo;
    final String descricao;
    Note ({required this.titulo, required this.descricao});
}
~~~