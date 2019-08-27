UPDATE characters SET species='Martian' WHERE iD= (SELECT MAX(iD) FROM characters);
