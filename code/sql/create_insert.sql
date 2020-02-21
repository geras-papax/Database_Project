create database project_db;
use project_db;
    
CREATE TABLE IF NOT EXISTS EMPLOYEE(
	email VARCHAR(45) DEFAULT 'unknown' NOT NULL,
    first_name VARCHAR(15) DEFAULT 'unknown' NOT NULL,
    last_name VARCHAR(25) DEFAULT 'unknown' NOT NULL,
    salary DECIMAL(6,2) DEFAULT '0' NOT NULL,
    hired_date DATE DEFAULT '1970-01-01',
	PRIMARY KEY(email)
    );
    
CREATE TABLE IF NOT EXISTS JOURNALIST (
    journal_email VARCHAR(45) NOT NULL,
    work_experience INT NOT NULL DEFAULT 0,
    cv LONGTEXT NULL,
    chief_editor ENUM('yes', 'no') NULL,
    PRIMARY KEY (journal_email),
    CONSTRAINT JOURNAL_CRS
    FOREIGN KEY (journal_email) REFERENCES EMPLOYEE(email)
    ON DELETE CASCADE ON UPDATE CASCADE
    );
	
CREATE TABLE IF NOT EXISTS ADMINISTRATIVE(
	email VARCHAR(45) DEFAULT 'unknown' NOT NULL,
    duties ENUM('Secretary', 'Logistics'),
    address VARCHAR(25) DEFAULT 'unknown' NOT NULL,
    address_number INT(3) DEFAULT '0' NOT NULL,
    city VARCHAR(25) NOT NULL,
	PRIMARY KEY(email),
    CONSTRAINT ADMIN_CRS
    FOREIGN KEY (email) REFERENCES EMPLOYEE(email)
	ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS NEWSPAPER(
	name_news VARCHAR(20) DEFAULT 'unknown' NOT NULL,
    owner_name VARCHAR(30) DEFAULT 'unknown' NOT NULL,
    publish_freq ENUM('Daily', 'Weekly', 'Monthly'),
    editor_in_chief VARCHAR(45) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(name_news),
    CONSTRAINT WORKER_CRS
    FOREIGN KEY (editor_in_chief) REFERENCES JOURNALIST(journal_email)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS PAPER(
	name_newspaper VARCHAR(20) DEFAULT 'unknown' NOT NULL,
    paper_num INT(3) DEFAULT '0' NOT NULL,
	pages_num INT(3) DEFAULT '30' NOT NULL,    
    release_date DATE DEFAULT '1970-01-01',
    copy_num INT(3) DEFAULT '0' NOT NULL,
	PRIMARY KEY(paper_num, name_newspaper),
    CONSTRAINT PAPER_CRS
    FOREIGN KEY (name_newspaper) REFERENCES NEWSPAPER(name_news)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS TELEPHONE(
	telephone_num VARCHAR(12) NOT NULL,
    administrative_employee VARCHAR(35) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(telephone_num),
    CONSTRAINT TELEPHONE_CRS
    FOREIGN KEY (administrative_employee) REFERENCES ADMINISTRATIVE(email)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS WORKS(
	newsp_name VARCHAR(20) DEFAULT 'unknown' NOT NULL,
    employee_name VARCHAR(45) DEFAULT 'unknown' NOT NULL,
	PRIMARY KEY(newsp_name,employee_name),
    CONSTRAINT NEWSP_CRS
    FOREIGN KEY (newsp_name) REFERENCES NEWSPAPER(name_news)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT EMPLOYEE_CRS
    FOREIGN KEY (employee_name) REFERENCES EMPLOYEE(email)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE IF NOT EXISTS CATEGORY (
	id INT NOT NULL AUTO_INCREMENT,
	parent_id INT NULL DEFAULT NULL,
	name_category CHAR(15) NULL,
	description LONGTEXT NULL,
	PRIMARY KEY (id),
	CONSTRAINT CATEGORY_CRS
	FOREIGN KEY (parent_id) REFERENCES CATEGORY(id)
	ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS ARTICLE (
    art_path VARCHAR(50) NOT NULL,
    title MEDIUMTEXT NULL,
    summary LONGTEXT NULL,
    pages INT NULL,
    category INT NULL,
    PRIMARY KEY (art_path), 
    CONSTRAINT ARTICLE_CRS
    FOREIGN KEY (category) REFERENCES CATEGORY (id)
    ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS SUBMISSION (
    journalist VARCHAR(45) NOT NULL,
    article VARCHAR(50) NOT NULL,
    sub_date DATE NULL,
    PRIMARY KEY (journalist,article),
    CONSTRAINT SUB_CRS
    FOREIGN KEY (journalist) REFERENCES JOURNALIST(journal_email)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT SUBS_CRS
    FOREIGN KEY (article) REFERENCES ARTICLE(art_path)
    ON DELETE CASCADE ON UPDATE CASCADE
	);
    
CREATE TABLE IF NOT EXISTS CHECKING (
    chief VARCHAR(45) NOT NULL,
    article VARCHAR(50) NOT NULL,
    comments MEDIUMTEXT NULL,
    approval ENUM('reject', 'accept', 'retype') NOT NULL,
    approval_date DATE NULL DEFAULT NULL,
    PRIMARY KEY (article),
    CONSTRAINT CHECK_CRS
    FOREIGN KEY (chief) REFERENCES JOURNALIST(journal_email)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT CHECKS_CRS
    FOREIGN KEY (article) REFERENCES ARTICLE(art_path)
    ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS PAGE_ORGANISATION (
    newspaperName VARCHAR(20) DEFAULT 'unknown' NOT NULL,
    papernum INT(3) NOT NULL,
    in_article VARCHAR(50) NOT NULL,
    position INT(3) NOT NULL UNIQUE,
    PRIMARY KEY (papernum,position),
    CONSTRAINT ORGAN_CRS
    FOREIGN KEY (papernum) REFERENCES PAPER(paper_num)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ORG_CRS
    FOREIGN KEY (in_article) REFERENCES ARTICLE(art_path)
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT ORGDS_CRS
    FOREIGN KEY (newspaperName) REFERENCES NEWSPAPER(name_news)
    ON DELETE CASCADE ON UPDATE CASCADE
    );
    
CREATE TABLE IF NOT EXISTS KEYWORDS (
    article VARCHAR(50) NOT NULL,
    words CHAR(15) NOT NULL,
    PRIMARY KEY (words),
    CONSTRAINT KEY_CRS
    FOREIGN KEY (article) REFERENCES ARTICLE(art_path)
    ON DELETE CASCADE ON UPDATE CASCADE
    );

INSERT INTO EMPLOYEE VALUES ('giannis.spirou@gmail.com', 'Giannis', 'Spirou', 1000, '2002-03-15');
INSERT INTO EMPLOYEE VALUES ('themis.anagnostou@gmail.com', 'Themistoklis', 'Anagnostou', 970, '2008-07-12');
INSERT INTO EMPLOYEE VALUES ('ioanna.86kappa@gmail.com', 'Ioanna', 'Kappa', 900, '2005-02-18');
INSERT INTO EMPLOYEE VALUES ('xristos.ppd@gmail.com', 'Christos', 'Papadopoulos', 700, '2015-12-09');
INSERT INTO EMPLOYEE VALUES ('stathis.poul@gmail.com', 'Efstathios', 'Poulopoulos', 1150, '2014-11-9');
INSERT INTO EMPLOYEE VALUES ('george.pap@gmail.com', 'Giorgos', 'Pappas', 920, '2017-04-01');
INSERT INTO EMPLOYEE VALUES ('tolis.dimitriou@gmail.com', 'Apostolis', 'Dimitriou', 850, '2012-08-05');
INSERT INTO EMPLOYEE VALUES ('dimitris.argiriou@gmail.com', 'Dimitris', 'Argiriou', 750, '2013-11-19');

INSERT INTO ADMINISTRATIVE VALUES ('xristos.ppd@gmail.com', 'Logistics', 'Domokou', 190, 'Heraklion');  
INSERT INTO ADMINISTRATIVE VALUES ('dimitris.argiriou@gmail.com', 'Secretary', 'Egnatias', 22, 'Athens');  


INSERT INTO JOURNALIST VALUES ('giannis.spirou@gmail.com', 8, 'War correspondent since 1994 for BBC', 'yes');
INSERT INTO JOURNALIST VALUES ('ioanna.86kappa@gmail.com', 4, 'Sportswriter for CNN since 2001', 'yes');
INSERT INTO JOURNALIST VALUES ('stathis.poul@gmail.com', DEFAULT, 'Degree in sports', NULL); 
INSERT INTO JOURNALIST VALUES ('george.pap@gmail.com', DEFAULT, 'Degree in sports', NULL); 
INSERT INTO JOURNALIST VALUES ('tolis.dimitriou@gmail.com', DEFAULT, 'Degree in sports', NULL); 
INSERT INTO JOURNALIST VALUES ('themis.anagnostou@gmail.com', DEFAULT, 'Degree in sports', NULL); 

INSERT INTO NEWSPAPER VALUES ('PELOPONNHSOS', 'Kostas Samaras', 'Weekly','giannis.spirou@gmail.com');
INSERT INTO NEWSPAPER VALUES ('GNOMI', 'Nikolaos Pappas', 'Daily','ioanna.86kappa@gmail.com');

INSERT INTO PAPER VALUES ('PELOPONNHSOS', '54', '23', '2020-01-28', '313');
INSERT INTO PAPER VALUES ('PELOPONNHSOS', '62', '23', '2020-01-21', '240');
INSERT INTO PAPER VALUES ('GNOMI', '342', '12', '2020-01-19', '122');   
INSERT INTO PAPER VALUES ('GNOMI', '211', '13', '2020-01-20', '102');   

INSERT INTO CATEGORY VALUES (1, NULL, 'WAR', 'News about war');
INSERT INTO CATEGORY VALUES (2, NULL, 'SPORTS', 'News about sports');

INSERT INTO WORKS VALUES ('PELOPONNHSOS', 'giannis.spirou@gmail.com');
INSERT INTO WORKS VALUES ('GNOMI', 'ioanna.86kappa@gmail.com');
INSERT INTO WORKS VALUES ('GNOMI', 'themis.anagnostou@gmail.com');
INSERT INTO WORKS VALUES ('PELOPONNHSOS', 'xristos.ppd@gmail.com');
INSERT INTO WORKS VALUES ('PELOPONNHSOS', 'stathis.poul@gmail.com');
INSERT INTO WORKS VALUES ('PELOPONNHSOS', 'george.pap@gmail.com');
INSERT INTO WORKS VALUES ('PELOPONNHSOS', 'tolis.dimitriou@gmail.com');

INSERT INTO TELEPHONE VALUES ('6948232301', 'xristos.ppd@gmail.com');
INSERT INTO TELEPHONE VALUES ('6948239991', 'dimitris.argiriou@gmail.com');

INSERT INTO ARTICLE VALUES ('C:\\Users\\Articles\\Submitted\\Article35a.doc', 'War machines', 'All the latest details about Iran', 2, 1);
INSERT INTO ARTICLE VALUES ('C:\\Users\\Articles\\Submitted\\Article34a.doc', 'Championship in the courts', 'Details about the law-rivarly between OSFP and PAOK', 3, 2);
INSERT INTO ARTICLE VALUES ('C:\\Users\\Articles\\Submitted\\Article38a.doc', 'Playoff', 'Details about playoffs', 5, 2);
INSERT INTO ARTICLE VALUES ('C:\\Users\\Articles\\Submitted\\Article37a.doc', 'Panathinaikos-Paok', 'Scorers,highlights,critisism', 8, 2);

INSERT INTO CHECKING VALUES ('ioanna.86kappa@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article34a.doc', 'Write more about the laws', 'retype', NULL);
INSERT INTO CHECKING VALUES ('giannis.spirou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article35a.doc', NULL, 'accept', '2020-02-04');
INSERT INTO CHECKING VALUES ('giannis.spirou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article37a.doc', NULL, 'accept', '2020-02-04');
INSERT INTO CHECKING VALUES ('giannis.spirou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article38a.doc', NULL, 'accept', '2020-02-04');

INSERT INTO SUBMISSION VALUES ('themis.anagnostou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article34a.doc', '2020-01-28');
INSERT INTO SUBMISSION VALUES ('giannis.spirou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article35a.doc', '2020-01-09');
INSERT INTO SUBMISSION VALUES ('tolis.dimitriou@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article37a.doc', '2020-02-03');
INSERT INTO SUBMISSION VALUES ('stathis.poul@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article37a.doc', '2020-02-03');
INSERT INTO SUBMISSION VALUES ('george.pap@gmail.com', 'C:\\Users\\Articles\\Submitted\\Article38a.doc', '2020-02-04');

INSERT INTO KEYWORDS VALUES ('C:\\Users\\Articles\\Submitted\\Article34a.doc', 'relegation');
INSERT INTO KEYWORDS VALUES ('C:\\Users\\Articles\\Submitted\\Article34a.doc', 'points');
INSERT INTO KEYWORDS VALUES ('C:\\Users\\Articles\\Submitted\\Article35a.doc', 'missiles');
INSERT INTO KEYWORDS VALUES ('C:\\Users\\Articles\\Submitted\\Article35a.doc', 'army');

INSERT INTO PAGE_ORGANISATION VALUES ('PELOPONNHSOS','54','C:\\Users\\Articles\\Submitted\\Article35a.doc', '1');
INSERT INTO PAGE_ORGANISATION VALUES ('PELOPONNHSOS','54','C:\\Users\\Articles\\Submitted\\Article37a.doc', '2');
INSERT INTO PAGE_ORGANISATION VALUES ('PELOPONNHSOS','54','C:\\Users\\Articles\\Submitted\\Article38a.doc', '3');