class Pessoa {
  String nome; // se colocar "?" antes da variavel, quer dizer que é um valor nulo -> String ? nome
  int idade; // caso incluir final antes do int, declara que após atribuir o valor na variavel, nunca mais ela podera ser mudada -> final int idade
  late DateTime nasc; // quando instanciar a classe não é preciso preencher
  
  Pessoa(this.nome, this.idade, [this.nasc = DateTime(2002)]);
  //Pessoa(this.nome, this.idade, this.nasc); // instanciando a classe (construtor) obrigatório incluir todos as variaveis aqui dentro

  // caso deseje instanciar a data de nascimento
  Pessoa.semNasc(this.nome, this.idade){
    this.nasc = DateTime(2003);
  }

  void apresentar() {
    print("Nome: ${this.nome}, Idade: ${this.idade}, Data de Nascimento: ${this.nasc}");
  }
}

int main() {
  Pessoa p = Pessoa ("Iago", 21, DateTime(1994)); // em dart não é necessário usar new
  p.apresentar();
  return 0;
}
