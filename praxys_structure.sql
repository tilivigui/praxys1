/*
MySQL Backup
Source Server Version: 11.4.7
Source Database: pracsys_livigui70
Date: 02/09/2025 21:44:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
--  Table structure for `adm_almacenaingmir`
-- ----------------------------
DROP TABLE IF EXISTS `adm_almacenaingmir`;
CREATE TABLE `adm_almacenaingmir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `cantidad` decimal(14,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manalmacen`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manalmacen`;
CREATE TABLE `adm_manalmacen` (
  `idalmacen` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codalm` varchar(6) NOT NULL DEFAULT '',
  `desalm` varchar(40) NOT NULL DEFAULT '',
  `inicio` date NOT NULL DEFAULT '1900-01-01',
  `obligasaldo` varchar(1) NOT NULL DEFAULT 'N',
  `obligainve` varchar(1) NOT NULL DEFAULT 'S',
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `diralm` varchar(255) NOT NULL DEFAULT '',
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `codprv` varchar(6) NOT NULL DEFAULT '',
  `ubigeo` varchar(6) NOT NULL DEFAULT '',
  `anexo` varchar(4) NOT NULL DEFAULT '',
  `ubicatiene` varchar(3) NOT NULL DEFAULT '',
  `ubicadefecto` varchar(30) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idalmacen`) USING BTREE,
  UNIQUE KEY `adm_manalmacen` (`idcia`,`codalm`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manalmacenacc`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manalmacenacc`;
CREATE TABLE `adm_manalmacenacc` (
  `idalmacenacc` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idalmacenacc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manalmacencar`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manalmacencar`;
CREATE TABLE `adm_manalmacencar` (
  `idalmacencar` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(2) NOT NULL DEFAULT '' COMMENT '01 = Pasillo, 02=Anaquel, 03=Nivel, 04=SubNivel',
  `codcar` varchar(6) NOT NULL DEFAULT '',
  `nomcar` varchar(30) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Activo o 0=Inactivo',
  PRIMARY KEY (`idalmacencar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manalmacenubi`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manalmacenubi`;
CREATE TABLE `adm_manalmacenubi` (
  `idalmacenubi` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0 COMMENT 'Relacionado con la tabla com_companias',
  `codalm` varchar(6) NOT NULL DEFAULT '' COMMENT 'Relacionado con la tabla adm_manalmacen',
  `codcar1` varchar(6) NOT NULL DEFAULT '' COMMENT 'Relacionado con la tabla adm_manalmacencar con tipo=01',
  `codcar2` varchar(6) NOT NULL DEFAULT '' COMMENT 'Relacionado con la tabla adm_manalmacencar con tipo=02',
  `codcar3` varchar(6) NOT NULL DEFAULT '' COMMENT 'Relacionado con la tabla adm_manalmacencar con tipo=03',
  `codcar4` varchar(6) NOT NULL DEFAULT '' COMMENT 'Relacionado con la tabla adm_manalmacencar con tipo=04',
  `codubi` varchar(30) NOT NULL DEFAULT '' COMMENT 'Concatenado codalm+codcar1+codcar2+codcar3+codcar4',
  `nomubi` varchar(100) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=Activo o 0=Inactivo',
  PRIMARY KEY (`idalmacenubi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mancalculo`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancalculo`;
CREATE TABLE `adm_mancalculo` (
  `idcalculo` int(11) NOT NULL AUTO_INCREMENT,
  `codcalculo` int(2) NOT NULL DEFAULT 0,
  `nomcalculo` varchar(15) NOT NULL DEFAULT '',
  `codigotributo` varchar(6) NOT NULL DEFAULT '',
  `codigoafecta` varchar(6) NOT NULL DEFAULT '',
  `porigv` tinyint(1) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcalculo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancanal`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancanal`;
CREATE TABLE `adm_mancanal` (
  `idcanal` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codcanal` varchar(6) NOT NULL DEFAULT '',
  `descanal` varchar(40) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcanal`) USING BTREE,
  UNIQUE KEY `adm_mancanal` (`idcia`,`idsuc`,`codcanal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancategoriagasto`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancategoriagasto`;
CREATE TABLE `adm_mancategoriagasto` (
  `idcategoriag` int(11) NOT NULL AUTO_INCREMENT,
  `idtipog` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idcategoriag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manclasep`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manclasep`;
CREATE TABLE `adm_manclasep` (
  `idclasep` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `idfamiliap` int(11) NOT NULL DEFAULT 0,
  `tipo` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `idclases` int(11) NOT NULL DEFAULT 0,
  `codclases` varchar(8) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idclasep`),
  UNIQUE KEY `adm_mangrupo` (`idcia`,`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manclasesunat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manclasesunat`;
CREATE TABLE `adm_manclasesunat` (
  `idclases` int(11) NOT NULL AUTO_INCREMENT,
  `idfamilias` int(11) NOT NULL DEFAULT 0,
  `codfamilias` varchar(8) NOT NULL DEFAULT '',
  `codclases` varchar(8) NOT NULL DEFAULT '',
  `nomclases` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`idclases`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3819 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancodigoafecta`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancodigoafecta`;
CREATE TABLE `adm_mancodigoafecta` (
  `idcodigoafecta` int(11) NOT NULL AUTO_INCREMENT,
  `codigoafecta` varchar(6) NOT NULL DEFAULT '',
  `descripcion` varchar(100) NOT NULL DEFAULT '',
  `descripcioncorta` varchar(30) NOT NULL DEFAULT '',
  `codigotributo` varchar(6) NOT NULL DEFAULT '',
  `condicion` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcodigoafecta`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancodigotributo`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancodigotributo`;
CREATE TABLE `adm_mancodigotributo` (
  `idcodigotributo` int(11) NOT NULL AUTO_INCREMENT,
  `codigotributo` varchar(6) NOT NULL DEFAULT '',
  `descripcion` varchar(100) NOT NULL DEFAULT '',
  `descripcioncorta` varchar(30) NOT NULL DEFAULT '',
  `codigointernacional` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(6) NOT NULL DEFAULT '',
  `condicion` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcodigotributo`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancolor`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancolor`;
CREATE TABLE `adm_mancolor` (
  `idcolor` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(20) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcolor`) USING BTREE,
  UNIQUE KEY `adm_mancolor` (`idcia`,`idsuc`,`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancomprobante`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancomprobante`;
CREATE TABLE `adm_mancomprobante` (
  `idcom` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idtcom` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `descom` varchar(40) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `tipdoc` varchar(2) NOT NULL,
  `genera` varchar(10) NOT NULL DEFAULT '',
  `idcorr` int(11) NOT NULL DEFAULT 0,
  `entsal` int(1) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idcuenta` int(11) NOT NULL DEFAULT 0,
  `tcamcom` varchar(1) NOT NULL DEFAULT 'V',
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `formato` varchar(100) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `condpago` varchar(2) NOT NULL,
  `ptovta` int(1) NOT NULL DEFAULT 0,
  `idcomf` int(11) NOT NULL DEFAULT 0,
  `idconceptof` int(11) NOT NULL DEFAULT 0,
  `formapago` varchar(200) NOT NULL DEFAULT '',
  `tiempoentrega` varchar(200) NOT NULL DEFAULT '',
  `tiempogarantia` varchar(200) NOT NULL DEFAULT '',
  `lugarentrega` varchar(200) NOT NULL DEFAULT '',
  `validezoferta` varchar(200) NOT NULL DEFAULT '',
  `nota` text DEFAULT NULL,
  `aiimported` decimal(1,0) NOT NULL DEFAULT 0,
  `codtipdoc` varchar(2) NOT NULL,
  `electronico` decimal(1,0) NOT NULL DEFAULT 0,
  `relectronico` decimal(1,0) NOT NULL DEFAULT 0,
  `gelectronico` decimal(1,0) NOT NULL DEFAULT 0,
  `anexo` varchar(4) NOT NULL DEFAULT '',
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `opcion` varchar(5) NOT NULL DEFAULT '',
  `precom` int(1) NOT NULL DEFAULT 0,
  `rv` int(1) NOT NULL DEFAULT 0,
  `rc` int(1) NOT NULL DEFAULT 0,
  `ms` int(1) NOT NULL DEFAULT 0,
  `mf` int(1) NOT NULL DEFAULT 0,
  `mc` int(1) NOT NULL DEFAULT 0,
  `mp` int(1) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `contabilizar` int(1) NOT NULL DEFAULT 0,
  `provisionitem` varchar(1) NOT NULL DEFAULT '',
  `provisionctacte` varchar(1) NOT NULL DEFAULT '',
  `idorigen` int(11) NOT NULL DEFAULT 0,
  `codori` varchar(2) NOT NULL DEFAULT '',
  `gencuoaut` tinyint(1) NOT NULL DEFAULT 0,
  `genpagcobaut` tinyint(1) NOT NULL DEFAULT 0,
  `codigoc` varchar(50) NOT NULL DEFAULT '',
  `versionc` varchar(50) NOT NULL DEFAULT '',
  `fechac` varchar(50) NOT NULL DEFAULT '',
  `idforpag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancomprobanteacc`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancomprobanteacc`;
CREATE TABLE `adm_mancomprobanteacc` (
  `idcomacc` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `login` varchar(255) NOT NULL DEFAULT '',
  `exitc` tinyint(1) NOT NULL DEFAULT 1,
  `regtc` tinyint(1) NOT NULL DEFAULT 1,
  `accinsert` tinyint(1) NOT NULL DEFAULT 1,
  `accupdate` tinyint(1) NOT NULL DEFAULT 1,
  `accdelete` tinyint(1) NOT NULL DEFAULT 1,
  `accapprove` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcomacc`) USING BTREE,
  UNIQUE KEY `adm_mancomprobanteacc` (`idcia`,`idcom`,`login`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2518 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancomprobantecor`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancomprobantecor`;
CREATE TABLE `adm_mancomprobantecor` (
  `idcorr` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `descorr` varchar(30) NOT NULL DEFAULT '',
  `numcom` decimal(11,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcorr`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manconceptof`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manconceptof`;
CREATE TABLE `adm_manconceptof` (
  `idconceptof` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codconceptof` varchar(6) NOT NULL DEFAULT '',
  `desconceptof` varchar(60) NOT NULL DEFAULT '',
  `entsal` int(1) NOT NULL DEFAULT 0,
  `codcta1` varchar(10) NOT NULL DEFAULT '',
  `codcta2` varchar(10) NOT NULL DEFAULT '',
  `calculo` int(1) NOT NULL DEFAULT 1,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idconceptof`) USING BTREE,
  UNIQUE KEY `adm_manconceptof` (`idcia`,`codconceptof`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mancorrelot`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancorrelot`;
CREATE TABLE `adm_mancorrelot` (
  `idcorrelot` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `tipo` int(1) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `secuen` decimal(10,0) NOT NULL DEFAULT 0,
  `digitos` decimal(10,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcorrelot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mancostoimp`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancostoimp`;
CREATE TABLE `adm_mancostoimp` (
  `id_costoimp` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) DEFAULT '',
  `nombre` varchar(30) DEFAULT '',
  PRIMARY KEY (`id_costoimp`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mancuenta`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mancuenta`;
CREATE TABLE `adm_mancuenta` (
  `idcuenta` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idbanco` int(11) NOT NULL DEFAULT 0,
  `codcuenta` varchar(6) NOT NULL DEFAULT '',
  `nomcuenta` varchar(40) NOT NULL DEFAULT '',
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `nrocuenta` varchar(40) NOT NULL DEFAULT '',
  `codcta` varchar(10) NOT NULL DEFAULT '',
  `idorigen` int(11) NOT NULL DEFAULT 0,
  `codori` varchar(2) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcuenta`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mandocumentoot`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mandocumentoot`;
CREATE TABLE `adm_mandocumentoot` (
  `iddocumentoot` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `tipo` int(1) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`iddocumentoot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mandsctoc`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mandsctoc`;
CREATE TABLE `adm_mandsctoc` (
  `iddsctoc` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `fechai` date NOT NULL DEFAULT '1900-01-01',
  `fechaf` date NOT NULL DEFAULT '1900-01-01',
  `dscto` decimal(6,2) NOT NULL DEFAULT 0.00,
  `tipo` int(1) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`iddsctoc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mandsctod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mandsctod`;
CREATE TABLE `adm_mandsctod` (
  `iddsctod` int(11) NOT NULL AUTO_INCREMENT,
  `iddsctoc` int(11) NOT NULL DEFAULT 0,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `idfamiliap` int(11) NOT NULL DEFAULT 0,
  `idclasep` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `cantidad` decimal(12,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`iddsctod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manfamiliap`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manfamiliap`;
CREATE TABLE `adm_manfamiliap` (
  `idfamiliap` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tipo` int(11) NOT NULL DEFAULT 0,
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `idfamilias` int(11) NOT NULL DEFAULT 0,
  `codfamilias` varchar(8) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idfamiliap`),
  UNIQUE KEY `adm_manlinea` (`idcia`,`codigo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manfamiliasunat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manfamiliasunat`;
CREATE TABLE `adm_manfamiliasunat` (
  `idfamilias` int(11) NOT NULL AUTO_INCREMENT,
  `idsegmentos` int(11) NOT NULL DEFAULT 0,
  `codsegmentos` varchar(8) NOT NULL DEFAULT '',
  `codfamilias` varchar(8) NOT NULL DEFAULT '',
  `nomfamilias` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`idfamilias`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=421 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manformpago`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manformpago`;
CREATE TABLE `adm_manformpago` (
  `idforpag` int(11) NOT NULL AUTO_INCREMENT,
  `codforpag` varchar(2) NOT NULL DEFAULT '',
  `desforpag` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`idforpag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manmagnitudot`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manmagnitudot`;
CREATE TABLE `adm_manmagnitudot` (
  `idmagnitudot` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `siglas` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `idcorrelot` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idmagnitudot`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manmarca`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manmarca`;
CREATE TABLE `adm_manmarca` (
  `idmarca` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idmarca`) USING BTREE,
  UNIQUE KEY `adm_manmarca` (`idcia`,`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manmarcamod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manmarcamod`;
CREATE TABLE `adm_manmarcamod` (
  `idmarcamod` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idmarcamod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manmedida`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manmedida`;
CREATE TABLE `adm_manmedida` (
  `idmedida` int(11) NOT NULL AUTO_INCREMENT,
  `desmedida` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`idmedida`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manmodelo`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manmodelo`;
CREATE TABLE `adm_manmodelo` (
  `idmodelo` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idmodelo`),
  UNIQUE KEY `adm_manmodelo` (`idcia`,`codigo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manopcion`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manopcion`;
CREATE TABLE `adm_manopcion` (
  `idopcion` int(11) NOT NULL AUTO_INCREMENT,
  `opcion` varchar(5) NOT NULL DEFAULT '',
  `nombre` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idopcion`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manpatronot`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manpatronot`;
CREATE TABLE `adm_manpatronot` (
  `idpatron` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idmagnitud` int(11) NOT NULL DEFAULT 0,
  `codpatron` varchar(6) NOT NULL DEFAULT '',
  `nompatron` varchar(100) NOT NULL DEFAULT '',
  `fuentetraz` varchar(30) NOT NULL DEFAULT '',
  `numerocer` varchar(30) NOT NULL DEFAULT '',
  `fechacal` date NOT NULL DEFAULT '1900-01-01',
  `imagen` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`idpatron`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproducto`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproducto`;
CREATE TABLE `adm_manproducto` (
  `idproducto` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tipo` int(1) NOT NULL DEFAULT 0,
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `idfamiliap` int(11) NOT NULL DEFAULT 0,
  `idclasep` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `codigoalt` varchar(60) NOT NULL DEFAULT '',
  `nombre` varchar(120) NOT NULL DEFAULT '',
  `descripcion` text DEFAULT NULL,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  `idmodelo` int(11) NOT NULL DEFAULT 1,
  `idcolor` int(11) NOT NULL DEFAULT 0,
  `idtipo` int(11) NOT NULL DEFAULT 0,
  `imagen` varchar(255) DEFAULT '',
  `largo` decimal(6,2) NOT NULL DEFAULT 0.00,
  `ancho` decimal(6,2) NOT NULL DEFAULT 0.00,
  `alto` decimal(6,2) NOT NULL DEFAULT 0.00,
  `codprocedencia` varchar(6) NOT NULL DEFAULT '',
  `codorigen` varchar(6) NOT NULL DEFAULT '',
  `codctai` varchar(10) NOT NULL DEFAULT '',
  `codctas` varchar(10) NOT NULL DEFAULT '',
  `codctav` varchar(10) NOT NULL DEFAULT '',
  `codctac` varchar(10) NOT NULL DEFAULT '',
  `actsal` int(1) NOT NULL DEFAULT 0,
  `ultmov` date NOT NULL DEFAULT '1900-01-01',
  `usacli` tinyint(1) NOT NULL DEFAULT 1,
  `usapro` tinyint(1) NOT NULL DEFAULT 1,
  `usastk` tinyint(1) NOT NULL DEFAULT 1,
  `codigosunat` varchar(20) NOT NULL DEFAULT '',
  `sexo` varchar(1) NOT NULL DEFAULT '',
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `peso` decimal(10,2) NOT NULL DEFAULT 0.00,
  `cantxbulto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `idtalla` int(11) NOT NULL DEFAULT 0,
  `tal_0001` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0002` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0003` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0004` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0005` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0006` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0007` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0008` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0009` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0010` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0011` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0012` decimal(2,0) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idproducto`) USING BTREE,
  UNIQUE KEY `adm_manproducto` (`idcia`,`codigo`) USING BTREE,
  UNIQUE KEY `idproducto` (`idproducto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5062 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproducto_doc`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproducto_doc`;
CREATE TABLE `adm_manproducto_doc` (
  `iddocumento` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) DEFAULT 0,
  `documento` varchar(255) DEFAULT '',
  PRIMARY KEY (`iddocumento`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductoaux`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductoaux`;
CREATE TABLE `adm_manproductoaux` (
  `idproductoaux` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductoaux`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductolot`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductolot`;
CREATE TABLE `adm_manproductolot` (
  `idproductolot` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(40) NOT NULL DEFAULT '',
  `vencimiento` date NOT NULL DEFAULT '1900-01-01',
  PRIMARY KEY (`idproductolot`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductomod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductomod`;
CREATE TABLE `adm_manproductomod` (
  `idproductomod` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `modelo` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductomod`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductormet`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductormet`;
CREATE TABLE `adm_manproductormet` (
  `idproductormet` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tipo` varchar(2) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `precio1` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `precio2` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `lugarcalibra` varchar(25) NOT NULL DEFAULT '',
  `puntocalibra` varchar(255) NOT NULL DEFAULT '',
  `metodocalibra` text NOT NULL,
  `alcanceservicio` varchar(150) NOT NULL DEFAULT '',
  `tipocertificado` varchar(125) NOT NULL DEFAULT '',
  `magnitud` varchar(125) NOT NULL DEFAULT '',
  `fuentetraza` varchar(100) NOT NULL DEFAULT '',
  `certificadocalibracion` varchar(100) NOT NULL DEFAULT '',
  `patronprincipal` varchar(100) NOT NULL DEFAULT '',
  `precisionpatron` varchar(255) NOT NULL DEFAULT '',
  `observacion` varchar(255) NOT NULL DEFAULT '',
  `tipotrabajo` varchar(25) NOT NULL DEFAULT '',
  `imagen` varchar(100) NOT NULL DEFAULT '',
  `plantillaxlsx` varchar(100) NOT NULL DEFAULT '',
  `idmagnitudot` int(11) NOT NULL DEFAULT 0,
  `texto01` tinyint(1) NOT NULL DEFAULT 0,
  `texto02` tinyint(1) NOT NULL DEFAULT 0,
  `texto03` tinyint(1) NOT NULL DEFAULT 0,
  `texto04` tinyint(1) NOT NULL DEFAULT 0,
  `texto05` tinyint(1) NOT NULL DEFAULT 0,
  `texto06` tinyint(1) NOT NULL DEFAULT 0,
  `texto07` tinyint(1) NOT NULL DEFAULT 0,
  `texto08` tinyint(1) NOT NULL DEFAULT 0,
  `texto09` tinyint(1) NOT NULL DEFAULT 0,
  `texto10` tinyint(1) NOT NULL DEFAULT 0,
  `texto11` tinyint(1) NOT NULL DEFAULT 0,
  `texto12` tinyint(1) NOT NULL DEFAULT 0,
  `texto13` tinyint(1) NOT NULL DEFAULT 0,
  `texto14` tinyint(1) NOT NULL DEFAULT 0,
  `texto15` tinyint(1) NOT NULL DEFAULT 0,
  `texto16` tinyint(1) NOT NULL DEFAULT 0,
  `texto17` tinyint(1) NOT NULL DEFAULT 0,
  `texto18` tinyint(1) NOT NULL DEFAULT 0,
  `texto19` tinyint(1) NOT NULL DEFAULT 0,
  `texto20` tinyint(1) NOT NULL DEFAULT 0,
  `texto21` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idproductormet`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductormetpat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductormetpat`;
CREATE TABLE `adm_manproductormetpat` (
  `idproductormetpat` int(11) NOT NULL AUTO_INCREMENT,
  `idproductormet` int(11) NOT NULL,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idpatron` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idproductormetpat`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=FIXED;

-- ----------------------------
--  Table structure for `adm_manproductoser`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductoser`;
CREATE TABLE `adm_manproductoser` (
  `idproductoser` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `serie` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductoser`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductostk`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostk`;
CREATE TABLE `adm_manproductostk` (
  `idstk` int(11) NOT NULL AUTO_INCREMENT,
  `idcomdet` int(11) NOT NULL,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `idproductoser` int(11) NOT NULL DEFAULT 0,
  `idproductomod` int(11) NOT NULL DEFAULT 0,
  `idproductolot` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `iddoc` int(11) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `idtope` int(11) NOT NULL DEFAULT 0,
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidads` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costots` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidadsf` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costotsf` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `ms` int(1) NOT NULL DEFAULT 0,
  `mt` int(1) NOT NULL DEFAULT 0,
  `idauxiliard` int(11) NOT NULL DEFAULT 0,
  `idauxiliarsd` int(11) NOT NULL DEFAULT 0,
  `entsal` decimal(1,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idstk`) USING BTREE,
  KEY `manproductostk` (`idcia`,`idsuc`,`idalmacen`,`idproducto`,`idunidad`,`idproductoser`,`idproductomod`,`idproductolot`,`fecha`,`entsal`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=321425 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductostkalm`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkalm`;
CREATE TABLE `adm_manproductostkalm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `stock` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductostkanho`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkanho`;
CREATE TABLE `adm_manproductostkanho` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `cantidadi` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoti` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `stock` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductostkdia`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkdia`;
CREATE TABLE `adm_manproductostkdia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `cantidadi` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoti` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `stock` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductostkf`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkf`;
CREATE TABLE `adm_manproductostkf` (
  `idproductostkf` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `idproductoser` int(11) NOT NULL DEFAULT 0,
  `idproductomod` int(11) NOT NULL DEFAULT 0,
  `idproductolot` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoue` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidads` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costots` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`idproductostkf`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductostkmes`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkmes`;
CREATE TABLE `adm_manproductostkmes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `cantidadi` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoti` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `stock` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductostkmov`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductostkmov`;
CREATE TABLE `adm_manproductostkmov` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `lote` varchar(20) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `cantidadi` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoui` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoti` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `cantidade` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costoue` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `costote` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `comprometido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pedido` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `stock` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `disponible` decimal(16,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductosunat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductosunat`;
CREATE TABLE `adm_manproductosunat` (
  `idproductos` int(11) NOT NULL AUTO_INCREMENT,
  `idclases` int(11) NOT NULL DEFAULT 0,
  `codclases` varchar(8) NOT NULL DEFAULT '',
  `codproductos` varchar(8) NOT NULL DEFAULT '',
  `nomproductos` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`idproductos`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=49023 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manproductouni`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductouni`;
CREATE TABLE `adm_manproductouni` (
  `idproductouni` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `factor` decimal(8,4) NOT NULL DEFAULT 1.0000,
  `calculo` varchar(1) NOT NULL DEFAULT '',
  `precioc1` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precioc2` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precioc3` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `margen` decimal(6,2) NOT NULL DEFAULT 0.00,
  `precio1` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precio2` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precio3` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idmoneda` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idproductouni`),
  KEY `adm_manproductouni` (`idcia`,`idproducto`,`idunidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12597 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_manproductounic`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manproductounic`;
CREATE TABLE `adm_manproductounic` (
  `idproductounic` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idproductouni` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `idproductoc` int(11) NOT NULL DEFAULT 0,
  `idunidadc` int(11) NOT NULL DEFAULT 0,
  `cantidadc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `tipoc` varchar(1) NOT NULL DEFAULT '',
  `idmonedac` int(11) NOT NULL DEFAULT 0,
  `precioc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `calculac` varchar(1) NOT NULL DEFAULT '',
  `secuenciac` decimal(2,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idproductounic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mansegmentop`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mansegmentop`;
CREATE TABLE `adm_mansegmentop` (
  `idsegmentop` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tipo` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  `idsegmentos` int(11) NOT NULL DEFAULT 0,
  `codsegmentos` varchar(8) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  `codctac` varchar(10) NOT NULL DEFAULT '',
  `codctav` varchar(10) NOT NULL DEFAULT '',
  `codctai` varchar(10) NOT NULL DEFAULT '',
  `codctas` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idsegmentop`),
  UNIQUE KEY `adm_manfamilia` (`idcia`,`codigo`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mansegmentosunat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mansegmentosunat`;
CREATE TABLE `adm_mansegmentosunat` (
  `idsegmentos` int(11) NOT NULL AUTO_INCREMENT,
  `codsegmentos` varchar(8) NOT NULL DEFAULT '',
  `nomsegmentos` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`idsegmentos`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantalla`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantalla`;
CREATE TABLE `adm_mantalla` (
  `idtalla` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(20) NOT NULL DEFAULT '',
  `talini` decimal(2,0) NOT NULL DEFAULT 0,
  `talfin` decimal(2,0) NOT NULL DEFAULT 0,
  `condicion` decimal(1,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idtalla`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantcomprobante`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantcomprobante`;
CREATE TABLE `adm_mantcomprobante` (
  `idtcom` int(11) NOT NULL AUTO_INCREMENT,
  `codtcom` varchar(2) NOT NULL DEFAULT '',
  `destcom` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtcom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantipoe`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantipoe`;
CREATE TABLE `adm_mantipoe` (
  `idtipoe` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  `sunat` varchar(2) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtipoe`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantipogasto`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantipogasto`;
CREATE TABLE `adm_mantipogasto` (
  `idtipog` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtipog`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_mantiponota`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantiponota`;
CREATE TABLE `adm_mantiponota` (
  `idtipon` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(1) NOT NULL DEFAULT '' COMMENT 'C = Credito D=Debito',
  `codigo` varchar(2) NOT NULL DEFAULT '',
  `nombre` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtipon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantipoprec`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantipoprec`;
CREATE TABLE `adm_mantipoprec` (
  `idtpre` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codtpre` varchar(2) NOT NULL DEFAULT '',
  `destpre` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtpre`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantipotarj`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantipotarj`;
CREATE TABLE `adm_mantipotarj` (
  `idtiptar` int(11) NOT NULL AUTO_INCREMENT,
  `destippar` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtiptar`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantmovimiento`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantmovimiento`;
CREATE TABLE `adm_mantmovimiento` (
  `idtmov` int(11) NOT NULL AUTO_INCREMENT,
  `codmov` varchar(6) NOT NULL DEFAULT '',
  `desmov` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtmov`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantoperacion`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantoperacion`;
CREATE TABLE `adm_mantoperacion` (
  `idtope` int(11) NOT NULL AUTO_INCREMENT,
  `codope` varchar(6) NOT NULL DEFAULT '',
  `desope` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`idtope`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_mantoperacionvta`
-- ----------------------------
DROP TABLE IF EXISTS `adm_mantoperacionvta`;
CREATE TABLE `adm_mantoperacionvta` (
  `idtipopevta` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(6) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `corto` varchar(50) NOT NULL DEFAULT '',
  `condicion` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idtipopevta`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manunidad`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manunidad`;
CREATE TABLE `adm_manunidad` (
  `idunidad` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(6) NOT NULL DEFAULT '',
  `nombre` varchar(20) NOT NULL DEFAULT '',
  `sunat` varchar(2) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idunidad`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manunidadsunat`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manunidadsunat`;
CREATE TABLE `adm_manunidadsunat` (
  `idunidads` int(11) NOT NULL AUTO_INCREMENT,
  `codunidads` varchar(8) NOT NULL DEFAULT '',
  `nomunidads` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`idunidads`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_manzonavent`
-- ----------------------------
DROP TABLE IF EXISTS `adm_manzonavent`;
CREATE TABLE `adm_manzonavent` (
  `idzon` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codzon` varchar(2) NOT NULL DEFAULT '',
  `deszon` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idzon`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_proabripv`
-- ----------------------------
DROP TABLE IF EXISTS `adm_proabripv`;
CREATE TABLE `adm_proabripv` (
  `idabrirpv` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idcuenta` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `saldoi1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `ingreso1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `egreso1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldof1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldoi2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `ingreso2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `egreso2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldof2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `abierto` int(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idabrirpv`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomcab`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcab`;
CREATE TABLE `adm_procomcab` (
  `idcomcab` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idtcom` int(11) NOT NULL DEFAULT 0,
  `opcion` varchar(5) NOT NULL DEFAULT '',
  `tipope` varchar(6) NOT NULL DEFAULT '',
  `idcom` int(11) NOT NULL DEFAULT 0,
  `tipdoc` varchar(2) NOT NULL DEFAULT '',
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `version` decimal(4,0) NOT NULL DEFAULT 1,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `carsunat` varchar(27) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `fechad` date NOT NULL DEFAULT '1900-01-01',
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `codtipdoc` varchar(2) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idauxiliars` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `idvendedor` int(11) NOT NULL DEFAULT 0,
  `condpago` varchar(2) NOT NULL DEFAULT '',
  `idforpag` int(11) NOT NULL DEFAULT 0,
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `dscto` decimal(6,2) NOT NULL DEFAULT 0.00,
  `descuento` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `descuentod` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `gratuito` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `inafecto` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `exonerado` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `exporta` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `afecto` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `isc` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `igv` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `icbper` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `otros` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importe` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pordetrac` decimal(6,2) NOT NULL DEFAULT 0.00,
  `impdetrac` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `porreten` decimal(6,2) NOT NULL DEFAULT 0.00,
  `impreten` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `porpercep` decimal(6,2) NOT NULL DEFAULT 0.00,
  `imppercep` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importef` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importec` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importes` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pagocon` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `suvuelto` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `formapago` varchar(200) NOT NULL DEFAULT '',
  `tiempoentrega` varchar(200) NOT NULL DEFAULT '',
  `tiempogarantia` varchar(200) NOT NULL DEFAULT '',
  `lugarentrega` varchar(200) NOT NULL DEFAULT '',
  `validezoferta` varchar(200) NOT NULL DEFAULT '',
  `nota` text DEFAULT NULL,
  `login` varchar(255) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `fechlog` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `estado` varchar(10) NOT NULL DEFAULT '',
  `situacion` varchar(10) NOT NULL DEFAULT '',
  `tipoguia` varchar(1) NOT NULL DEFAULT '',
  `codopeguia` varchar(6) NOT NULL DEFAULT '',
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `tipdocr` varchar(2) NOT NULL DEFAULT '',
  `codcomr` varchar(6) NOT NULL DEFAULT '',
  `sercomr` varchar(4) NOT NULL DEFAULT '',
  `numcomr` varchar(30) NOT NULL DEFAULT '',
  `fechar` date NOT NULL DEFAULT '1900-01-01',
  `porigv` decimal(6,2) NOT NULL DEFAULT 0.00,
  `idpuntopartida` int(11) NOT NULL DEFAULT 0,
  `puntopartida` varchar(200) NOT NULL DEFAULT '',
  `ubigeopartida` varchar(6) NOT NULL DEFAULT '',
  `idpuntollegada` int(11) NOT NULL DEFAULT 0,
  `puntollegada` varchar(200) NOT NULL DEFAULT '',
  `ubigeollegada` varchar(6) NOT NULL DEFAULT '',
  `tipotraslado` varchar(2) NOT NULL DEFAULT '02',
  `idauxiliart` int(11) NOT NULL DEFAULT 0,
  `vehmarca` varchar(30) NOT NULL DEFAULT '',
  `vehmodelo` varchar(30) NOT NULL DEFAULT '',
  `vehtrasladoml` int(1) NOT NULL DEFAULT 0,
  `vehplaca` varchar(20) NOT NULL DEFAULT '',
  `vehlicencia` varchar(20) NOT NULL DEFAULT '',
  `vehdocumento` varchar(20) NOT NULL DEFAULT '',
  `vehconductor` varchar(100) NOT NULL DEFAULT '',
  `vehconductorape` varchar(100) NOT NULL DEFAULT '',
  `idresponsable` int(11) NOT NULL DEFAULT 0,
  `idproductor` int(11) NOT NULL DEFAULT 0,
  `tiponc` varchar(2) NOT NULL DEFAULT '',
  `codigonc` varchar(2) NOT NULL DEFAULT '',
  `iniciado` varchar(255) NOT NULL DEFAULT '',
  `solicitado` varchar(255) NOT NULL DEFAULT '',
  `destinado` varchar(255) NOT NULL DEFAULT '',
  `idcanal` int(11) NOT NULL DEFAULT 0,
  `estadoemi` varchar(10) NOT NULL DEFAULT '',
  `enlace` varchar(100) NOT NULL DEFAULT '',
  `hash` varchar(100) NOT NULL DEFAULT '',
  `hashqr` varchar(100) NOT NULL DEFAULT '',
  `codsunat` varchar(100) NOT NULL DEFAULT '',
  `mensunat` varchar(100) NOT NULL DEFAULT '',
  `xmlsunat` text DEFAULT NULL,
  `cdrsunat` text DEFAULT NULL,
  `pdfsunat` text DEFAULT NULL,
  `comdet` decimal(5,0) NOT NULL DEFAULT 0,
  `fechaenv` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `estadobaj` varchar(10) NOT NULL DEFAULT '',
  `hashbaj` varchar(100) NOT NULL DEFAULT '',
  `codsunatbaj` varchar(100) NOT NULL DEFAULT '',
  `mensunatbaj` varchar(100) NOT NULL DEFAULT '',
  `xmlsunatbaj` varchar(100) NOT NULL DEFAULT '',
  `fechabaj` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `secuenciabaj` decimal(5,0) NOT NULL DEFAULT 0,
  `referencia2` varchar(100) NOT NULL DEFAULT '',
  `referencia3` varchar(100) NOT NULL DEFAULT '',
  `referencia4` varchar(100) NOT NULL DEFAULT '',
  `ptoembarque` varchar(40) NOT NULL DEFAULT '',
  `ptodestino` varchar(40) NOT NULL DEFAULT '',
  `bl` varchar(40) NOT NULL DEFAULT '',
  `partida` varchar(40) NOT NULL DEFAULT '',
  `secuenciares` decimal(5,0) NOT NULL DEFAULT 0,
  `enviocorreo` varchar(1) NOT NULL DEFAULT 'N',
  `tipdet` varchar(1) NOT NULL DEFAULT '',
  `coddet` varchar(3) NOT NULL DEFAULT '',
  `nrodet` varchar(20) NOT NULL DEFAULT '',
  `fecdet` date NOT NULL DEFAULT '1900-01-01',
  `medpag` varchar(3) NOT NULL DEFAULT '',
  `ubigeooridet` varchar(6) NOT NULL DEFAULT '',
  `direccionoridet` varchar(100) NOT NULL DEFAULT '',
  `ubigeodesdet` varchar(6) NOT NULL DEFAULT '',
  `direcciondesdet` varchar(100) NOT NULL DEFAULT '',
  `detalleviajedet` varchar(100) NOT NULL DEFAULT '',
  `careferealdet` decimal(10,0) NOT NULL DEFAULT 0,
  `costorealdet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `confvehdet` varchar(6) NOT NULL DEFAULT '',
  `carconfvehdet` decimal(10,0) NOT NULL DEFAULT 0,
  `valorrefcardet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `valrefcarefet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `valrefcarnomtdet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `valrefsertradet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `anticipo` decimal(1,0) NOT NULL DEFAULT 0,
  `resumenres` decimal(2,0) NOT NULL DEFAULT 0,
  `errorxml` text DEFAULT NULL,
  `motivo` varchar(50) NOT NULL DEFAULT '',
  `dam` varchar(20) NOT NULL DEFAULT '',
  `peso` decimal(16,3) NOT NULL DEFAULT 0.000,
  `unidadp` varchar(3) NOT NULL DEFAULT '',
  `idauxiliarpa` int(11) NOT NULL DEFAULT 0,
  `estadoprod` varchar(10) NOT NULL DEFAULT '',
  `registromtc` varchar(15) NOT NULL DEFAULT '',
  `indtranprog` int(1) NOT NULL DEFAULT 0,
  `indretvvac` int(1) NOT NULL DEFAULT 0,
  `indtransub` int(1) NOT NULL DEFAULT 0,
  `indretevac` int(1) NOT NULL DEFAULT 0,
  `indpagflete` int(1) NOT NULL DEFAULT 0,
  `nrotuce` varchar(15) NOT NULL DEFAULT '',
  `entidademi` varchar(10) NOT NULL DEFAULT '',
  `codtipdocrgr` varchar(2) NOT NULL DEFAULT '',
  `idauxiliarrgr` int(11) NOT NULL DEFAULT 0,
  `nombrergr` varchar(100) NOT NULL DEFAULT '',
  `codtipdocr` varchar(100) NOT NULL DEFAULT '',
  `rucauxr` varchar(100) NOT NULL DEFAULT '',
  `autorizaesp` varchar(30) NOT NULL DEFAULT '',
  `idctbcab` int(11) NOT NULL DEFAULT 0,
  `pos_fecha` date NOT NULL DEFAULT '1900-01-01',
  `pos_codigo` varchar(2) NOT NULL DEFAULT '',
  `pos_turno` varchar(2) NOT NULL DEFAULT '',
  `pos_maquina` varchar(10) NOT NULL DEFAULT '',
  `recaudo_financiera` varchar(20) NOT NULL DEFAULT '',
  `recaudo_porcentaje` decimal(6,2) NOT NULL DEFAULT 0.00,
  `recaudo_monto` decimal(12,2) NOT NULL DEFAULT 0.00,
  `coddescglobal` varchar(2) NOT NULL DEFAULT '',
  `asiento` varchar(30) NOT NULL DEFAULT '',
  `idorigen` int(11) NOT NULL DEFAULT 0,
  `codori` varchar(2) NOT NULL DEFAULT '',
  `codctaigv1` varchar(10) NOT NULL DEFAULT '',
  `codctaigv2` varchar(10) NOT NULL DEFAULT '',
  `codctavt1` varchar(10) NOT NULL DEFAULT '',
  `codctavt2` varchar(10) NOT NULL DEFAULT '',
  `codctaco1` varchar(10) NOT NULL DEFAULT '',
  `codctaco2` varchar(10) NOT NULL DEFAULT '',
  `codctart41` varchar(10) NOT NULL DEFAULT '',
  `codctart42` varchar(10) NOT NULL DEFAULT '',
  `codctaho1` varchar(10) NOT NULL DEFAULT '',
  `codctaho2` varchar(10) NOT NULL DEFAULT '',
  `codctaigvc1` varchar(10) NOT NULL DEFAULT '',
  `codctaigvc2` varchar(10) NOT NULL DEFAULT '',
  `codctaret` varchar(10) NOT NULL DEFAULT '',
  `codctadet` varchar(10) NOT NULL DEFAULT '',
  `codctaper` varchar(10) NOT NULL DEFAULT '',
  `idconceptof` int(11) NOT NULL DEFAULT 0,
  `idcuentaf` int(11) NOT NULL DEFAULT 0,
  `bultos` decimal(12,2) NOT NULL DEFAULT 0.00,
  `idcomcabrp` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idcomcab`) USING BTREE,
  UNIQUE KEY `idcomcab` (`idcomcab`) USING BTREE,
  KEY `adm_procomcab` (`idcia`,`idtcom`,`idcom`,`codcom`,`sercom`,`numcom`,`version`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=51260 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procomcabcob`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcabcob`;
CREATE TABLE `adm_procomcabcob` (
  `idcomcabcob` int(11) NOT NULL AUTO_INCREMENT,
  `idcomcab` int(11) DEFAULT 0,
  `idforpag` int(11) DEFAULT 0,
  `fecha` date DEFAULT '1900-01-01',
  `idmoneda` int(11) DEFAULT 0,
  `importec` decimal(12,2) DEFAULT 0.00,
  `observac` varchar(100) DEFAULT '',
  PRIMARY KEY (`idcomcabcob`) USING BTREE,
  UNIQUE KEY `idcomcabcob` (`idcomcabcob`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomcabdet`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcabdet`;
CREATE TABLE `adm_procomcabdet` (
  `idcomcabdet` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idtcom` int(1) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `seccom` int(4) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `cantidad` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `costouni` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `costotot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `entsal` decimal(1,0) NOT NULL DEFAULT 0,
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  `saldoq` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `saldoc` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`idcomcabdet`) USING BTREE,
  UNIQUE KEY `idcomcabdet` (`idcomcabdet`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procomcabimp`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcabimp`;
CREATE TABLE `adm_procomcabimp` (
  `idcomcabimp` int(11) NOT NULL AUTO_INCREMENT,
  `idcomcab` int(11) DEFAULT 0,
  `id_costoimp` int(11) DEFAULT 0,
  `iddoc` int(11) DEFAULT 0,
  `serdoc` varchar(4) DEFAULT '',
  `numdoc` varchar(30) DEFAULT '',
  `importe` decimal(16,6) DEFAULT 0.000000,
  `idmoneda` int(11) DEFAULT 0,
  `tcambio` decimal(7,4) DEFAULT 0.0000,
  `importemn` decimal(16,6) DEFAULT 0.000000,
  PRIMARY KEY (`idcomcabimp`) USING BTREE,
  UNIQUE KEY `idcomcabimp` (`idcomcabimp`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomcabpag`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcabpag`;
CREATE TABLE `adm_procomcabpag` (
  `idcomcabpag` int(11) NOT NULL AUTO_INCREMENT,
  `idcomcab` int(11) DEFAULT 0,
  `secuen` int(11) DEFAULT 0,
  `importe` decimal(16,6) DEFAULT 0.000000,
  `idmoneda` int(11) DEFAULT 0,
  `fechav` date DEFAULT '1900-01-01',
  PRIMARY KEY (`idcomcabpag`) USING BTREE,
  UNIQUE KEY `idcomcabpag` (`idcomcabpag`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3741 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=FIXED;

-- ----------------------------
--  Table structure for `adm_procomcabreg`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomcabreg`;
CREATE TABLE `adm_procomcabreg` (
  `idcomcabreg` int(11) NOT NULL AUTO_INCREMENT,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `envia` varchar(255) NOT NULL DEFAULT '',
  `recibe` varchar(255) NOT NULL DEFAULT '',
  `estado` varchar(10) NOT NULL DEFAULT '',
  `nota` text NOT NULL,
  PRIMARY KEY (`idcomcabreg`) USING BTREE,
  UNIQUE KEY `idcomcabreg` (`idcomcabreg`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4156 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procomdet`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomdet`;
CREATE TABLE `adm_procomdet` (
  `idcomdet` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idtcom` int(11) NOT NULL DEFAULT 0,
  `opcion` varchar(5) NOT NULL DEFAULT '',
  `tipope` varchar(6) NOT NULL DEFAULT '',
  `idcom` int(11) NOT NULL DEFAULT 0,
  `tipdoc` varchar(2) NOT NULL DEFAULT '',
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `seccom` int(4) NOT NULL DEFAULT 0,
  `seccomd` int(4) NOT NULL DEFAULT 0,
  `version` decimal(4,0) NOT NULL DEFAULT 1,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `descripcion` text DEFAULT NULL,
  `cantidad` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `cantidadr` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `cantidads` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `precio` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `dsctod` decimal(6,2) NOT NULL DEFAULT 0.00,
  `descuentod` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `gratuitod` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `inafectod` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `exoneradod` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `exportad` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `afectod` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `igvd` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `icbperd` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `imported` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idauxiliars` int(11) NOT NULL DEFAULT 0,
  `idvendedor` int(11) NOT NULL DEFAULT 0,
  `codigotributo` varchar(6) NOT NULL DEFAULT '',
  `codigoafecta` varchar(6) NOT NULL DEFAULT '',
  `porigv` decimal(6,2) NOT NULL DEFAULT 0.00,
  `precom` decimal(1,0) NOT NULL DEFAULT 0,
  `login` varchar(255) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `fechlog` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `factor` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `facimp` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `idcomcabrd` int(11) NOT NULL DEFAULT 0,
  `idcomdetrd` int(11) NOT NULL DEFAULT 0,
  `idcomcabrp` int(11) NOT NULL DEFAULT 0,
  `tipo` decimal(1,0) NOT NULL DEFAULT 0,
  `cantidada` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadra` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadsa` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idproductor` int(11) NOT NULL DEFAULT 0,
  `idcanal` int(11) NOT NULL DEFAULT 0,
  `item` varchar(7) NOT NULL DEFAULT '',
  `costou` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `costot` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `imagen` varchar(255) NOT NULL DEFAULT '',
  `tal_0001` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0002` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0003` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0004` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0005` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0006` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0007` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0008` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0009` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0010` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0011` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0012` decimal(2,0) NOT NULL DEFAULT 0,
  `can_0001` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0002` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0003` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0004` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0005` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0006` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0007` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0008` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0009` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0010` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0011` decimal(5,0) NOT NULL DEFAULT 0,
  `can_0012` decimal(5,0) NOT NULL DEFAULT 0,
  `idproductoplt1` int(11) NOT NULL DEFAULT 0,
  `talp1_0001` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0002` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0003` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0004` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0005` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0006` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0007` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0008` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0009` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0010` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0011` decimal(2,0) NOT NULL DEFAULT 0,
  `talp1_0012` decimal(2,0) NOT NULL DEFAULT 0,
  `canp1_0001` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0002` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0003` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0004` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0005` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0006` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0007` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0008` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0009` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0010` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0011` decimal(5,0) NOT NULL DEFAULT 0,
  `canp1_0012` decimal(5,0) NOT NULL DEFAULT 0,
  `idproductoplt2` int(11) NOT NULL DEFAULT 0,
  `talp2_0001` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0002` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0003` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0004` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0005` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0006` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0007` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0008` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0009` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0010` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0011` decimal(2,0) NOT NULL DEFAULT 0,
  `talp2_0012` decimal(2,0) NOT NULL DEFAULT 0,
  `canp2_0001` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0002` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0003` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0004` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0005` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0006` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0007` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0008` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0009` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0010` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0011` decimal(5,0) NOT NULL DEFAULT 0,
  `canp2_0012` decimal(5,0) NOT NULL DEFAULT 0,
  `observacion` varchar(100) NOT NULL DEFAULT '',
  `cantxbulto` decimal(10,2) NOT NULL DEFAULT 0.00,
  `bultos` decimal(12,2) NOT NULL DEFAULT 0.00,
  `texto01` varchar(100) NOT NULL DEFAULT '',
  `texto02` varchar(100) NOT NULL DEFAULT '',
  `texto03` varchar(100) NOT NULL DEFAULT '',
  `texto04` varchar(100) NOT NULL DEFAULT '',
  `texto05` varchar(100) NOT NULL DEFAULT '',
  `texto06` varchar(100) NOT NULL DEFAULT '',
  `texto07` varchar(100) NOT NULL DEFAULT '',
  `texto08` varchar(100) NOT NULL DEFAULT '',
  `texto09` varchar(100) NOT NULL DEFAULT '',
  `texto10` varchar(100) NOT NULL DEFAULT '',
  `texto11` varchar(100) NOT NULL DEFAULT '',
  `texto12` varchar(100) NOT NULL DEFAULT '',
  `texto13` varchar(100) NOT NULL DEFAULT '',
  `texto14` varchar(100) NOT NULL DEFAULT '',
  `texto15` varchar(100) NOT NULL DEFAULT '',
  `texto16` varchar(100) NOT NULL DEFAULT '',
  `texto17` varchar(500) NOT NULL DEFAULT '',
  `texto18` varchar(100) NOT NULL DEFAULT '',
  `texto19` varchar(100) NOT NULL DEFAULT '',
  `texto20` varchar(200) NOT NULL DEFAULT '',
  `texto21` varchar(100) NOT NULL DEFAULT '',
  `peso` decimal(10,2) NOT NULL DEFAULT 0.00,
  `unidadp` varchar(3) NOT NULL DEFAULT '',
  `idauxiliarpa` int(11) NOT NULL DEFAULT 0,
  `estadoprod` varchar(10) NOT NULL DEFAULT '',
  `fechahorapa` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `fechahoraep` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `iddocumentootc` int(11) NOT NULL DEFAULT 0,
  `certificado` varchar(50) NOT NULL DEFAULT '',
  `iddocumentooti` int(11) NOT NULL DEFAULT 0,
  `informe` varchar(50) NOT NULL DEFAULT '',
  `prioridad` int(1) NOT NULL DEFAULT 0,
  `seguridad` varchar(50) NOT NULL DEFAULT '',
  `seguridadu` varchar(50) NOT NULL DEFAULT '',
  `fcalibra` date NOT NULL DEFAULT '1900-01-01',
  `pfcalibra` date NOT NULL DEFAULT '1900-01-01',
  `coddesclineal` varchar(2) NOT NULL DEFAULT '',
  `estado` varchar(10) NOT NULL DEFAULT '',
  `situacion` varchar(10) NOT NULL DEFAULT '',
  `codctai` varchar(10) NOT NULL DEFAULT '',
  `codctas` varchar(10) NOT NULL DEFAULT '',
  `codctav` varchar(10) NOT NULL DEFAULT '',
  `codctac` varchar(10) NOT NULL DEFAULT '',
  `estadoemi` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcomdet`) USING BTREE,
  UNIQUE KEY `idcomdet` (`idcomdet`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=137875 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procomdetestprod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomdetestprod`;
CREATE TABLE `adm_procomdetestprod` (
  `idestprod` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idcomdet` int(11) NOT NULL,
  `idauxiliarpa` int(11) NOT NULL DEFAULT 0,
  `estadoprod` varchar(10) NOT NULL DEFAULT '',
  `fechahorapa` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `fechahoraep` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `actividad` text NOT NULL,
  `login` varchar(150) NOT NULL DEFAULT '',
  `tipo` varchar(1) NOT NULL DEFAULT '',
  PRIMARY KEY (`idestprod`),
  UNIQUE KEY `idestprod` (`idestprod`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomdetprod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomdetprod`;
CREATE TABLE `adm_procomdetprod` (
  `idcomdetp` int(11) NOT NULL AUTO_INCREMENT,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idprocesop` int(11) NOT NULL DEFAULT 0,
  `chkinicio` int(1) NOT NULL DEFAULT 0,
  `inicio` date NOT NULL DEFAULT '1900-01-01',
  `chkfinal` int(1) NOT NULL DEFAULT 0,
  `final` date NOT NULL DEFAULT '1900-01-01',
  `idauxiliarr` int(11) NOT NULL DEFAULT 0,
  `tiempos` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tiempor` decimal(12,2) NOT NULL DEFAULT 0.00,
  `observaciones` varchar(100) NOT NULL DEFAULT '',
  `chkfechap` int(1) NOT NULL DEFAULT 0,
  `fechap` date NOT NULL DEFAULT '1900-01-01',
  PRIMARY KEY (`idcomdetp`),
  UNIQUE KEY `idcomdetp` (`idcomdetp`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomdoc`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomdoc`;
CREATE TABLE `adm_procomdoc` (
  `idcomdoc` int(11) NOT NULL AUTO_INCREMENT,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `fld_filename` varchar(255) NOT NULL DEFAULT '',
  `fld_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `fld_username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcomdoc`) USING BTREE,
  UNIQUE KEY `idcomdoc` (`idcomdoc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1870 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procomimg`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomimg`;
CREATE TABLE `adm_procomimg` (
  `idcomimg` int(11) NOT NULL AUTO_INCREMENT,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `fld_filename` varchar(255) NOT NULL DEFAULT '',
  `fld_date` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `fld_username` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idcomimg`),
  UNIQUE KEY `idcomimg` (`idcomimg`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_procomtal`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procomtal`;
CREATE TABLE `adm_procomtal` (
  `idcomtal` int(11) NOT NULL AUTO_INCREMENT,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tal_0001` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0002` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0003` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0004` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0005` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0006` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0007` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0008` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0009` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0010` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0011` decimal(2,0) NOT NULL DEFAULT 0,
  `tal_0012` decimal(2,0) NOT NULL DEFAULT 0,
  `can_0001` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0002` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0003` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0004` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0005` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0006` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0007` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0008` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0009` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0010` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0011` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `can_0012` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0001` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0002` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0003` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0004` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0005` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0006` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0007` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0008` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0009` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0010` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0011` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `ate_0012` decimal(12,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`idcomtal`) USING BTREE,
  UNIQUE KEY `idcomtal` (`idcomtal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_procostoprod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_procostoprod`;
CREATE TABLE `adm_procostoprod` (
  `idproduccion` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) DEFAULT 0,
  `anho` decimal(4,0) DEFAULT 0,
  `mes` decimal(2,0) DEFAULT 0,
  `idalmacen` int(11) DEFAULT 0,
  `idccosto` int(11) DEFAULT 0,
  `idproducto` int(11) DEFAULT 0,
  `idunidad` int(11) DEFAULT 0,
  `cantidadini` decimal(14,4) DEFAULT 0.0000,
  `costouini` decimal(16,6) DEFAULT 0.000000,
  `costotini` decimal(12,2) DEFAULT 0.00,
  `cantidadaju` decimal(14,4) DEFAULT 0.0000,
  `costouaju` decimal(16,6) DEFAULT 0.000000,
  `costotaju` decimal(12,2) DEFAULT 0.00,
  `cantidading` decimal(14,4) DEFAULT 0.0000,
  `costouing` decimal(16,6) DEFAULT 0.000000,
  `costoting` decimal(12,2) DEFAULT 0.00,
  `cantidadsal` decimal(14,4) DEFAULT 0.0000,
  `costousal` decimal(16,6) DEFAULT 0.000000,
  `costotsal` decimal(12,2) DEFAULT 0.00,
  `cantidadfin` decimal(14,4) DEFAULT 0.0000,
  `costoufin` decimal(16,6) DEFAULT 0.000000,
  `costotfin` decimal(12,2) DEFAULT 0.00,
  PRIMARY KEY (`idproduccion`),
  UNIQUE KEY `idproduccion` (`idproduccion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_proctacte`
-- ----------------------------
DROP TABLE IF EXISTS `adm_proctacte`;
CREATE TABLE `adm_proctacte` (
  `idctacte` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `hora` time NOT NULL DEFAULT '00:00:00',
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `importe` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importef` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `idcuenta` int(11) NOT NULL DEFAULT 0,
  `idconcepto` int(11) NOT NULL DEFAULT 0,
  `idforpag` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `entsal` decimal(1,0) NOT NULL DEFAULT 0,
  `calculo` decimal(1,0) NOT NULL DEFAULT 0,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `pos_fecha` date NOT NULL DEFAULT '1900-01-01',
  `pos_codigo` varchar(2) NOT NULL DEFAULT '',
  `pos_turno` varchar(2) NOT NULL DEFAULT '',
  `pos_maquina` varchar(10) NOT NULL DEFAULT '',
  `login` varchar(255) NOT NULL DEFAULT '',
  `host` varchar(255) NOT NULL DEFAULT '',
  `fechlog` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `idorigen` int(11) NOT NULL DEFAULT 0,
  `codori` varchar(2) NOT NULL DEFAULT '',
  `codcta1` varchar(10) NOT NULL DEFAULT '',
  `codcta2` varchar(10) NOT NULL DEFAULT '',
  `codcta` varchar(10) NOT NULL DEFAULT '',
  `estado` varchar(10) NOT NULL DEFAULT '',
  `idtipog` int(11) NOT NULL DEFAULT 0,
  `idcategoriag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idctacte`) USING BTREE,
  UNIQUE KEY `idctacte` (`idctacte`) USING BTREE,
  KEY `adm_proctacte` (`idcia`,`idcom`,`codcom`,`sercom`,`numcom`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_proctacteeya`
-- ----------------------------
DROP TABLE IF EXISTS `adm_proctacteeya`;
CREATE TABLE `adm_proctacteeya` (
  `idctacteeya` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `tipof` varchar(1) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `idcuenta` int(11) NOT NULL DEFAULT 0,
  `idconcepto` int(11) NOT NULL DEFAULT 0,
  `codforpag` varchar(2) NOT NULL DEFAULT '',
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `entsal` tinyint(1) NOT NULL DEFAULT 0,
  `importeip` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importei` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importesp` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importes` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importexc` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importexp` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `pos_fecha` date NOT NULL DEFAULT '1900-01-01',
  `pos_turno` varchar(2) NOT NULL DEFAULT '',
  `pos_codigo` varchar(2) NOT NULL DEFAULT '',
  `estado` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`idctacteeya`),
  UNIQUE KEY `idctacteeya` (`idctacteeya`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_promovimprod`
-- ----------------------------
DROP TABLE IF EXISTS `adm_promovimprod`;
CREATE TABLE `adm_promovimprod` (
  `idproductoprd` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) DEFAULT 0,
  `anho` decimal(4,0) DEFAULT 0,
  `mes` decimal(2,0) DEFAULT 0,
  `idalmacen` int(11) DEFAULT 0,
  `idccosto` int(11) DEFAULT 0,
  `idfamilia` int(11) DEFAULT 0,
  `idproducto` int(11) DEFAULT 0,
  `idunidad` int(11) DEFAULT 0,
  `cantini` decimal(10,2) DEFAULT 0.00,
  `cunitini` decimal(12,4) DEFAULT 0.0000,
  `ctotini` decimal(12,2) DEFAULT 0.00,
  `cantaju` decimal(10,2) DEFAULT 0.00,
  `cunitaju` decimal(12,4) DEFAULT 0.0000,
  `ctotaju` decimal(12,2) DEFAULT 0.00,
  `canting` decimal(10,2) DEFAULT 0.00,
  `cuniting` decimal(12,4) DEFAULT 0.0000,
  `ctoting` decimal(12,2) DEFAULT 0.00,
  `cantsal` decimal(10,2) DEFAULT 0.00,
  `cunitsal` decimal(12,4) DEFAULT 0.0000,
  `ctotsal` decimal(12,2) DEFAULT 0.00,
  `cantfin` decimal(10,2) DEFAULT 0.00,
  `cunitfin` decimal(12,4) DEFAULT 0.0000,
  `ctotfin` decimal(12,2) DEFAULT 0.00,
  `codigo` varchar(20) DEFAULT '',
  `peso` decimal(6,2) DEFAULT 0.00,
  `idproductoprod` int(11) DEFAULT 0,
  PRIMARY KEY (`idproductoprd`) USING BTREE,
  UNIQUE KEY `idproductoprd` (`idproductoprd`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repalmacenaingmir`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repalmacenaingmir`;
CREATE TABLE `adm_repalmacenaingmir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `cantidad` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidads` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadesp` decimal(5,0) NOT NULL DEFAULT 0,
  `diasesp` decimal(3,0) NOT NULL DEFAULT 0,
  `precioesp` decimal(12,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repalmacenaingsalmir`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repalmacenaingsalmir`;
CREATE TABLE `adm_repalmacenaingsalmir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `fechai` date NOT NULL DEFAULT '1900-01-01',
  `idcomdeti` int(11) NOT NULL DEFAULT 0,
  `codcomi` varchar(6) NOT NULL DEFAULT '',
  `sercomi` varchar(4) NOT NULL DEFAULT '',
  `numcomi` varchar(30) NOT NULL DEFAULT '',
  `cantidadi` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `fechas` date NOT NULL DEFAULT '1900-01-01',
  `idcomdets` int(11) NOT NULL DEFAULT 0,
  `codcoms` varchar(6) NOT NULL DEFAULT '',
  `sercoms` varchar(4) NOT NULL DEFAULT '',
  `numcoms` varchar(30) NOT NULL DEFAULT '',
  `cantidads` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadesp` decimal(5,0) NOT NULL DEFAULT 0,
  `cantidadespis` decimal(5,0) NOT NULL DEFAULT 0,
  `diasesp` decimal(3,0) NOT NULL DEFAULT 0,
  `diasespis` decimal(3,0) NOT NULL DEFAULT 0,
  `precioesp` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `precioespis` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repalmacenasalmir`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repalmacenasalmir`;
CREATE TABLE `adm_repalmacenasalmir` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `cantidad` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidadc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `cantidads` decimal(14,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repbit`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repbit`;
CREATE TABLE `adm_repbit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) NOT NULL,
  `archivo` varchar(20) NOT NULL,
  `tabla` varchar(20) NOT NULL DEFAULT '',
  `enlace` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repbit10ventas`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repbit10ventas`;
CREATE TABLE `adm_repbit10ventas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `cliente` varchar(12) NOT NULL DEFAULT '',
  `vendedor` varchar(12) NOT NULL DEFAULT '',
  `producto` varchar(20) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `documento` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `valor` decimal(16,4) NOT NULL DEFAULT 0.0000,
  `tipo` varchar(1) NOT NULL DEFAULT '',
  `costo` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `unidad` varchar(6) NOT NULL DEFAULT '',
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `moneda` varchar(3) NOT NULL DEFAULT '',
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repcajac`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcajac`;
CREATE TABLE `adm_repcajac` (
  `idrcajac` int(11) NOT NULL,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `responsable` varchar(100) NOT NULL DEFAULT '',
  `saldoi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `saldof` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`idrcajac`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repcajad`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcajad`;
CREATE TABLE `adm_repcajad` (
  `idrcajad` int(11) NOT NULL,
  `idrcajac` int(11) NOT NULL DEFAULT 0,
  `secuen` decimal(4,0) NOT NULL DEFAULT 0,
  `tipo` varchar(10) NOT NULL DEFAULT '',
  `detalle` varchar(255) NOT NULL DEFAULT '',
  `moneda` varchar(3) NOT NULL DEFAULT '',
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `tcambio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `importemn` decimal(12,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`idrcajad`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repcomcabdet`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdet`;
CREATE TABLE `adm_repcomcabdet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idcom` int(11) NOT NULL,
  `comprobante` varchar(42) NOT NULL,
  `fecha` date NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `tcambio` decimal(7,4) NOT NULL,
  `idauxiliar` int(11) NOT NULL,
  `inafecto1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `exonerado1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `afecto1` decimal(16,6) NOT NULL,
  `descuentot1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `igv1` decimal(16,6) NOT NULL,
  `honorario1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `renta1` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importe1` decimal(16,6) NOT NULL,
  `inafecto2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `exonerado2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `afecto2` decimal(16,6) NOT NULL,
  `descuentot2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `igv2` decimal(16,6) NOT NULL,
  `honorario2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `renta2` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importe2` decimal(16,6) NOT NULL,
  `inafectot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `exoneradot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `afectot` decimal(16,6) NOT NULL,
  `descuentot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `igvt` decimal(16,6) NOT NULL,
  `honorariot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `rentat` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `importet` decimal(16,6) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `idauxiliars` int(11) NOT NULL DEFAULT 0,
  `idcdp` int(11) NOT NULL DEFAULT 0,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `idcomcabrp` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `partida` varchar(20) NOT NULL,
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `fechad` date NOT NULL DEFAULT '1900-01-01',
  `nrodet` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `fecdet` date NOT NULL DEFAULT '1900-01-01',
  `correl` varchar(15) NOT NULL DEFAULT '',
  `tcomsub` varchar(10) NOT NULL DEFAULT '',
  `estadoemi` varchar(10) NOT NULL DEFAULT '',
  `referencia2` varchar(100) NOT NULL DEFAULT '',
  `referencia3` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1410615 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetauxpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetauxpro`;
CREATE TABLE `adm_repcomcabdetauxpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idcom` int(11) NOT NULL,
  `comprobante` varchar(47) NOT NULL,
  `fecha` date NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `tcambio` decimal(7,4) NOT NULL,
  `idauxiliar` int(11) NOT NULL,
  `inafecto1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `exonerado1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afecto1` decimal(12,2) NOT NULL,
  `descuento1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igv1` decimal(12,2) NOT NULL,
  `importe1` decimal(12,2) NOT NULL,
  `inafecto2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `exonerado2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afecto2` decimal(12,2) NOT NULL,
  `descuento2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igv2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe2` decimal(12,2) NOT NULL,
  `inafectot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `exoneradot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afectot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `descuentot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igvt` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `estado` varchar(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `idcomdet` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `familia` varchar(40) NOT NULL DEFAULT '',
  `linea` varchar(40) NOT NULL DEFAULT '',
  `grupo` varchar(40) NOT NULL DEFAULT '',
  `marca` varchar(40) NOT NULL DEFAULT '',
  `cantidad` decimal(14,4) NOT NULL,
  `precio` decimal(14,4) NOT NULL,
  `idvendedor` int(11) NOT NULL DEFAULT 0,
  `idauxiliarsd` int(11) NOT NULL DEFAULT 0,
  `idproductoser` int(11) NOT NULL DEFAULT 0,
  `idproductomod` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `fechad` date NOT NULL DEFAULT '1900-01-01',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetjp`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetjp`;
CREATE TABLE `adm_repcomcabdetjp` (
  `id` int(11) NOT NULL DEFAULT 0,
  `login` varchar(255) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `numcomp` varchar(30) NOT NULL DEFAULT '',
  `numcomf` varchar(30) NOT NULL DEFAULT '',
  `numcomg` varchar(30) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `cantidad` decimal(10,0) NOT NULL DEFAULT 0,
  `precio` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importe` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `flete` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importef` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idcdp` int(11) NOT NULL DEFAULT 0,
  `estado` varchar(10) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetpago`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetpago`;
CREATE TABLE `adm_repcomcabdetpago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idmoneda` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `idcdp` int(11) NOT NULL DEFAULT 0,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `idforpag` int(11) NOT NULL DEFAULT 0,
  `idtiptar` int(11) NOT NULL DEFAULT 0,
  `observac` varchar(100) NOT NULL DEFAULT '',
  `importet` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `suvuelto` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `pago` decimal(1,0) NOT NULL DEFAULT 0,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetpro`;
CREATE TABLE `adm_repcomcabdetpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idcom` int(11) NOT NULL,
  `comprobante` varchar(47) NOT NULL,
  `fecha` date NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `tcambio` decimal(7,4) NOT NULL,
  `exonerado1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `inafecto1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afecto1` decimal(12,2) NOT NULL,
  `descuento1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igv1` decimal(12,2) NOT NULL,
  `importe1` decimal(12,2) NOT NULL,
  `exonerado2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `inafecto2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afecto2` decimal(12,2) NOT NULL,
  `descuento2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igv2` decimal(12,2) NOT NULL,
  `importe2` decimal(12,2) NOT NULL,
  `exoneradot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `inafectot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `afectot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `descuentot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `igvt` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importet` decimal(12,2) NOT NULL DEFAULT 0.00,
  `estado` varchar(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `idcomdet` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `cantidad` decimal(14,4) NOT NULL,
  `precio` decimal(14,4) NOT NULL,
  `dscto` decimal(6,2) NOT NULL DEFAULT 0.00,
  `idproductoser` int(11) NOT NULL DEFAULT 0,
  `idproductomod` int(11) NOT NULL DEFAULT 0,
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  `idlinea` int(11) NOT NULL DEFAULT 0,
  `idgrupo` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `codaux` varchar(12) NOT NULL DEFAULT '',
  `razaux` varchar(100) NOT NULL DEFAULT '',
  `idvendedor` int(11) NOT NULL DEFAULT 0,
  `codven` varchar(12) NOT NULL DEFAULT '',
  `razven` varchar(100) NOT NULL DEFAULT '',
  `idcategoriaaux` int(11) NOT NULL DEFAULT 0,
  `idcanal` int(11) NOT NULL DEFAULT 0,
  `descripcion` text NOT NULL,
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `compro` varchar(50) NOT NULL DEFAULT '',
  `comrel` varchar(50) NOT NULL DEFAULT '',
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `costot1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `costotc1` decimal(12,2) NOT NULL DEFAULT 0.00,
  `seccom` decimal(4,0) NOT NULL DEFAULT 0,
  `costot2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `costotc2` decimal(12,2) NOT NULL DEFAULT 0.00,
  `fechav` date NOT NULL DEFAULT '1900-01-01',
  `fechad` date NOT NULL DEFAULT '1900-01-01',
  `costou` decimal(12,4) NOT NULL DEFAULT 0.0000,
  `costot` decimal(12,2) NOT NULL DEFAULT 0.00,
  `idforpag1` int(11) NOT NULL DEFAULT 0,
  `idforpag2` int(11) NOT NULL DEFAULT 0,
  `idforpag3` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=33933 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetprores`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetprores`;
CREATE TABLE `adm_repcomcabdetprores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `costotcajmn` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `costotbolmn` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `cosunicajmn` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `cosunibolmn` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `costotcajme` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `costotbolme` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `cosunicajme` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `cosunibolme` decimal(14,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repcomcabdetvenpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repcomcabdetvenpro`;
CREATE TABLE `adm_repcomcabdetvenpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idcom` int(11) NOT NULL,
  `comprobante` varchar(47) NOT NULL,
  `fecha` date NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `tcambio` decimal(7,4) NOT NULL,
  `idvendedor` int(11) NOT NULL,
  `afecto1` decimal(12,2) NOT NULL,
  `igv1` decimal(12,2) NOT NULL,
  `importe1` decimal(12,2) NOT NULL,
  `afecto2` decimal(12,2) NOT NULL,
  `igv2` decimal(12,2) NOT NULL,
  `importe2` decimal(12,2) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `login` varchar(255) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `idcomdet` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `cantidad` decimal(14,4) NOT NULL,
  `precio` decimal(14,4) NOT NULL,
  `idauxiliarsd` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repctacte`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repctacte`;
CREATE TABLE `adm_repctacte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idauxiliar` int(11) NOT NULL,
  `comprobante` varchar(42) NOT NULL,
  `fecha` date NOT NULL,
  `idmoneda` int(11) NOT NULL,
  `tcambio` decimal(7,4) NOT NULL,
  `importef` decimal(14,4) NOT NULL,
  `importec` decimal(14,4) NOT NULL,
  `importes` decimal(14,4) NOT NULL,
  `fechar` date NOT NULL DEFAULT '1900-01-01',
  `fechav` date NOT NULL,
  `diasatras` decimal(11,0) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idcomcab` int(11) NOT NULL,
  `idcom` int(11) NOT NULL,
  `codcom` varchar(6) NOT NULL,
  `sercom` varchar(4) NOT NULL,
  `numcom` varchar(30) NOT NULL,
  `login` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3621 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repestxaux`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxaux`;
CREATE TABLE `adm_repestxaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74596 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxauxfam`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxauxfam`;
CREATE TABLE `adm_repestxauxfam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxauxpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxauxpro`;
CREATE TABLE `adm_repestxauxpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxcomp`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxcomp`;
CREATE TABLE `adm_repestxcomp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comprobante` varchar(10) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1364 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxfam`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxfam`;
CREATE TABLE `adm_repestxfam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(10,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxpro`;
CREATE TABLE `adm_repestxpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(10,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=108665 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxven`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxven`;
CREATE TABLE `adm_repestxven` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxvenaux`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxvenaux`;
CREATE TABLE `adm_repestxvenaux` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idauxiliarv` int(11) NOT NULL DEFAULT 0,
  `razonsv` varchar(100) NOT NULL DEFAULT '',
  `nombrev` varchar(100) NOT NULL DEFAULT '',
  `rucauxv` varchar(12) NOT NULL DEFAULT '',
  `idauxiliara` int(11) NOT NULL DEFAULT 0,
  `razonsa` varchar(100) NOT NULL DEFAULT '',
  `nombrea` varchar(100) NOT NULL DEFAULT '',
  `rucauxa` varchar(12) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxvenfam`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxvenfam`;
CREATE TABLE `adm_repestxvenfam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  `idfamilia` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repestxvenpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repestxvenpro`;
CREATE TABLE `adm_repestxvenpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `razons` varchar(100) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `mes` varchar(12) NOT NULL DEFAULT '',
  `cantidad` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importe` decimal(12,2) NOT NULL DEFAULT 0.00,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repimprimecert`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repimprimecert`;
CREATE TABLE `adm_repimprimecert` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `numero` int(3) NOT NULL DEFAULT 0,
  `orden` varchar(15) NOT NULL DEFAULT '',
  `certificado` varchar(50) NOT NULL DEFAULT '',
  `razons` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_replistacon`
-- ----------------------------
DROP TABLE IF EXISTS `adm_replistacon`;
CREATE TABLE `adm_replistacon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `tipo` varchar(1) NOT NULL DEFAULT '',
  `reporte` varchar(100) NOT NULL DEFAULT '',
  `archivo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_replistaple`
-- ----------------------------
DROP TABLE IF EXISTS `adm_replistaple`;
CREATE TABLE `adm_replistaple` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `tipo` varchar(1) NOT NULL DEFAULT '',
  `sec` varchar(1) NOT NULL DEFAULT '',
  `reporte` varchar(100) NOT NULL DEFAULT '',
  `archivo` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repmovcb`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repmovcb`;
CREATE TABLE `adm_repmovcb` (
  `idrepmovcb` int(11) NOT NULL AUTO_INCREMENT,
  `comprobante` varchar(42) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `referencia` varchar(40) NOT NULL DEFAULT '',
  `importei` decimal(12,2) NOT NULL DEFAULT 0.00,
  `importes` decimal(12,2) NOT NULL DEFAULT 0.00,
  `saldof` decimal(12,2) NOT NULL DEFAULT 0.00,
  `idconcepto` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `comprobanter` varchar(42) NOT NULL DEFAULT '',
  `idsuc` int(11) NOT NULL,
  `idcia` int(11) NOT NULL,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`idrepmovcb`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repmovimalmpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repmovimalmpro`;
CREATE TABLE `adm_repmovimalmpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `comprobante` varchar(50) NOT NULL,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `ingreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `egreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldo` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `fechai` date NOT NULL DEFAULT '1900-01-01',
  `fechaf` date NOT NULL DEFAULT '1900-01-01',
  `unitario` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `ingresoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `egresoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `codope` varchar(2) NOT NULL DEFAULT '',
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `idcomdetr` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=17067939 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repmovimalmproa`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repmovimalmproa`;
CREATE TABLE `adm_repmovimalmproa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `comprobante` varchar(50) NOT NULL,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `ingreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `egreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldo` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `fechai` date NOT NULL DEFAULT '1900-01-01',
  `fechaf` date NOT NULL DEFAULT '1900-01-01',
  `unitario` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `ingresoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `egresoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldoc` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `codope` varchar(2) NOT NULL DEFAULT '',
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `idcomdetr` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3633005 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repsaldoalmpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repsaldoalmpro`;
CREATE TABLE `adm_repsaldoalmpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `ingreso` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `egreso` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldo` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repsaldoalmproa`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repsaldoalmproa`;
CREATE TABLE `adm_repsaldoalmproa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `ingreso` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `egreso` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldo` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `unitario` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `ingresoc` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `egresoc` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `saldoc` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idsegmentop` int(11) NOT NULL DEFAULT 0,
  `idfamiliap` int(11) NOT NULL DEFAULT 0,
  `idclasep` int(11) NOT NULL DEFAULT 0,
  `idmarca` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repsalpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repsalpro`;
CREATE TABLE `adm_repsalpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `alterno` varchar(60) NOT NULL DEFAULT '',
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `idalmacen` int(11) NOT NULL DEFAULT 0,
  `desalm` varchar(30) NOT NULL DEFAULT '',
  `ingreso` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `egreso` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `saldo` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `costot` decimal(16,6) NOT NULL DEFAULT 0.000000,
  `login` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `adm_repsitcom`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repsitcom`;
CREATE TABLE `adm_repsitcom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL DEFAULT '',
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcomdet` int(11) NOT NULL DEFAULT 0,
  `comprobante` varchar(50) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `cliente` varchar(100) NOT NULL DEFAULT '',
  `clienteruc` varchar(12) NOT NULL DEFAULT '',
  `productocod` varchar(20) NOT NULL DEFAULT '',
  `productoalt` varchar(60) NOT NULL DEFAULT '',
  `unidad` varchar(6) NOT NULL DEFAULT '',
  `descripcion` varchar(255) NOT NULL DEFAULT '',
  `cantidad` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precio` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idcomcabr` int(11) NOT NULL DEFAULT 0,
  `idcomdetr` int(11) NOT NULL DEFAULT 0,
  `comprobanter` varchar(50) NOT NULL DEFAULT '',
  `fechar` date NOT NULL DEFAULT '1900-01-01',
  `clienter` varchar(100) NOT NULL DEFAULT '',
  `clienterucr` varchar(12) NOT NULL DEFAULT '',
  `productocodr` varchar(20) NOT NULL DEFAULT '',
  `productoaltr` varchar(60) NOT NULL DEFAULT '',
  `unidadr` varchar(6) NOT NULL DEFAULT '',
  `descripcionr` varchar(255) NOT NULL DEFAULT '',
  `cantidadr` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precior` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldor` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idcomcabr2` int(11) NOT NULL DEFAULT 0,
  `idcomdetr2` int(11) NOT NULL DEFAULT 0,
  `comprobanter2` varchar(50) NOT NULL DEFAULT '',
  `fechar2` date NOT NULL DEFAULT '1900-01-01',
  `clienter2` varchar(100) NOT NULL DEFAULT '',
  `clienterucr2` varchar(12) NOT NULL DEFAULT '',
  `productocodr2` varchar(20) NOT NULL,
  `productoaltr2` varchar(60) NOT NULL DEFAULT '',
  `unidadr2` varchar(6) NOT NULL DEFAULT '',
  `descripcionr2` varchar(255) NOT NULL DEFAULT '',
  `cantidadr2` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `precior2` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldor2` decimal(14,6) NOT NULL DEFAULT 0.000000,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=270475 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `adm_repstockalmpro`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repstockalmpro`;
CREATE TABLE `adm_repstockalmpro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idalmacen` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `inicial` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `ingreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `egreso` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `saldo` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `inicialc` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `ingresoc` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `egresoc` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `saldoc` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `fechai` date NOT NULL,
  `fechaf` date NOT NULL,
  `unitario` decimal(14,6) NOT NULL DEFAULT 0.000000,
  `idccosto` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1061244 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `adm_repstockmanproducto`
-- ----------------------------
DROP TABLE IF EXISTS `adm_repstockmanproducto`;
CREATE TABLE `adm_repstockmanproducto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `idcia` int(11) NOT NULL,
  `idsuc` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `idunidad` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL DEFAULT '',
  `nombre` varchar(120) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=1061244 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- ----------------------------
--  Table structure for `com_manauxiliar`
-- ----------------------------
DROP TABLE IF EXISTS `com_manauxiliar`;
CREATE TABLE `com_manauxiliar` (
  `idauxiliar` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `codaux` varchar(12) NOT NULL DEFAULT '',
  `razaux` varchar(100) NOT NULL DEFAULT '',
  `nomcom` varchar(100) NOT NULL DEFAULT '',
  `paterno` varchar(30) NOT NULL DEFAULT '',
  `materno` varchar(30) NOT NULL DEFAULT '',
  `nombre` varchar(20) NOT NULL DEFAULT '',
  `nombre2` varchar(20) NOT NULL DEFAULT '',
  `diraux` varchar(100) NOT NULL DEFAULT '',
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `rucaux` varchar(12) NOT NULL DEFAULT '',
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `codprv` varchar(6) NOT NULL DEFAULT '',
  `coddis` varchar(6) NOT NULL DEFAULT '',
  `emaaux` varchar(100) NOT NULL DEFAULT '',
  `webaux` varchar(100) NOT NULL DEFAULT '',
  `condpago` varchar(2) NOT NULL DEFAULT '',
  `conaux` varchar(60) NOT NULL DEFAULT '',
  `caraux` varchar(60) NOT NULL DEFAULT '',
  `telaux` varchar(20) NOT NULL DEFAULT '',
  `faxaux` varchar(20) NOT NULL DEFAULT '',
  `movaux` varchar(40) NOT NULL DEFAULT '',
  `idvendedor` int(11) NOT NULL DEFAULT 0,
  `codtipdoc` varchar(2) NOT NULL DEFAULT '',
  `codperjur` varchar(2) NOT NULL DEFAULT '',
  `indcli` int(1) NOT NULL DEFAULT 0,
  `indpro` int(1) NOT NULL DEFAULT 0,
  `indper` int(1) NOT NULL DEFAULT 0,
  `indotr` int(1) NOT NULL DEFAULT 0,
  `indven` int(1) NOT NULL DEFAULT 0,
  `ingreso` date NOT NULL DEFAULT '1900-01-01',
  `egreso` date NOT NULL DEFAULT '1900-01-01',
  `codcta` varchar(10) NOT NULL DEFAULT '',
  `codctar` varchar(10) NOT NULL DEFAULT '',
  `codctac` varchar(10) NOT NULL DEFAULT '',
  `codctacr` varchar(10) NOT NULL DEFAULT '',
  `idcateg` int(11) NOT NULL DEFAULT 0,
  `idscateg` int(11) NOT NULL DEFAULT 0,
  `ctaaux` varchar(30) NOT NULL DEFAULT '',
  `bcoaux` varchar(6) NOT NULL DEFAULT '',
  `detaux` varchar(30) NOT NULL DEFAULT '',
  `dianac` decimal(2,0) NOT NULL DEFAULT 0,
  `mesnac` decimal(2,0) NOT NULL DEFAULT 0,
  `login` varchar(255) NOT NULL DEFAULT '',
  `recepcion` text DEFAULT NULL,
  `cuenta1` varchar(100) NOT NULL DEFAULT '',
  `cuenta2` varchar(100) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idauxiliar`) USING BTREE,
  UNIQUE KEY `com_manauxiliar1` (`idcia`,`codaux`,`rucaux`) USING BTREE,
  UNIQUE KEY `com_manauxiliar2` (`idcia`,`rucaux`,`codaux`) USING BTREE,
  UNIQUE KEY `com_manauxiliar3` (`idauxiliar`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3426 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manauxiliarp`
-- ----------------------------
DROP TABLE IF EXISTS `com_manauxiliarp`;
CREATE TABLE `com_manauxiliarp` (
  `idauxiliarp` int(11) NOT NULL AUTO_INCREMENT,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `codcom` varchar(6) NOT NULL DEFAULT '',
  `sercom` varchar(4) NOT NULL DEFAULT '',
  `numcom` varchar(30) NOT NULL DEFAULT '',
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `puntos` int(6) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idauxiliarp`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manauxiliarr`
-- ----------------------------
DROP TABLE IF EXISTS `com_manauxiliarr`;
CREATE TABLE `com_manauxiliarr` (
  `idprovision` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `anho` decimal(4,0) NOT NULL DEFAULT 0,
  `mes` decimal(2,0) NOT NULL DEFAULT 0,
  `anhop` decimal(4,0) NOT NULL DEFAULT 0,
  `periodo` decimal(2,0) NOT NULL DEFAULT 0,
  `idproducto` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(100) NOT NULL DEFAULT '',
  `idunidad` int(11) NOT NULL DEFAULT 0,
  `importef` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importec` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `importes` decimal(14,4) NOT NULL DEFAULT 0.0000,
  `idcomcab` int(11) NOT NULL DEFAULT 0,
  `idcom` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `condicion` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idprovision`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manauxiliars`
-- ----------------------------
DROP TABLE IF EXISTS `com_manauxiliars`;
CREATE TABLE `com_manauxiliars` (
  `idauxiliars` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `coraux` int(3) NOT NULL DEFAULT 0,
  `diraux` varchar(100) NOT NULL DEFAULT '',
  `referencia` varchar(100) NOT NULL DEFAULT '',
  `emaaux` varchar(100) NOT NULL DEFAULT '',
  `webaux` varchar(100) NOT NULL DEFAULT '',
  `conaux` varchar(60) NOT NULL DEFAULT '',
  `caraux` varchar(60) NOT NULL DEFAULT '',
  `telaux` varchar(20) NOT NULL DEFAULT '',
  `faxaux` varchar(20) NOT NULL DEFAULT '',
  `movaux` varchar(40) NOT NULL DEFAULT '',
  `recepcion` text DEFAULT NULL,
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `codprv` varchar(6) NOT NULL DEFAULT '',
  `coddis` varchar(6) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idauxiliars`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manauxiliart`
-- ----------------------------
DROP TABLE IF EXISTS `com_manauxiliart`;
CREATE TABLE `com_manauxiliart` (
  `idauxiliart` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `vehiculo` varchar(40) NOT NULL DEFAULT '',
  `vehmarca` varchar(30) NOT NULL DEFAULT '',
  `vehmodelo` varchar(30) NOT NULL DEFAULT '',
  `vehplaca` varchar(20) NOT NULL DEFAULT '',
  `vehlicencia` varchar(20) NOT NULL DEFAULT '',
  `vehconductor` varchar(100) NOT NULL DEFAULT '',
  `vehconductorap` varchar(100) NOT NULL DEFAULT '',
  `vehconductord` varchar(20) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idauxiliart`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manbanco`
-- ----------------------------
DROP TABLE IF EXISTS `com_manbanco`;
CREATE TABLE `com_manbanco` (
  `idbanco` int(11) NOT NULL AUTO_INCREMENT,
  `codban` varchar(6) NOT NULL DEFAULT '',
  `desban` varchar(40) NOT NULL DEFAULT '',
  `cajban` varchar(1) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idbanco`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mancategoriaaux`
-- ----------------------------
DROP TABLE IF EXISTS `com_mancategoriaaux`;
CREATE TABLE `com_mancategoriaaux` (
  `idcateg` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `codcateg` varchar(6) NOT NULL DEFAULT '',
  `descateg` varchar(40) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcateg`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mancencosto`
-- ----------------------------
DROP TABLE IF EXISTS `com_mancencosto`;
CREATE TABLE `com_mancencosto` (
  `idccosto` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `tipo` varchar(1) NOT NULL DEFAULT 'C',
  `codccos` varchar(10) NOT NULL DEFAULT '',
  `desccos` varchar(40) NOT NULL DEFAULT '',
  `nivel` decimal(1,0) NOT NULL DEFAULT 0,
  `codctad` varchar(10) NOT NULL DEFAULT '',
  `codctah` varchar(10) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idccosto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mancondpago`
-- ----------------------------
DROP TABLE IF EXISTS `com_mancondpago`;
CREATE TABLE `com_mancondpago` (
  `idcdp` int(11) NOT NULL AUTO_INCREMENT,
  `codcdp` varchar(2) NOT NULL DEFAULT '',
  `descdp` varchar(40) NOT NULL DEFAULT '',
  `dias` decimal(3,0) NOT NULL DEFAULT 0,
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcdp`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mandepartamento`
-- ----------------------------
DROP TABLE IF EXISTS `com_mandepartamento`;
CREATE TABLE `com_mandepartamento` (
  `iddpt` int(11) NOT NULL AUTO_INCREMENT,
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `desdpt` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`iddpt`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mandetraccion`
-- ----------------------------
DROP TABLE IF EXISTS `com_mandetraccion`;
CREATE TABLE `com_mandetraccion` (
  `iddet` int(11) NOT NULL AUTO_INCREMENT,
  `tipdet` varchar(1) NOT NULL DEFAULT '',
  `coddet` varchar(6) NOT NULL DEFAULT '',
  `desdet` varchar(60) NOT NULL DEFAULT '',
  `pordet` decimal(6,2) NOT NULL DEFAULT 0.00,
  `mindet` decimal(8,2) NOT NULL DEFAULT 0.00,
  `tipo_nubefact` int(2) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iddet`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mandistrito`
-- ----------------------------
DROP TABLE IF EXISTS `com_mandistrito`;
CREATE TABLE `com_mandistrito` (
  `iddis` int(11) NOT NULL AUTO_INCREMENT,
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `codprv` varchar(6) NOT NULL DEFAULT '',
  `coddis` varchar(6) NOT NULL DEFAULT '',
  `desdis` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`iddis`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1834 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mandocumento`
-- ----------------------------
DROP TABLE IF EXISTS `com_mandocumento`;
CREATE TABLE `com_mandocumento` (
  `iddoc` int(11) NOT NULL AUTO_INCREMENT,
  `coddoc` varchar(2) NOT NULL DEFAULT '',
  `desdoc` varchar(50) NOT NULL DEFAULT '',
  `desldoc` text NOT NULL,
  `digitos` decimal(2,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`iddoc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manmediopago`
-- ----------------------------
DROP TABLE IF EXISTS `com_manmediopago`;
CREATE TABLE `com_manmediopago` (
  `idmedpag` int(11) NOT NULL AUTO_INCREMENT,
  `codmedpag` varchar(6) DEFAULT '',
  `desmedpag` varchar(100) DEFAULT '',
  PRIMARY KEY (`idmedpag`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manmoneda`
-- ----------------------------
DROP TABLE IF EXISTS `com_manmoneda`;
CREATE TABLE `com_manmoneda` (
  `idmoneda` int(11) NOT NULL AUTO_INCREMENT,
  `codmon` varchar(3) NOT NULL DEFAULT '',
  `desmon` varchar(20) NOT NULL DEFAULT '',
  `simmon` varchar(3) NOT NULL DEFAULT '',
  PRIMARY KEY (`idmoneda`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manpais`
-- ----------------------------
DROP TABLE IF EXISTS `com_manpais`;
CREATE TABLE `com_manpais` (
  `idpai` int(11) NOT NULL AUTO_INCREMENT,
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `despais` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idpai`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manpersjur`
-- ----------------------------
DROP TABLE IF EXISTS `com_manpersjur`;
CREATE TABLE `com_manpersjur` (
  `idpjur` int(11) NOT NULL AUTO_INCREMENT,
  `codpjur` varchar(2) NOT NULL DEFAULT '',
  `despjur` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`idpjur`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manprovincia`
-- ----------------------------
DROP TABLE IF EXISTS `com_manprovincia`;
CREATE TABLE `com_manprovincia` (
  `idprv` int(11) NOT NULL AUTO_INCREMENT,
  `codpais` varchar(6) NOT NULL DEFAULT '',
  `coddpt` varchar(6) NOT NULL DEFAULT '',
  `codprv` varchar(6) NOT NULL DEFAULT '',
  `desprv` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`idprv`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_manproyecto`
-- ----------------------------
DROP TABLE IF EXISTS `com_manproyecto`;
CREATE TABLE `com_manproyecto` (
  `idccosto` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `emision` date NOT NULL DEFAULT '1900-01-01',
  `vencimiento` date DEFAULT '1900-01-01',
  `codccos` varchar(10) NOT NULL DEFAULT '',
  `desccos` varchar(40) NOT NULL DEFAULT '',
  `idauxiliar` int(11) NOT NULL DEFAULT 0,
  `informacion` text DEFAULT NULL,
  `referencia` text DEFAULT NULL,
  `archivo1` varchar(255) DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idccosto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci ROW_FORMAT=DYNAMIC;

-- ----------------------------
--  Table structure for `com_manscategoriaaux`
-- ----------------------------
DROP TABLE IF EXISTS `com_manscategoriaaux`;
CREATE TABLE `com_manscategoriaaux` (
  `idscateg` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `idcateg` int(11) NOT NULL DEFAULT 0,
  `codscate` varchar(6) NOT NULL DEFAULT '',
  `desscate` varchar(40) NOT NULL DEFAULT '',
  `condicion` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idscateg`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mantasa`
-- ----------------------------
DROP TABLE IF EXISTS `com_mantasa`;
CREATE TABLE `com_mantasa` (
  `idtasa` int(11) NOT NULL AUTO_INCREMENT,
  `idcia` int(11) NOT NULL DEFAULT 0,
  `idsuc` int(11) NOT NULL DEFAULT 0,
  `fechai` date NOT NULL DEFAULT '1900-01-01',
  `fechaf` date NOT NULL DEFAULT '1900-01-01',
  `porigv` decimal(6,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`idtasa`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mantcambio`
-- ----------------------------
DROP TABLE IF EXISTS `com_mantcambio`;
CREATE TABLE `com_mantcambio` (
  `idtcambio` int(11) NOT NULL AUTO_INCREMENT,
  `idmoneda` int(11) NOT NULL DEFAULT 0,
  `fecha` date NOT NULL DEFAULT '1900-01-01',
  `tcompra` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `tventa` decimal(7,4) NOT NULL DEFAULT 0.0000,
  `tpromedio` decimal(7,4) NOT NULL DEFAULT 0.0000,
  PRIMARY KEY (`idtcambio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3802 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- ----------------------------
--  Table structure for `com_mantipodoc`
-- ----------------------------
DROP TABLE IF EXISTS `com_mantipodoc`;
CREATE TABLE `com_mantipodoc` (
  `idtipdoc` int(11) NOT NULL AUTO_INCREMENT,
  `codtipdoc` varchar(2) NOT NULL DEFAULT '',
  `destipdoc` varchar(50) NOT NULL DEFAULT '',
  `descorto` varchar(20) NOT NULL DEFAULT '',
  `digtipdoc` decimal(2,0) NOT NULL DEFAULT 0,
  `condicion` int(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idtipdoc`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

