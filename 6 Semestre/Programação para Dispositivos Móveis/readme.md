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