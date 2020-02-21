DROP PROCEDURE IF EXISTS paperSummary;
DELIMITER $
CREATE PROCEDURE paperSummary(paperNumber INT, newsName VARCHAR(20))
BEGIN
	DECLARE not_found INT DEFAULT 0;
    DECLARE article1 VARCHAR(50);
	DECLARE pages INT DEFAULT 0;
	DECLARE cpages INT DEFAULT 0;
    DECLARE sum INT DEFAULT 0;
 
	DECLARE bcursor CURSOR FOR 
	SELECT in_article FROM PAGE_ORGANISATION
	WHERE papernum=paperNumber AND newspaperName=newsName;
	DECLARE CONTINUE HANDLER FOR NOT FOUND
	SET not_found=1;
    OPEN bcursor;
    REPEAT
		FETCH bcursor INTO article1 ;
		IF(not_found=0)
		THEN
			SELECT ARTICLE.title AS Title, ARTICLE.pages AS Length, CHECKING.approval_date AS ApprovalDate, sum+1 AS StartingPage FROM ARTICLE 
			INNER JOIN CHECKING ON CHECKING.article = ARTICLE.art_path
			WHERE ARTICLE.art_path = article1;			
            SELECT ARTICLE.pages INTO cpages FROM ARTICLE WHERE ARTICLE.art_path = article1;
            SET sum=sum+cpages;            
			SELECT EMPLOYEE.first_name AS FirstName, EMPLOYEE.last_name AS LastName FROM EMPLOYEE
            INNER JOIN SUBMISSION ON SUBMISSION.journalist = EMPLOYEE.email
            WHERE SUBMISSION.article = article1;
		END IF;
	UNTIL(not_found=1)
	END REPEAT;	
	CLOSE bcursor;
	SELECT PAPER.pages_num INTO pages FROM PAPER WHERE PAPER.paper_num=paperNumber AND PAPER.name_newspaper=newsName;
    IF (pages>sum) THEN
		SET pages=pages-sum;
        SELECT 'There are ',pages,' pages empty!';
	END IF;
END$
DELIMITER ;
CALL paperSummary(54,'PELOPONNHSOS');

DROP PROCEDURE IF EXISTS recalculateSalary;
DELIMITER $
CREATE PROCEDURE recalculateSalary(journalistEmail VARCHAR(30))
BEGIN
	DECLARE not_found INT DEFAULT 0;
	DECLARE newSalary DECIMAL(6,2);
	DECLARE workExperienceMonths INT DEFAULT 0;
    DECLARE employeeDateHired DATE;
    DECLARE curDate DATE;
    DECLARE monthsDif INT DEFAULT 0;
    DECLARE totalMonths INT DEFAULT 0;
    SET curDate = CURDATE(); 

    SELECT Journalist.work_experience INTO workExperienceMonths FROM Journalist WHERE Journalist.journal_email=journalistEmail;
    -- SELECT workExperienceMonths; 27
    SELECT Employee.hired_date INTO employeeDateHired FROM Employee WHERE Employee.email=journalistEmail;
    -- SELECT employeeDateHired; 2017-04-01    
    SELECT Employee.salary INTO newSalary FROM Employee WHERE Employee.email=journalistEmail;
    -- SELECT newSalary; 920.00    
    SET monthsDif = FLOOR(DATEDIFF(curDate, employeeDateHired)/30.0);
    -- SELECT monthsDif; 34    
    SET totalMonths =  workExperienceMonths + monthsDif;
    -- SELECT totalMonths; 61    
    repeat
		set newSalary = newSalary+(newSalary*0.005);
        set totalMonths = totalMonths - 1;
		until totalMonths = 0
    end repeat;
    UPDATE EMPLOYEE SET EMPLOYEE.salary=newSalary WHERE EMPLOYEE.email=journalistEmail;
END$
DELIMITER ;
CALL recalculateSalary('george.pap@gmail.com');