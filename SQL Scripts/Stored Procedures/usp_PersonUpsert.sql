USE [LabTestPortal]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE='P' AND NAME='uspPersonUpsert')
BEGIN
	DROP PROCEDURE [dbo].[uspPersonUpsert]
END
GO

CREATE PROCEDURE uspPersonUpsert
(
    @PersonID INT=NULL,
    @FirstName VARCHAR(50),
    @LastName VARCHAR(50),
    @StateID INT,
    @Gender CHAR(1),
    @DateOFBirth DATETIME    
)
AS
	SET NOCOUNT ON;
    IF EXISTS (SELECT Person_Id FROM Person	WHERE Person_Id = @PersonID)
    BEGIN
        UPDATE Person 
        SET 
            First_Name = @FirstName,
            Last_Name = @LastName,
            State_Id = @StateID,
            Gender = @Gender,
            DOB = @DateOFBirth
        WHERE 
            Person_Id=@PersonID
    END
    ELSE
    BEGIN
       INSERT INTO Person 
       VALUES (@FirstName,
				@LastName,
				@StateID,
				@Gender,
				@DateOFBirth)
    END
