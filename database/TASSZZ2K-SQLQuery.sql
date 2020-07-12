USE TASSZZ2K

/*========= INSERT ===========*/
/*========= INSERT [USER][ROLE]===========*/
USE [TASSZZ2K]
GO
INSERT INTO role(code, name) values('ADMIN', N'Quản Trị')
INSERT INTO role(code, name) values('USER', N'Người dùng')

INSERT INTO [dbo].[user]
           ([username],[password],[fullname],[status],[roleid])
     VALUES ('admin','1', 'admin', 1, 1);
INSERT INTO [dbo].[user]
           ([username],[password],[fullname],[status],[roleid])
     VALUES ('tass','1', 'TASS', 1, 1);
INSERT INTO [dbo].[user]
           ([username],[password],[fullname],[status],[roleid])
     VALUES ('user1','2', N'Nguyễn Văn A', 1, 2);
INSERT INTO [dbo].[user]
           ([username],[password],[fullname],[status],[roleid])
     VALUES ('user2','2', N'Nguyễn Văn B', 1, 2);

/*========= INSERT [CATEGORY]===========*/
USE [TASSZZ2K]
GO

INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Cảm Xúc Nên Thơ','tho-cam-xuc-nen-tho',NULL,NULL,NULL,NULL)
GO
INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Thơ Tim','tho-tho-tim',NULL,NULL,NULL,NULL)
GO
INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Thơ Ngẫu Hứng','tho-tho-ngau-hung',NULL,NULL,NULL,NULL)
GO
INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Chuyện Coding','chuyen-coding',NULL,NULL,NULL,NULL)
GO
INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Đọc','doc',NULL,NULL,NULL,NULL)
GO
INSERT INTO [dbo].[category]
           ([name],[code],[createddate],[modifieddate],[createdby],[modifiedby])
     VALUES (N'Chuyện linh tinh','chuyen-linh-tinh',NULL,NULL,NULL,NULL)
GO

/*------------------------------------*/
INSERT INTO [news](title, categoryid) values(N'Bài viết 1',1);
INSERT INTO [news](title, categoryid) values(N'Bài viết 2',1);
INSERT INTO [news](title, categoryid) values(N'Bài viết 3',4);

INSERT INTO [news](title, content, categoryid) values(N'Bài viết 4',N'Đây là content bài viết 4',1);
INSERT INTO [news](title, content, categoryid) values(N'Bài viết 5',N'Đây là content bài viết 5 hihi',1);



/*========= INSERT ===========*/

/*========= SELECT ===========##########*/
SELECT * FROM category
SELECT * FROM news
SELECT * FROM role
SELECT * FROM [user]
SELECT COUNT(*) FROM dbo.news
SELECT * FROM dbo.news
ORDER BY id DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROW ONLY

SELECT * FROM dbo.[user]
WHERE username = 'admin' AND password = '1' AND status = 1

SELECT * FROM dbo.[user]
INNER JOIN dbo.role ON role.id = [user].roleid
WHERE username = 'admin' AND password = '1' AND status = 1 



SELECT news.id,title,thumbnail,shortdescription,content,categoryid,news.createddate,news.modifieddate,news.createdby,news.modifiedby,category.code,category.name 
FROM news 
INNER JOIN dbo.category ON category.id = news.categoryid

/*========= SELECT ===========##########*/
/*========= UPDATE ^^^^^^^^^^^^^^^^^^^^^*/
DBCC CHECKIDENT(role, RESEED, 0)

USE [TASSZZ2K]
GO

UPDATE [dbo].[news]
   SET [title] = ''
      ,[thumbnail] = ''
      ,[shortdescription] = ''
      ,[content] = ''
      ,[categoryid] = 1
      ,[createddate] = NULL
      ,[createdby] = ''
 WHERE id=4
GO


UPDATE [dbo].[news]
   SET [shortdescription] = N'Đây là short description bài viết xx!'
WHERE [shortdescription] IS NULL
GO


/*========= UPDATE ^^^^^^^^^^^^^^^^^^^^^*/



/*========= DELETE ===========*/
USE [TASSZZ2K]
GO

DELETE FROM [dbo].[category]
      WHERE id=3
GO

USE [TASSZZ2K]
GO

DELETE FROM [dbo].[news]
      WHERE 
GO

DELETE FROM role 

DELETE FROM [user] where roleid = 2

DELETE FROM dbo.[user]

/*========= DELETE ===========*/