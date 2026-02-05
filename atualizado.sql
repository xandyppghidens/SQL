-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/10/2025 às 03:30
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cad2`
--

CREATE TABLE `cad2` (
  `id` int(10) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `telefone` varchar(300) DEFAULT NULL,
  `voos` varchar(400) DEFAULT NULL,
  `acentos` varchar(300) DEFAULT NULL,
  `classe` varchar(400) DEFAULT NULL,
  `valor` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cad2`
--

INSERT INTO `cad2` (`id`, `nome`, `telefone`, `voos`, `acentos`, `classe`, `valor`) VALUES
(4, 'Alexandre Vilela de Oliveira Junior ', '(34) 998086690', '323121', '42', 'Executiva', 'R$ 1900,00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `codigo` int(10) NOT NULL,
  `localizacao` varchar(500) DEFAULT NULL,
  `bairro` varchar(500) DEFAULT NULL,
  `descricao` varchar(500) DEFAULT NULL,
  `situacao` varchar(500) DEFAULT NULL,
  `valor` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cadastro`
--

INSERT INTO `cadastro` (`codigo`, `localizacao`, `bairro`, `descricao`, `situacao`, `valor`) VALUES
(30, '15:30', 'Estados Unidos', '14/12/2025', 'Disponivel', 'R$ 1300,00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadcli`
--

CREATE TABLE `cadcli` (
  `id` int(10) NOT NULL,
  `cpf` varchar(300) DEFAULT NULL,
  `nome` varchar(400) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `telefone` varchar(300) DEFAULT NULL,
  `status` varchar(400) DEFAULT NULL,
  `imovel` varchar(200) DEFAULT NULL,
  `idj` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cadcli`
--

INSERT INTO `cadcli` (`id`, `cpf`, `nome`, `endereco`, `telefone`, `status`, `imovel`, `idj`) VALUES
(7, '332.079.108-74', 'Alexandre Oliveira', 'Argentina', '(34) 998086690', 'Pago', '18:30', '12');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fotoscad`
--

CREATE TABLE `fotoscad` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) DEFAULT NULL,
  `local` varchar(255) DEFAULT NULL,
  `data_viagem` date DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `arquivo` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fotoscad`
--

INSERT INTO `fotoscad` (`id`, `titulo`, `local`, `data_viagem`, `descricao`, `tags`, `arquivo`) VALUES
(1, 'País', 'Estados unidos ', '2025-10-15', 'asasas', 'asasasassa', '1761266955_1.jpg'),
(2, 'País', 'Estados unidos ', '2025-10-15', 'asasas', 'asasasassa', '1761266982_1.jpg'),
(3, 'País', 'Estados unidos ', '2025-10-15', 'asasas', 'asasasassa', '1761267016_1.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem`
--

CREATE TABLE `imagem` (
  `id` int(10) NOT NULL,
  `foto` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `imagem`
--

INSERT INTO `imagem` (`id`, `foto`) VALUES
(1, 'f2.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `imagem2`
--

CREATE TABLE `imagem2` (
  `id` int(10) NOT NULL,
  `imagem2` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `imagem2`
--

INSERT INTO `imagem2` (`id`, `imagem2`) VALUES
(1, '4_1761001212.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `informa`
--

CREATE TABLE `informa` (
  `id` int(10) NOT NULL,
  `nome` varchar(500) DEFAULT NULL,
  `email` varchar(400) DEFAULT NULL,
  `assunto` varchar(600) DEFAULT NULL,
  `mensagem` varchar(7000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `informa`
--

INSERT INTO `informa` (`id`, `nome`, `email`, `assunto`, `mensagem`) VALUES
(4, 'Alexandre Vilela de Oliveira Junior', 'alexandresinho1212@gmail.com', 'erro', 'Não consegui agendar minha viagem , o que eu faço ?'),
(5, 'Jão', 'sla@gmail.com', 'erro', 'Não consegui efetuar o pagamento');

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `id` int(10) NOT NULL,
  `usuario` varchar(300) DEFAULT NULL,
  `senha` varchar(400) DEFAULT NULL,
  `nivel` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`id`, `usuario`, `senha`, `nivel`) VALUES
(2, 'luqi', '$2y$10$fC8PJf0/iHmhk4wmujfjKOEmePwc4Q4p/bhFeDnTjGj.v9hqPOU8K', 'Adm'),
(4, 'ali', '$2y$10$gJ7cr95mo31HpfW3sW0gvO7bLM.EVysNSle1K1pN7jmut1mUsu3SK', 'Adm'),
(5, 'brabo', '$2y$10$rDLAdhtFdppViPHf9eAkpe4/WF4IewdcTnIePm8.Bd5oSy9azg/nW', 'Adm'),
(6, 'ali', '$2y$10$vvACmh.2RUGU3zJoevjW6uGIaMV1O3WqzvgZHyLmwrpk.A2rrEnIO', 'Adm'),
(7, 'Marcilio', '$2y$10$ncWEOQHoKlJr25AR80Tba.ayFymDvWQm19IlvMADaJ/Pa24fDwcmi', 'Adm'),
(8, 'klayver', '$2y$10$lrWaU.lZT.PAFzB6K7vFYO7/hlSXtQFxFlUpmV5sPT9B4xeRVd4lC', 'Adm'),
(12, 'marcio', '$2y$10$tcHoVhggpyrIKKCjW5fnzefjLe/SpiF2mbnI6ElRytF/Ez./D0RM.', 'Adm'),
(13, 'k1', '$2y$10$/EBZfkhlRNp/aE9vC8g6VuD4bLkXYwmqnvWxaXp53a3fgpX/h/IUu', 'Adm'),
(14, 'xandy', '$2y$10$EAdlsxSEWG1FPLMMBQQouO91Uw/fUMIHk85ExSTMfMQ9Vl1g7cx4m', 'Adm'),
(15, 'li', '$2y$10$iJJT2BZ7d5rk7qcf9fbbqOozL2YQq/vsO0Esm/5/nMZg4jkdrHdQy', 'Adm');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cad2`
--
ALTER TABLE `cad2`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD PRIMARY KEY (`codigo`);

--
-- Índices de tabela `cadcli`
--
ALTER TABLE `cadcli`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `fotoscad`
--
ALTER TABLE `fotoscad`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `imagem2`
--
ALTER TABLE `imagem2`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `informa`
--
ALTER TABLE `informa`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cad2`
--
ALTER TABLE `cad2`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cadastro`
--
ALTER TABLE `cadastro`
  MODIFY `codigo` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de tabela `cadcli`
--
ALTER TABLE `cadcli`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `fotoscad`
--
ALTER TABLE `fotoscad`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `imagem2`
--
ALTER TABLE `imagem2`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `informa`
--
ALTER TABLE `informa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
