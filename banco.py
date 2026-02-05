import json
import os
from datetime import datetime

class Usuario:
    def __init__(self, nome, senha):
        self.nome = nome
        self.senha = senha
        self.data_criacao = datetime.now().strftime("%d/%m/%Y %H:%M:%S")
    
    def to_dict(self):
        return {
            "nome": self.nome,
            "senha": self.senha,
            "data_criacao": self.data_criacao
        }

class BancoDados:
    def __init__(self, arquivo="usuarios.json"):
        self.arquivo = arquivo
        self.usuarios = self._carregar()
    
    def _carregar(self):
        if os.path.exists(self.arquivo):
            with open(self.arquivo, "r", encoding="utf-8") as f:
                return json.load(f)
        return {}
    
    def _salvar(self):
        with open(self.arquivo, "w", encoding="utf-8") as f:
            json.dump(self.usuarios, f, ensure_ascii=False, indent=2)
    
    def cadastrar(self, nome, senha):
        if nome in self.usuarios:
            return False, "Usuário já existe"
        
        usuario = Usuario(nome, senha)
        self.usuarios[nome] = usuario.to_dict()
        self._salvar()
        return True, "Usuário cadastrado com sucesso"
    
    def excluir(self, nome):
        if nome not in self.usuarios:
            return False, "Usuário não encontrado"
        
        del self.usuarios[nome]
        self._salvar()
        return True, "Usuário excluído com sucesso"
    
    def listar(self):
        return self.usuarios

class Painel:
    def __init__(self):
        self.db = BancoDados()
    
    def exibir_menu(self):
        print("\n" + "="*40)
        print("PAINEL DE CONTROLE - BANCO DE DADOS")
        print("="*40)
        print("1. Cadastrar usuário")
        print("2. Excluir usuário")
        print("3. Listar usuários")
        print("4. Sair")
        print("="*40)
    
    def executar(self):
        while True:
            self.exibir_menu()
            opcao = input("Escolha uma opção: ").strip()
            
            if opcao == "1":
                self._cadastrar()
            elif opcao == "2":
                self._excluir()
            elif opcao == "3":
                self._listar()
            elif opcao == "4":
                print("Saindo...")
                break
            else:
                print("Opção inválida!")
    
    def _cadastrar(self):
        nome = input("Nome do usuário: ").strip()
        if not nome:
            print("Nome não pode ser vazio!")
            return
        
        senha = input("Senha: ").strip()
        if not senha:
            print("Senha não pode ser vazia!")
            return
        
        sucesso, mensagem = self.db.cadastrar(nome, senha)
        print(mensagem)
    
    def _excluir(self):
        nome = input("Nome do usuário a excluir: ").strip()
        sucesso, mensagem = self.db.excluir(nome)
        print(mensagem)
    
    def _listar(self):
        usuarios = self.db.listar()
        if not usuarios:
            print("Nenhum usuário cadastrado")
            return
        
        print("\n--- USUÁRIOS CADASTRADOS ---")
        for nome, dados in usuarios.items():
            print(f"Nome: {nome} | Criado em: {dados['data_criacao']}")

if __name__ == "__main__":
    painel = Painel()
    painel.executar()