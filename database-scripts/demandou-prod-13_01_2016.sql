-- phpMyAdmin SQL Dump
-- version 4.0.4.1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 13-Jan-2016 às 06:29
-- Versão do servidor: 5.5.31
-- versão do PHP: 5.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `demandou-prod`
--
CREATE DATABASE IF NOT EXISTS `demandou-prod` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `demandou-prod`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ci_sessions_timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('003ca2b07bd0a9db405fd4525b10a5ffc1d9ef08', '::1', 1452657591, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635373431333b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('0acd734bfd138da98e22677137db8a07303235ca', '::1', 1452560402, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323536303330333b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('0cca8356bae3d59c150ecdab6e9feb125d8ead37', '::1', 1452656633, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635363632383b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('1c40cf9aa88f3ee5ada3fd24a1ba6adb3ed265e0', '::1', 1452641549, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323634303539343b636f6469676f5f7573756172696f7c733a313a2234223b6c6f67696e7c733a343a2269676f72223b6e6f6d657c733a343a2249676f72223b736f6272656e6f6d657c733a333a22436861223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31353a2269676f722d6176617461722e6a7067223b6c6f6761646f7c623a313b),
('1d1cf809c4d81e4bb7a179bfd87744cb37556af2', '::1', 1452631157, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323633313134333b6c6f6761646f7c623a313b636f6469676f5f7573756172696f7c733a313a2238223b6c6f67696e7c733a343a2276696e69223b6e6f6d657c733a383a2256696e6963697573223b736f6272656e6f6d657c733a383a224d6f6e746569726f223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31323a2276696e69636975732e6a7067223b),
('1e7626e40bded3ec52a4279538c4ae8f3bbe0bf3', '::1', 1452632068, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323633313636333b6c6f6761646f7c623a313b636f6469676f5f7573756172696f7c733a313a2238223b6c6f67696e7c733a343a2276696e69223b6e6f6d657c733a383a2256696e6963697573223b736f6272656e6f6d657c733a383a224d6f6e746569726f223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31323a2276696e69636975732e6a7067223b),
('1f9d10518b3011a7d67088941c276fde693b7a2e', '::1', 1452628260, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323632383232303b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('24630775f07f5c38fb4ac6351de42ecfb2c570ca', '::1', 1452647207, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323634363931383b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('253d645fbb8282300853ac9911d2f492490bcebf', '::1', 1452655474, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635353437313b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('2df9a9c8f4137126c766e4d14163ab62feea77f0', '::1', 1452605935, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323630353834353b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('3af16b51bfee3ef63b42bfb62941b2c731369e35', '::1', 1452657172, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635363939343b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('407810d8b548b27536827f2358bbbbfc19fd462a', '::1', 1452660216, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323636303031363b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('44055f2cbd565daff09c70f82258742b739867b2', '::1', 1452652027, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635313832353b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('4d69c7e328419e2c6ecf16920e7f41ec424e083a', '::1', 1452561175, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323536303930393b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('4e95acb873d20636fd22f13695ec5c651b74eb78', '::1', 1452651268, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635313038323b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('4f61aa95bd3ace86a4f2a7358b472d8d4ba83740', '::1', 1452653368, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635333038333b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('50197ff6f813aeb99eaab489b822c5568e33e91f', '::1', 1452661609, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323636313337303b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('56a4a5eea10759f9911853e7e313e625456ab758', '::1', 1452649415, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323634393430383b636f6469676f5f7573756172696f7c733a313a2237223b6c6f67696e7c733a343a226a6f616f223b6e6f6d657c733a353a224a6fc3a36f223b736f6272656e6f6d657c733a353a224c656d6f73223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a383a226a6f616f2e6a7067223b6c6f6761646f7c623a313b),
('56b5646d97351b8c6c56d99a745082306ca6f276', '::1', 1452654944, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635343636373b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('59254e777a89e1ba0d8c447cf0f7795a1a10a12d', '::1', 1452562215, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323536323031333b636f6469676f5f7573756172696f7c733a313a2234223b6c6f67696e7c733a343a2269676f72223b6e6f6d657c733a343a2249676f72223b736f6272656e6f6d657c733a333a22436861223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31353a2269676f722d6176617461722e6a7067223b6c6f6761646f7c623a313b),
('5a0a7ead00d7822f64d8bbd229075900db4f7196', '::1', 1452662927, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323636323736353b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('6ac93dc848cc8a225e2a1b3ef6664e825f32ca13', '::1', 1452633601, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323633333136313b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('6de73b0043ada46a106e1a9bcb41b2afeeee7560', '::1', 1452640253, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323634303036373b636f6469676f5f7573756172696f7c733a323a223130223b6c6f67696e7c733a333a22706574223b6e6f6d657c733a393a22506574746572736f6e223b736f6272656e6f6d657c733a363a22466172696173223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a373a227065742e6a7067223b6c6f6761646f7c623a313b),
('71958875d3a529d20b63151e063f6c1fd567ce4f', '::1', 1452660789, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323636303737373b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('78867549a86f57b73a61e94e8e6686797daf28c1', '::1', 1452643146, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323634333134363b),
('897855fc50ce20f0abb2cbee3e192257756e92db', '::1', 1452621788, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323632313536333b636f6469676f5f7573756172696f7c733a313a2234223b6c6f67696e7c733a343a2269676f72223b6e6f6d657c733a343a2249676f72223b736f6272656e6f6d657c733a333a22436861223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6c6f6761646f7c623a313b),
('b0b05fd230167a632839c6a96d88f8ce5b4fd3e5', '::1', 1452606916, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323630363836323b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('b93b91037db8206578b5e3ac4188191072dd18c2', '::1', 1452606777, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323630363439313b6c6f6761646f7c623a313b636f6469676f5f7573756172696f7c733a313a2238223b6c6f67696e7c733a343a2276696e69223b6e6f6d657c733a383a2256696e6963697573223b736f6272656e6f6d657c733a383a224d6f6e746569726f223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31323a2276696e69636975732e6a7067223b),
('bdbb23a2ecc40cae8de1b329985435208c9f685d', '::1', 1452651026, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635303736323b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b61646963696f6e61725f616f5f70726f6a65746f7c613a313a7b733a31343a22636f6469676f5f70726f6a65746f223b693a313b7d5f5f63695f766172737c613a313a7b733a32303a2261646963696f6e61725f616f5f70726f6a65746f223b733a333a226e6577223b7d),
('ccb3b1a4746bb0b7d43b6a244f2ba49ecac5d940', '::1', 1452651658, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635313434393b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('ce10f51b993c1fa26db0047578972483428e69a8', '::1', 1452560219, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323535393332363b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('d69217d38b5856e7a1047a42955d1460bc1f404e', '::1', 1452652536, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635323234363b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('d953248c5cc3f53cddb2f6822dc46431de21e77a', '::1', 1452632563, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323633323235303b6c6f6761646f7c623a313b636f6469676f5f7573756172696f7c733a313a2238223b6c6f67696e7c733a343a2276696e69223b6e6f6d657c733a383a2256696e6963697573223b736f6272656e6f6d657c733a383a224d6f6e746569726f223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31323a2276696e69636975732e6a7067223b),
('d98e0703976c5b5ae4d98ec6c761f611793630ec', '::1', 1452629227, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323632383934353b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('d9dc569fb4eddbd4cfac45f7689e0ebea4e0792e', '::1', 1452630028, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323632393636313b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('e1f0e1b5eeea939453d81be4f5ceb94dbed24e87', '::1', 1452605444, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323630353433353b636f6469676f5f7573756172696f7c733a313a2237223b6c6f67696e7c733a343a226a6f616f223b6e6f6d657c733a353a224a6fc3a36f223b736f6272656e6f6d657c733a353a224c656d6f73223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a383a226a6f616f2e6a7067223b6c6f6761646f7c623a313b),
('e21a0f30de8ac7cd905a43cac38cf28c1169c596', '::1', 1452564911, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323536343830373b636f6469676f5f7573756172696f7c733a313a2237223b6c6f67696e7c733a343a226a6f616f223b6e6f6d657c733a353a224a6fc3a36f223b736f6272656e6f6d657c733a353a224c656d6f73223b636f6469676f5f70657266696c7c733a313a2231223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a383a226a6f616f2e6a7067223b6c6f6761646f7c623a313b),
('e235f3f3060395ed9202a80188168b3dcae0b45a', '::1', 1452558823, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323535383538303b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('e667281a7d2de8d783d6c5c536ef73e2153400d1', '::1', 1452654569, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323635343333393b636f6469676f5f7573756172696f7c733a313a2236223b6c6f67696e7c733a363a226e656e65746f223b6e6f6d657c733a373a22416e746f6e696f223b736f6272656e6f6d657c733a343a224e65746f223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31303a226e656e65746f2e6a7067223b6c6f6761646f7c623a313b),
('e6c6fa237292d30a35d400caa1fbc198d2cb9146', '::1', 1452629622, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323632393332353b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b),
('fac387728b70412bca7dde1eb4a1532efe7999a9', '::1', 1452630047, 0x5f5f63695f6c6173745f726567656e65726174657c693a313435323633303034343b636f6469676f5f7573756172696f7c733a313a2235223b6c6f67696e7c733a333a226d6c70223b6e6f6d657c733a373a224dc3a17263696f223b736f6272656e6f6d657c733a363a22506173736f73223b636f6469676f5f70657266696c7c733a313a2232223b636f6469676f5f7374617475737c733a313a2231223b6172717569766f5f6176617461727c733a31313a22617661746172332e6a7067223b6c6f6761646f7c623a313b);

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes_resposta`
--

CREATE TABLE IF NOT EXISTS `observacoes_resposta` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_observacao` int(11) NOT NULL,
  `resposta` varchar(500) NOT NULL,
  `data_resposta` date DEFAULT NULL,
  `inserido_por` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `observacoes_resposta`
--

INSERT INTO `observacoes_resposta` (`codigo`, `codigo_observacao`, `resposta`, `data_resposta`, `inserido_por`) VALUES
(5, 7, 'Só dessa vez. Mais 7 dias.', '2016-01-13', 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes_status`
--

CREATE TABLE IF NOT EXISTS `observacoes_status` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `observacoes_status`
--

INSERT INTO `observacoes_status` (`codigo`, `nome`) VALUES
(1, 'Em andamento'),
(2, 'Aceita'),
(3, 'Negada'),
(4, 'Finalização forçada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `observacoes_tipo`
--

CREATE TABLE IF NOT EXISTS `observacoes_tipo` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `observacoes_tipo`
--

INSERT INTO `observacoes_tipo` (`codigo`, `tipo`) VALUES
(1, 'Finalização'),
(2, 'Extensão de Prazo'),
(3, 'Finalização Forçada');

-- --------------------------------------------------------

--
-- Estrutura da tabela `papel`
--

CREATE TABLE IF NOT EXISTS `papel` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `papel`
--

INSERT INTO `papel` (`codigo`, `nome`) VALUES
(1, 'Líder'),
(2, 'Participante'),
(3, 'Coordenador');

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

CREATE TABLE IF NOT EXISTS `perfil` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`codigo`, `nome`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto`
--

CREATE TABLE IF NOT EXISTS `projeto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `prioridade` int(11) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_prazo` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `criado_por` int(11) NOT NULL,
  `codigo_status` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `projeto`
--

INSERT INTO `projeto` (`codigo`, `titulo`, `descricao`, `prioridade`, `data_inicio`, `data_prazo`, `data_fim`, `criado_por`, `codigo_status`) VALUES
(1, 'Demandou', 'Sistema para gerencia de projetos da DCI', 2, '2016-01-01', '2016-01-31', NULL, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `projeto_tarefa`
--

CREATE TABLE IF NOT EXISTS `projeto_tarefa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_projeto` int(11) NOT NULL,
  `codigo_tarefa` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `status`
--

CREATE TABLE IF NOT EXISTS `status` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `status`
--

INSERT INTO `status` (`codigo`, `nome`) VALUES
(0, 'Desativado'),
(1, 'Ativado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefa`
--

CREATE TABLE IF NOT EXISTS `tarefa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `descricao` varchar(300) NOT NULL,
  `prioridade` int(1) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_prazo` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `encerrada` tinyint(4) DEFAULT NULL,
  `encerrada_por` int(11) DEFAULT NULL,
  `criado_por` int(11) NOT NULL,
  `codigo_projeto` int(11) NOT NULL,
  `codigo_usuario` int(11) NOT NULL,
  `codigo_status` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tarefa`
--

INSERT INTO `tarefa` (`codigo`, `titulo`, `descricao`, `prioridade`, `data_inicio`, `data_prazo`, `data_fim`, `encerrada`, `encerrada_por`, `criado_por`, `codigo_projeto`, `codigo_usuario`, `codigo_status`) VALUES
(1, 'Identidade Visual', 'Identidade visual by Igor Cha.', 3, '2016-01-01', '2016-01-20', NULL, NULL, NULL, 5, 1, 4, 1),
(2, 'Layout', 'Joao entrega layout.', 3, '2016-01-11', '2016-01-15', NULL, 1, 6, 5, 1, 7, 1),
(3, 'Versão Beta do Demandou', 'Márcio entrega versão beta.', 2, '2016-01-18', '2016-01-22', NULL, NULL, NULL, 5, 1, 5, 1),
(4, 'Avaliação', 'Neto avalia Demandou', 1, '2016-01-25', '2016-01-26', NULL, NULL, NULL, 5, 1, 6, 1),
(5, 'Versão Beta 2', 'Márcio entrega Beta 2.', 1, '2016-01-27', '2016-01-31', NULL, NULL, NULL, 5, 1, 5, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tarefa_observacoes`
--

CREATE TABLE IF NOT EXISTS `tarefa_observacoes` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `observacao` varchar(500) NOT NULL,
  `data_criada` date NOT NULL,
  `codigo_tipo` int(11) NOT NULL,
  `codigo_status_obs` int(11) NOT NULL,
  `codigo_tarefa` int(11) NOT NULL,
  `inserido_por` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `tarefa_observacoes`
--

INSERT INTO `tarefa_observacoes` (`codigo`, `observacao`, `data_criada`, `codigo_tipo`, `codigo_status_obs`, `codigo_tarefa`, `inserido_por`) VALUES
(7, 'Extende. neto? by igor', '2016-01-13', 2, 1, 1, 4),
(8, 'Viajaste, nao gostei. Vou refazer o pedido.', '2016-01-13', 3, 4, 2, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(15) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `sobrenome` varchar(30) NOT NULL,
  `data_nascimento` date NOT NULL,
  `arquivo_avatar` varchar(200) NOT NULL,
  `data_criado` date NOT NULL,
  `codigo_funcao` int(11) NOT NULL,
  `codigo_perfil` int(11) NOT NULL,
  `codigo_status` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`codigo`, `login`, `senha`, `email`, `nome`, `sobrenome`, `data_nascimento`, `arquivo_avatar`, `data_criado`, `codigo_funcao`, `codigo_perfil`, `codigo_status`) VALUES
(4, 'igor', '7c67e713a4b4139702de1a4fac672344', 'igorcha@secom.pa.gov.br', 'Igor', 'Cha', '2001-01-01', 'igor-avatar.jpg', '2015-12-17', 4, 1, 1),
(5, 'mlp', '7c67e713a4b4139702de1a4fac672344', 'marciopassosbel@gmail.com', 'Márcio', 'Passos', '1981-04-13', 'avatar3.jpg', '2015-12-17', 3, 2, 1),
(6, 'neneto', '7c67e713a4b4139702de1a4fac672344', 'antonioneto@secom.pa.gov.br', 'Antonio', 'Neto', '2001-01-01', 'neneto.jpg', '2015-12-17', 1, 2, 1),
(7, 'joao', '7c67e713a4b4139702de1a4fac672344', 'joaolemos@secom.pa.gov.br', 'João', 'Lemos', '2010-10-10', 'joao.jpg', '2015-12-17', 4, 1, 1),
(8, 'vini', '7c67e713a4b4139702de1a4fac672344', 'viniciusmonteiro@secom.pa.gov.br', 'Vinicius', 'Monteiro', '2002-02-20', 'vinicius.jpg', '2015-12-17', 2, 1, 1),
(9, 'italo', '7c67e713a4b4139702de1a4fac672344', 'italo.torres@secom.pa.gov.br', 'Ítalo', 'Torres', '1990-11-11', 'italo.jpg', '2015-12-17', 2, 1, 1),
(10, 'pet', '7c67e713a4b4139702de1a4fac672344', 'pettersonfariassecom@gmail.com', 'Petterson', 'Farias', '1993-12-12', 'pet.jpg', '2015-12-17', 2, 1, 1),
(11, 'carolina', '7c67e713a4b4139702de1a4fac672344', 'carolinaventurini@icloud.com', 'Carolina', 'Venturini Passos', '2005-09-05', '12113508_10204682176965630_8757563117268102190_o.jpg', '2015-12-23', 2, 2, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_acesso`
--

CREATE TABLE IF NOT EXISTS `usuario_acesso` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int(11) NOT NULL,
  `data_acesso` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_funcao`
--

CREATE TABLE IF NOT EXISTS `usuario_funcao` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `usuario_funcao`
--

INSERT INTO `usuario_funcao` (`codigo`, `titulo`) VALUES
(1, 'Diretor'),
(2, 'Assessor de Comunicação'),
(3, 'Analista de Sistemas'),
(4, 'Designer Gráfico'),
(5, 'Estagiário');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_projeto`
--

CREATE TABLE IF NOT EXISTS `usuario_projeto` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int(11) NOT NULL,
  `codigo_projeto` int(11) NOT NULL,
  `codigo_papel` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `usuario_projeto`
--

INSERT INTO `usuario_projeto` (`codigo`, `codigo_usuario`, `codigo_projeto`, `codigo_papel`) VALUES
(1, 6, 1, 1),
(2, 4, 1, 2),
(3, 5, 1, 2),
(4, 7, 1, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_tarefa`
--

CREATE TABLE IF NOT EXISTS `usuario_tarefa` (
  `codigo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_usuario` int(11) NOT NULL,
  `codigo_tarefa` int(11) NOT NULL,
  `codigo_papel` int(11) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;