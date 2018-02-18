CREATE DATABASE IF NOT EXISTS test CHARACTER SET utf8;

USE test;

DROP TABLE IF EXISTS books;

CREATE TABLE books(
	id INT(11) NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	description VARCHAR(255) NOT NULL,
	author VARCHAR(100) NOT NULL,
	isbn VARCHAR(200) NOT NULL,
	printYear INT(4),
	readAlraedy BOOLEAN,
	PRIMARY KEY (id))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO books (title, description, author, isbn, printYear, readAlraedy) VALUES
('aaaaa','aaaaaaaaaaaaaaaaaaaaaaaaaaaa','aaaaa','75-2-234-543563-1',1924,false),
('bbbbb','bbbbbbbbbbbbbbbbbbbbbbbbbbb','bbbbbbb','86-2-234-467564-1',1990,true),
('bbbbb','bbbbbbbbbbbbbbbbbbbbbbbbbbb','bbbbbbb','45-2-234-467864-1',1990,true),
('dddddd','ddddddddddddddddd','ddddd','45-2-234-154654-1',1935,false),
('eeee','eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee','eeeeee','25-2-234-452568-1',1993,true),
('fffff','fffffffffffffff','fffffffff','45-2-234-745896-1',1800,false),
('gggggg','ggggggggggggggg','gggg','58-2-234-146398-1',1700,false),
('hhhhhhh','hhhhhhhhhh','hhhhhhh','86-2-234-425863-1',1678,false),
('iiiiiii','iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii','iiii','79-2-234-425896-1',1992,true),
('jjjjjjj','jjjjjjjjjjj','jjjj','15-2-234-232345-1',1945,false),
('kkkkkkkkk','kkkkkkkkkkkkkkkkkkkkkkkkkk','kkkkk','45-2-234-425185-1',1975,false),
('llllll','lllllllllllllllllllllllllllllllllllll','llll','89-2-234-425863-1',1999,true),
('mmmmmm','mmmmmmmmmmmmmmmmmmmmm','mmm','78-2-234-725896-1',1943,true),
('nnnnnn','nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn','nnnnnn','33-2-234-785423-1',1923,false),
('oooooooo','oooooooooooooooooooooooooo','oooooo','56-2-234-428965-1',1987,true),
('pppppppp','ppppppppppppppppppppppppppppppppppp','ppp','45-2-234-425896-1',1999,false),
('qqqqqqqqq','qqqqqqqqqqqqqqqqqqq','qqqqqq','45-2-234-142578-1',1972,true),
('rrrrrrr','rrrrrrrrrrrrrrrr','rrrrrrrrrr','78-2-234-956852-1',1964,false),
('sssssss','ssssssssssssssssssssssssss','sssss','98-2-234-426395-1',1922,false),
('ttttttttt','tttttttttttttt','ttttt','75-2-234-425325-1',1928,false),
('uuuuuuu','uuuuuuuuuu','uuuuuuuu','46-2-234-125489-1',1675,true),
('vvvvvvvv','vvvvvvvvvvvvvvv','vvvvv','56-2-234-423695-1',1997,true),
('wwwwwwwwwww','wwwwwwwwwwwww','wwwwwwwww','98-2-234-758963-1',1936,false),
('xxxxxxxxx','xxxxxxxxxxxxxxxxxxxxx','xxxxxx','45-2-234-425189-1',1992,true),
('yyyyy','yyyyyyyyyyyyyyyyyyyyyyyy','yyyyyyy','12-2-234-142596-1',1936,true),
('zzzzzzzzz','zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz','zzzzz','12-2-234-142596-1',1911,false);