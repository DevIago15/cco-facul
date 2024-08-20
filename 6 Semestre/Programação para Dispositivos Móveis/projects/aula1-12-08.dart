void main(){
  int idade = 29;
  print(idade);
  
  double raio = 10.25;
  
  String nome = "Iago";
  print("Ola $nome, seja bem vindo!");
  
  bool ligado = true;
  
  var qualquer = 1;

  List L1 = [10, 20, 22,"IAGO"];
  L1[0] = 20;

  List<double> L21 = [1.5, 2.10];

  Map<String, String> Usuario = {"Iago" : "123", "Matheus" : "456"}; // declarando dicionario de dados 
  print("Senha: ${Usuario["Iago"]}");

  double media = 7;

  var mensagem = media >= 7 ? "Aprovado" : "Reprovado"; // if e else encadeado no dart
  print(mensagem);
  
}