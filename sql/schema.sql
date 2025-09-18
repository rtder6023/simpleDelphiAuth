CREATE DATABASE IF NOT EXISTS conbetra;
USE conbetra;
DROP TABLE auth;
DROP TABLE posting;


CREATE TABLE auth (
	empid INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    loginId VARCHAR(30) NOT NULL UNIQUE,
    display_name VARCHAR(20) NOT NULL,
    pw VARCHAR(20) NOT NULL
);

CREATE TABLE posting (
	postId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    postName VARCHAR(30) NOT NULL,
    postBio VARCHAR(600) NOT NULL,
    uploader INT NOT NULL,
    FOREIGN KEY (uploader) REFERENCES auth(empid)
    );

DELETE FROM auth WHERE empId = 5;

SELECT * FROM auth ;
    
INSERT INTO posting(postName, postBio, uploader) VALUES ('TEST123','TESTING',7);
    
    
ALTER USER 'conbetra_root'@'localhost' IDENTIFIED WITH mysql_native_password BY '1234';


SELECT p.postId 	  AS 게시물번호,
	   p.postName 	  AS 게시물이름,
	   p.postBio 	  AS 게시물내용,
       a.display_name AS 작성자이름
FROM   posting p 
JOIN   auth a ON a.empid = p.uploader;
	

