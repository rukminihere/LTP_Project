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
		First_Name AS FirstName,
		Last_Name AS LastName,
		State_Id AS StateID,
		Gender AS Gender,
		DOB AS DateOFBirth 
	FROM 
		Person	
	WHERE 
		COALESCE(First_Name,'') LIKE ('%' + COALESCE(@FirstName,First_Name,'') + '%')
		AND COALESCE(Last_Name,'') LIKE ('%' +COALESCE(@LastName,Last_Name,'') + '%')
		AND COALESCE(State_Id,'') = COALESCE(@StateID,State_Id,'')
		AND COALESCE(Gender,'') = COALESCE(@Gender,Gender,'')
		AND COALESCE(DOB,'') = COALESCE(@DOB,DOB,'')          
END
    