DELIMITER $$

CREATE
    /*[DEFINER = { user | CURRENT_USER }]*/
    TRIGGER `qcbug`.`BBB` AFTER INSERT
    ON `qcbug`.`buginfo`
    FOR EACH ROW BEGIN
	INSERT INTO `qcbug`.`bugs_buginfo` VALUES(new.id,new.stat,new.leve,new.syst,new.versio,new.project);
    END$$

DELIMITER ;