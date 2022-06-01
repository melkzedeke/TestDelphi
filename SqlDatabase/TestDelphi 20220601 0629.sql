-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.17-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema teste
--

CREATE DATABASE IF NOT EXISTS teste;
USE teste;

--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `Codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Cidade` varchar(45) NOT NULL,
  `UF` varchar(2) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`Codigo`,`Nome`,`Cidade`,`UF`) VALUES 
 (1,'Jose Geraldo','Mundo Novo','MS'),
 (2,'Manoel Pereira','Mundo Novo','MS'),
 (3,'Maria Junqueira','Mundo Novo','MS'),
 (4,'Madalena Farias','Mundo Novo','MS'),
 (5,'Alice Golsalvez','Mundo Novo','MS'),
 (6,'Jose Maria','Mundo Novo','MS'),
 (7,'Paulo Jose','Mundo Novo','MS'),
 (8,'Pedro Pereira','Mundo Novo','MS'),
 (9,'Eloisa Batista','Mundo Novo','MS'),
 (10,'Katia Nogueira','Mundo Novo','MS'),
 (11,'Eusébrio dos Santos','Mundo Novo','MS'),
 (12,'Josenildo Pereira','Mundo Novo','MS'),
 (13,'Irani Ferreira','Mundo Novo','MS'),
 (14,'Josemar Ferris','Mundo Novo','MS'),
 (15,'Ivanilda Dias','Mundo Novo','MS'),
 (16,'Madalena Almeira','Mundo Novo','MS'),
 (17,'Fabiana dos Santos','Mundo Novo','MS'),
 (18,'Geraldo Batista','Mundo Novo','MS'),
 (19,'Nélio Munhois','Mundo Novo','MS'),
 (20,'Carlos Moises','Mundo Novo','MS'),
 (21,'Delair Alves','Mundo Novo','MS');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Definition of table `pedidos_dados_gerais`
--

DROP TABLE IF EXISTS `pedidos_dados_gerais`;
CREATE TABLE `pedidos_dados_gerais` (
  `numeropedido` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dataemissao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `codigocliente` varchar(45) NOT NULL,
  `valortotal` varchar(45) NOT NULL,
  PRIMARY KEY (`numeropedido`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidos_dados_gerais`
--

/*!40000 ALTER TABLE `pedidos_dados_gerais` DISABLE KEYS */;
INSERT INTO `pedidos_dados_gerais` (`numeropedido`,`dataemissao`,`codigocliente`,`valortotal`) VALUES 
 (12,'2022-06-01 06:11:46','1','144,32');
/*!40000 ALTER TABLE `pedidos_dados_gerais` ENABLE KEYS */;


--
-- Definition of table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE `pedidos_produtos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numeropedido` varchar(45) NOT NULL,
  `codigoproduto` varchar(45) NOT NULL,
  `quantidade` varchar(45) NOT NULL,
  `valorunitario` varchar(45) NOT NULL,
  `valortotal` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidos_produtos`
--

/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
INSERT INTO `pedidos_produtos` (`id`,`numeropedido`,`codigoproduto`,`quantidade`,`valorunitario`,`valortotal`) VALUES 
 (31,'12','2','1','11,70','11,7'),
 (32,'12','1','2','10,56','21,12'),
 (33,'12','3','5','22,30','111,5');
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;


--
-- Definition of table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE `produtos` (
  `Codigo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  `PrecodeVenda` varchar(45) NOT NULL,
  PRIMARY KEY (`Codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `produtos`
--

/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` (`Codigo`,`Descricao`,`PrecodeVenda`) VALUES 
 (1,'sabonete','10,56'),
 (2,'pasta de dente','11,70'),
 (3,'Shampoo','22,30');
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
