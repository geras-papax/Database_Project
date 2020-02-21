DROP TRIGGER IF EXISTS newEmployee;
DELIMITER $
CREATE TRIGGER newEmployee BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
	DECLARE curDate DATE;
	SET curDate = CURDATE();
	IF(DATEDIFF(curDate, NEW.hired_date) < 30) -- ESTW EGINE H PROSLHPSH EWS KAI 30 MERES PRIN KAI GIA KAPOIO LOGO TWRA ANANEWTHIKE H BASH
	THEN 
            SET NEW.salary = 650.00;
	END IF;
END$
DELIMITER ;
INSERT INTO EMPLOYEE VALUES ('TESTER1@gmail.com', 'DimiStrDis', 'ArgDiAriou', null, '2020-02-01');

DROP TRIGGER IF EXISTS newArticle;
DELIMITER $
CREATE TRIGGER newArticle BEFORE INSERT ON SUBMISSION
FOR EACH ROW
BEGIN
	DECLARE journ VARCHAR(45);
    DECLARE chief ENUM('yes', 'no');
	SET journ = new.journalist;
    SELECT JOURNALIST.chief_editor INTO chief FROM JOURNALIST WHERE JOURNALIST.journal_email=journ;
	IF(chief='yes') -- ESTW EGINE H PROSLHPSH EWS KAI 30 MERES PRIN KAI GIA KAPOIO LOGO TWRA ANANEWTHIKE H BASH
	THEN 
		INSERT INTO CHECKING VALUES (new.journalist, new.article, null, 'accept', new.sub_date);
	END IF;
END$
DELIMITER ;
INSERT INTO ARTICLE VALUES ('C:\\Users\\Articles\\Submitted\\test.doc', 'test', 'tetsing', 5, 2);
INSERT INTO SUBMISSION VALUES ('giannis.spirou@gmail.com', 'C:\\Users\\Articles\\Submitted\\test.doc', '2020-02-06');
SELECT * FROM SUBMISSION;
SELECT * FROM CHECKING;

DROP TRIGGER IF EXISTS articleInPaper;
DELIMITER $
CREATE TRIGGER articleInPaper BEFORE INSERT ON PAGE_ORGANISATION
FOR EACH ROW
BEGIN
	DECLARE cpages INT DEFAULT 0;
    DECLARE pages INT DEFAULT 0;
    DECLARE sum INT DEFAULT 0;
    DECLARE not_found INT DEFAULT 0;
    DECLARE article1 VARCHAR(50);
    DECLARE bcursor CURSOR FOR 
	SELECT in_article FROM PAGE_ORGANISATION
	WHERE papernum=new.papernum AND newspaperName=new.newspaperName;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET not_found=1;
    OPEN bcursor;
    REPEAT
		FETCH bcursor INTO article1 ;
		IF(not_found=0)
		THEN
            SELECT ARTICLE.pages INTO cpages FROM ARTICLE WHERE ARTICLE.art_path = article1;
            SET sum=sum+cpages;            
		END IF;
	UNTIL(not_found=1)
	END REPEAT;	
	CLOSE bcursor;
	SELECT PAPER.pages_num INTO pages FROM PAPER WHERE PAPER.paper_num=new.papernum AND PAPER.name_newspaper=new.newspaperName;
    SET sum=pages-sum;
    SELECT ARTICLE.pages INTO cpages FROM ARTICLE WHERE ARTICLE.art_path = new.in_article;
    IF (cpages>sum) THEN
		SIGNAL SQLSTATE VALUE '45000' SET MESSAGE_TEXT = 'There is no space for the article';
	END IF;
END$
DELIMITER ;
INSERT INTO PAGE_ORGANISATION VALUES ('PELOPONNHSOS','54','C:\\Users\\Articles\\Submitted\\test.doc', '4');
SELECT * FROM PAGE_ORGANISATION;