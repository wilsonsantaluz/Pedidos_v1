/* -------------------------------------------------------------- */
/* Wilson santaluz -ME                                 12/03/2021 */
/* -------------------------------------------------------------- */
/* Host     : localhost                                           */
/* Port     : 3306                                                */
/* Database : teste_db                                            */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8mb4' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `teste_db`
    CHARACTER SET 'utf8mb4'
    COLLATE 'utf8mb4_general_ci';

USE `teste_db`;

/* Structure for the `clientes` table : */

CREATE TABLE `clientes` (
  `codigo` INTEGER NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cidade` VARCHAR(150) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `uf` VARCHAR(2) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY USING BTREE (`codigo`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'
;

/* Structure for the `pedidos` table : */

CREATE TABLE `pedidos` (
  `numero` INTEGER NOT NULL AUTO_INCREMENT,
  `data` DATETIME DEFAULT NULL,
  `cliente_codigo` INTEGER DEFAULT NULL,
  `total` DOUBLE(15,3) DEFAULT NULL,
  PRIMARY KEY USING BTREE (`numero`),
  KEY `pedidos_fk_cliente` USING BTREE (`cliente_codigo`),
  CONSTRAINT `pedidos_fk_cliente` FOREIGN KEY (`cliente_codigo`) REFERENCES `clientes` (`codigo`)
) ENGINE=InnoDB
AUTO_INCREMENT=5 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'
;

/* Structure for the `produtos` table : */

CREATE TABLE `produtos` (
  `codigo` INTEGER NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preco` DOUBLE DEFAULT NULL,
  PRIMARY KEY USING BTREE (`codigo`)
) ENGINE=InnoDB
AUTO_INCREMENT=3 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'
;

/* Structure for the `pedido_item` table : */

CREATE TABLE `pedido_item` (
  `codigo` INTEGER NOT NULL AUTO_INCREMENT,
  `pedido_numero` INTEGER NOT NULL,
  `produto_codigo` INTEGER NOT NULL,
  `valor_unitario` DOUBLE NOT NULL,
  `quantidade` DOUBLE DEFAULT 1,
  `valor_total` INTEGER DEFAULT NULL,
  PRIMARY KEY USING BTREE (`codigo`),
  KEY `pedido_item_fkpedido` USING BTREE (`pedido_numero`),
  KEY `pedido_item_fkproduto` USING BTREE (`produto_codigo`),
  CONSTRAINT `pedido_item_fkpedido` FOREIGN KEY (`pedido_numero`) REFERENCES `pedidos` (`numero`) ON DELETE CASCADE,
  CONSTRAINT `pedido_item_fkproduto` FOREIGN KEY (`produto_codigo`) REFERENCES `produtos` (`codigo`)
) ENGINE=InnoDB
AUTO_INCREMENT=1 ROW_FORMAT=DYNAMIC CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci'
;

/* Data for the `clientes` table  (LIMIT 0,500) */

INSERT INTO `clientes` (`codigo`, `nome`, `cidade`, `uf`) VALUES
  (1,'wilson santa luz','goiânia','GO'),
  (2,'cristiano nunes ','goiânia','GO'),
  (3,'jose tenorio cruz','goiânia','GO'),
  (4,'luana silveira prado','goiânia','GO'),
  (5,'shirlene nascimento souza','goiânia','GO'),
  (6,'madalena lima soto','goiânia','GO'),
  (7,'durval rocha santos','goiânia','GO'),
  (8,'maria dorcel carvalho','goiânia','GO'),
  (9,'rosalina meira rocha','goiânia','GO'),
  (10,'gustavo do amaral','goiânia','GO'),
  (11,'zilda mello','goiânia','GO'),
  (12,'garibaldi indio artiaga','goiânia','GO'),
  (13,'neiva mendes','goiânia','GO'),
  (14,'patricia nunes maia','goiânia','GO'),
  (15,'jura carvalho','jundiai','SP'),
  (16,'antenor moreira','jundiai','SP'),
  (17,'denilson motta','jundiai','SP'),
  (18,'luciano carlos da rocha','jundiai','SP'),
  (19,'benedito silva santos','jundiai','SP'),
  (20,'araci carvalho','jundiai','SP'),
  (21,'deividson arantes mendes','jundiai','SP'),
  (22,'jonatham carvalho de araujo lima','jundiai','SP'),
  (23,'juliano dos santos ','jundiai','SP'),
  (24,'marcio alberto de brito','jundiai','SP'),
  (25,'melci pereira leite','cabreuva','SP'),
  (26,'abelardo gomes do nazare','cabreuva','SP'),
  (27,'abel moura prado','cabreuva','SP'),
  (28,'berlinda mattos','cabreuva','SP'),
  (29,'benevaldo antunes do nacimento','cabreuva','SP'),
  (30,'brasilindo sapucaia dos santos','cabreuva','SP'),
  (31,'beth moura brasil','itu','SP'),
  (32,'carlos rocha ','itu','SP'),
  (33,'creusa antunes silva','itu','SP'),
  (34,'eliana rodigues bento ','itu','SP'),
  (35,'edinalva sandoval','itu','SP'),
  (36,'fernado cunha','itu','SP');
