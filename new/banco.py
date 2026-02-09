from flask import Flask, request, jsonify
import sqlite3 

app = Flask(__name__)

def conectar():
    return sqlite3.connect('meubanco.db')

def criar_tabela():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute('''CREATE TABLE IF NOT EXISTS produtos 
                      (id INTEGER PRIMARY KEY AUTOINCREMENT, nome TEXT, preco REAL)''')
    conn.commit()
    conn.close()

class Produto:
    def __init__(self, id, nome, preco):
        self.id = id
        self.nome = nome
        self.preco = preco 

@app.route('/cadastrar')
def cadastrar_exemplo():
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("INSERT INTO produtos (nome, preco) VALUES (?, ?)", ("Alexandre - PS5", 3800.00))
    novo_id = cursor.lastrowid
    conn.commit()
    conn.close()
    return jsonify({"mensagem": "Cadastrado!", "id": novo_id})

@app.route('/produto/<int:id_prod>')
def get_produto(id_prod):
    conn = conectar()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM produtos WHERE id = ?", (id_prod,))
    dados = cursor.fetchone()
    conn.close()

    if dados:
        obj_produto = Produto(dados[0], dados[1], dados[2])
        return jsonify(obj_produto.__dict__)
    
    return jsonify({"erro": "Não encontrado"}), 404
    
if __name__ == '__main__':
    criar_tabela()
    app.run(port=5000, debug=True)