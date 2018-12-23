USE [LabTestPortal]
GO

IF EXISTS(SELECT * FROM SYSOBJECTS WHERE XTYPE='P' AND NAME='uspStatesList')
BEGIN
	DROP PROCEDURE [dbo].[uspStatesList]
END
GO

CREATE PROCEDURE dbo.uspStatesList
AS
SET NOCOUNT ON;

SELECT 
	State_Id AS ID,
	State_Code AS CODE
FROM 
	States
ORDER BY CODE
GO

