USE [LabTestPortal]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE='P' AND NAME='uspSelectPerson')
BEGIN
	DROP PROCEDURE [dbo].[uspSelectPerson]
END
GO

CREATE PROCEDURE uspSelectPerson
(
    @FirstName Varchar(50) = NULL,
    @LastName Varchar(50) = NULL,
    @StateID INT = NULL,
    @Gender char(1) = NULL,
    @DOB DATETIME = NULL   
)
AS
SET NOCOUNT ON;
BEGIN		 
	SELECT  
		per.Person_id AS PersonId,
		per.First_Name AS FirstName,
		per.Last_Name AS LastName,
		per.State_Id AS StateID,
		states.State_code AS StateCode,
		per.Gender AS Gender,
		per.DOB AS DateOfBirth 
	FROM 
		Person per 
		INNER JOIN States states ON per.State_id=states.State_id
	
	WHERE 
		COALESCE(per.First_Name,'') LIKE ('%' + COALESCE(@FirstName,per.First_Name,'') + '%')
		AND COALESCE(per.Last_Name ,'') LIKE ('%' +COALESCE(@LastName,per.Last_Name ,'') + '%')
		AND COALESCE(per.State_Id ,'') = COALESCE(@StateID,per.State_Id ,'')
		AND COALESCE(per.Gender ,'') = COALESCE(@Gender,per.Gender ,'')
		AND COALESCE(per.DOB ,'') = COALESCE(@DOB,per.DOB ,'')          
END
    