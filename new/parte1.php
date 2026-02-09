<?php
// O PHP não importa o arquivo .py, ele apenas "chama" a porta 5000
$id_usuario = 2; 

// Verifica se o id no Python é o mesmo 
$url = "http://localhost:5000/produto/" . $id_usuario;

if ($id_usuario == null) {
    echo "<p>ID não informado</p>";
    exit;
} else {
    // Tenta buscar os dados Python
    $response = @file_get_contents($url);

if ($response === FALSE) {

    $status_line = $http_response_header[0];
    echo "<p>Erro na API: " . $status_line . "</p>";
    echo "<p>Dica: Você já acessou 'http://localhost:5000/cadastrar' ?</p>";
    exit;
}

    $produto = json_decode($response);

    if (isset($produto->nome)) {
        echo "<h1>O objeto vindo do Python é:</h1>";
        echo "<div class='id-produto'  id='fazer'>";
        
        echo "<p><strong>Nome:</strong> " . $produto->nome . "</p>";
        echo "<p><strong>ID:</strong> " . $produto->id . "</p>";
        echo "<p><strong>Preço:</strong> R$ " . number_format($produto->preco, 2, ',', '.') . "</p>";
        
        echo "</div>";
    } else {
        echo "<p>Nenhum produto encontrado para o ID: " . $id_usuario . "</p>";
    }
}
?>

<html>
      <head>
            <style>
                    body {
                            font-family: Arial, sans-serif;
                            margin: 20px;
                            background-color: #000000;
                    }
                    h1 {
                            color: #333;
                            text-align: center;
                    }
                    p {
                            font-size: 1.3rem;
                            color: #555;
                            text-align: justify;
                            margin-top: 10px;
                            padding-top: 15px;
                            padding-left: 63.75px;
                    }

                    .id-produto {
                        background-color: blue;
                        margin-left: 300px;
                        margin-right: 300px;
                        height: 200px;
                        border-radius: 20px;
                        border: solid 3px gold;
                        cursor: pointer;
                        transition: all 0.75s ease;
                    }

                    .id-produto:hover {
                        background-color: #0000FF;
                        transform: scale(1.05);
                        box-shadow: 0 0 15px gold;
                    }
            </style>
      </head>


      <body>

            <div id="mensagem"></div>
            <script src="daora.js"></script>
      </body>
</html>