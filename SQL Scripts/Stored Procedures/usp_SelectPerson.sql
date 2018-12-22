USE [LabTestPortal]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE='P' AND NAME='uspSelectPerson')
BEGIN
	DROP PROCEDURE [dbo].[uspSelectPerson]
END
GO

CREATE PROCEDURE uspSelectPerson
(
    @FirstName Varchar(50)=null,
    @LastName Varchar(50)=null,
    @StateID INT = NULL,
    @Gender char(1)=null,
    @DOB DATETIME =null   
)
AS
SET NOCOUNT ON;
BEGIN		
    SELECT  
		First_Name AS FirstName,
		Last_Name AS LastName,
		State_Id AS StateID,
		Gender AS Gender,
		DOB AS DateOFBirth 
	FROM 
		Person	
	WHERE 
		COALESCE(First_Name,'')=COALESCE(@FirstName,First_Name,'')
		AND COALESCE(Last_Name,'')=COALESCE(@LastName,Last_Name,'')
		AND COALESCE(State_Id,'')=COALESCE(@StateID,State_Id,'')
		AND COALESCE(Gender,'')=COALESCE(@Gender,Gender,'')
		AND DOB=COALESCE(@DOB,DOB,'')            
END
    