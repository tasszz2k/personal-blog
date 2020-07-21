DROP DATABASE TASSZZ2K
CREATE DATABASE TASSZZ2K

USE TASSZZ2K

CREATE TABLE role(
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(255) NOT NULL,
	code VARCHAR(255) NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO


CREATE TABLE [user](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(150) NOT NULL,
	password VARCHAR(150) NOT NULL,
	fullname NVARCHAR(150) NULL,
	status int NOT NULL,
	roleid bigint NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

ALTER TABLE [user] ADD CONSTRAINT fk_user_role FOREIGN KEY (roleid) REFERENCES role(id);


CREATE TABLE [news](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	title NVARCHAR(255) NOT NULL,
	thumbnail NVARCHAR(255) NULL,
	shortdescription NVARCHAR(255) NULL,
	content TEXT NULL,
	categoryid bigint NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

CREATE TABLE [typepost](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(255) NOT NULL,
	code VARCHAR(255) NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

CREATE TABLE [category](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	name NVARCHAR(255) NOT NULL,
	code VARCHAR(255) NOT NULL,
	typepostid bigint NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO
ALTER TABLE [category] ADD CONSTRAINT fk_category_typepost FOREIGN KEY (typepostid) REFERENCES dbo.typepost(id);

ALTER TABLE [news] ADD CONSTRAINT fk_news_category FOREIGN KEY (categoryid) REFERENCES [category](id);


CREATE TABLE [comment](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	content NTEXT NOT NULL,
	[user_id] bigint NOT NULL,
	[news_id] bigint NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

ALTER TABLE [comment] ADD CONSTRAINT fk_comment_user FOREIGN KEY ([user_id]) REFERENCES [user](id);
ALTER TABLE [comment] ADD CONSTRAINT fk_comment_news FOREIGN KEY ([news_id]) REFERENCES [news](id);



CREATE TABLE [like](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	[liked] BIT NULL,
	[user_id] bigint NOT NULL,
	[news_id] bigint NOT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

ALTER TABLE [like] ADD CONSTRAINT fk_like_user FOREIGN KEY ([user_id]) REFERENCES [user](id);
ALTER TABLE [like] ADD CONSTRAINT fk_like_news FOREIGN KEY ([news_id]) REFERENCES [news](id);


ALTER TABLE dbo.[user]
ADD UNIQUE (username);


CREATE TABLE [photo](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	userid BIGINT NOT NULL, 
	title NVARCHAR(255) NOT NULL,
	[image] NVARCHAR(255) NULL,
	shortdescription NVARCHAR(255) NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO

ALTER TABLE [photo] ADD CONSTRAINT fk_photo_user FOREIGN KEY (userid) REFERENCES dbo.[user](id);

CREATE TABLE [message](
	id bigint NOT NULL PRIMARY KEY IDENTITY(1,1),
	content TEXT NULL,
	createddate DATETIME NULL,
	modifieddate DATETIME NULL,
	createdby NVARCHAR(255) NULL,
	modifiedby NVARCHAR(255) NULL
);
GO



/*============= SELECT ====================*/












/*============= SELECT ====================*/


















