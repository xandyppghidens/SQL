import java.awt.HeadlessException;
import java.sql.*;
import javax.swing.JOptionPane;

public class Banco {
    public static void main(String[] args) {
        String url = "jdbc:sqlite:menu_banco.db";

        try {
            // Criar tabela inicial
            try (Connection conexao = DriverManager.getConnection(url)) {
                // Criar tabela inicial
                String sqlTabela = "CREATE TABLE IF NOT EXISTS usuarios (" +
                        "id INTEGER PRIMARY KEY AUTOINCREMENT," +
                        "nome TEXT NOT NULL, telefone TEXT NOT NULL, data TEXT NOT NULL);";
                conexao.createStatement().execute(sqlTabela);
                
                boolean continuar = true;
                
                while (continuar) {
                    // Menu de Opções
                    String menu = """
                                                  === SISTEMA DE CADASTRO ===
                                                  1. Cadastrar Usu\u00e1rio
                                                  2. Listar Usu\u00e1rios
                                                  3. Excluir Usu\u00e1rio (por ID)
                                                  4. Sair
                                                                       Escolha uma op\u00e7\u00e3o:""";
                    
                    String opcao = JOptionPane.showInputDialog(null, menu);
                    
                    if (opcao == null || opcao.equals("4")) {
                        break;
                    }
                    
                    switch (opcao) {
                        case "1" -> // CADASTRAR
                            cadastrarUsuario(conexao);
                        case "2" -> // LISTAR
                            listarUsuarios(conexao);
                        case "3" -> // EXCLUIR
                            excluirUsuario(conexao);
                        default -> JOptionPane.showMessageDialog(null, "Opção inválida!");
                    }
                }
            }

        } catch (HeadlessException | SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro: " + e.getMessage());
        }
    }

    // --- MÉTODOS AUXILIARES ---

    private static void cadastrarUsuario(Connection conexao) throws SQLException {
        String nome = JOptionPane.showInputDialog("Nome:");
        String tel = JOptionPane.showInputDialog("Telefone:");
        String data = JOptionPane.showInputDialog("Data (DD/MM/AAAA):");

        if (nome != null && tel != null && data != null) {
            String sql = "INSERT INTO usuarios (nome, telefone, data) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setString(1, nome);
            pstmt.setString(2, tel);
            pstmt.setString(3, data);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(null, "Usuário cadastrado!");
        }
    }

    private static void listarUsuarios(Connection conexao) throws SQLException {
        ResultSet rs = conexao.createStatement().executeQuery("SELECT * FROM usuarios");
        StringBuilder lista = new StringBuilder("=== HISTÓRICO ===\n");
        while (rs.next()) {
            lista.append(rs.getInt("id")).append(" - ")
                 .append(rs.getString("nome")).append(" | ")
                 .append(rs.getString("telefone")).append("\n");
        }
        JOptionPane.showMessageDialog(null, lista.length() > 20 ? lista : "Nenhum registro encontrado.");
    }

    private static void excluirUsuario(Connection conexao) throws SQLException {
        String idStr = JOptionPane.showInputDialog("Digite o ID do usuário que deseja excluir:");
        if (idStr != null) {
            String sql = "DELETE FROM usuarios WHERE id = ?";
            PreparedStatement pstmt = conexao.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(idStr));
            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                JOptionPane.showMessageDialog(null, "Usuário removido com sucesso!");
            } else {
                JOptionPane.showMessageDialog(null, "ID não encontrado.");
            }
        }
    }
}