COMMIT;

/* Data for the `produtos` table  (LIMIT 0,500) */

INSERT INTO `produtos` (`codigo`, `descricao`, `preco`) VALUES
  (1,'NOCTAL 2MG C 20 COMP B1',5.22),
  (2,'DEPAKENE 50MG ML XAROPE 100ML C1',4.99),
  (3,'CAMOMILA RAULIVEIRA 150ML',3.5),
  (4,'PROT SOLAR NEUTROGENA SUN FRESH FPS30 200ML',43.69),
  (5,'STERILAIR ESTERILIZ AR BEGE',149),
  (6,'SHA JOHNSON BABY 750ML',29.99),
  (7,'DES AERO REXONA 150ML MEN INVISIBLE*',8.95),
  (8,'MUCILON LATA 400GR MILHO',6.99),
  (9,'CARGA AP BARB GILLETTE MACH 3 SENS C/2UN',21.99),
  (10,'MUCILON LATA 400GR ARROZ/AVEIA',6.99),
  (11,'KIT SHA+COND NIELY GOLD (275ML) FOR MEN',14.5),
  (12,'DES ROLLON DOVE 50ML BEAUTY FINISH',10.99),
  (13,'GTECH AP PRESSAO DIG BRACO MA100 MASTER',199),
  (14,'RESFRILIV SACHE 5G LARANJA E ACEROL(CX C/50)',2.39),
  (15,'RESFRILIV SACHE 5G HORTELA E GENGIB(CX C/50)',2.39),
  (16,'SHA AUSSIE 400ML MEGA MOIST',41.99),
  (17,'KIT BIO EXT CRONOGRAMA CAPILAR 30ML',59.99),
  (18,'ESC DENT CONDOR DYNAMIC LV3 PG2',9.99),
  (19,'DES CLINICAL REXONA 48GR EXTRA DRY WOMEN (SAIU DE PRODUÇÃO)',24.99),
  (20,'DES AERO OLD SPICE 150ML LENHA',9.99),
  (21,'SAB LIQ INT DERMACYD 200ML FEMINA FLORAL PRO BIO',14.99),
  (22,'AGUA DE BANHO MURIEL 250ML ACQUA ESSENCE LARANJEIR',12.99),
  (23,'INALADOR AR COMPR OMRON NE-C801BR',164.5),
  (24,'MONSTER EXTREME BLACK PROBIOTICA C/44 PACK',216.97),
  (25,'MASC CAP TO PODENDO 1KG ALISADOS E RELAXADOS NV3',20.99),
  (26,'ESM DAILUS CINT 402 BODAS DE ALGODÃO',6.99),
  (27,'COLAGENO HIDR 2EM1 30 SACHES 10G ORIGINAL - MAXINUTRI',74.95),
  (28,'AXOMAX QI C/60 CPS',74.95),
  (29,'PROT SOLAR NEUTROGENA SUN FLESH FPS30 AERO 180ML1',29.9),
  (30,'MUCILON SACHE 210GR + 20GR ARROZ/AVEIA SACHE',4),
  (31,'KIT CENTRUM HOMEM 60+30 CPR',119.9),
  (32,'KIT CENTRUM MULHER 60+30 CPR',119.9),
  (33,'FRAL CALCA MAMYPOKO HIPER AMARELA XG C/42UN',59.99),
  (34,'REPELENTE EXPOSIS GEL 117ML BEBE',0.99),
  (35,'FRAL CALCA MAMYPOKO JUMBO AZUL G C/32UN',52.99),
  (36,'FRAL CALCA MAMYPOKO HIPER AZUL G C/50UN',75.99);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;