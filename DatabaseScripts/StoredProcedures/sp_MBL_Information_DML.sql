-- 
CREATE OR ALTER PROC dbo.sp_MBL_Information_DML
		@prm_DMLType Varchar(1),
		@prm_File_No					INT,
		@prm_MBL_NO						VARCHAR(500),
		@prm_Office						VARCHAR(500) = NULL ,
		@prm_BL_Type					VARCHAR(500)= NULL,
		@prm_Post_Date					DATE = NULL,
		@prm_Carrier_Bkg_No				INT = NULL,
		@prm_ITN_No						INT = NULL,
		@prm_Carrier					VARCHAR(500)= NULL ,
		@prm_BL_Acct_Carrier			VARCHAR(500)= NULL,
		@prm_Shipping_Agent				VARCHAR(300)= NULL,
		@prm_Oversea_Agent				VARCHAR(500)= NULL,
		@prm_Notify						VARCHAR(500)= NULL,
		@prm_Forwarding_Agent			VARCHAR(500)= NULL,
		@prm_Co_Loader					VARCHAR(500)= NULL,
		@prm_CO							VARCHAR(200)= NULL,
		@prm_Direct_Master				BIT = NULL,
		@prm_Vessel						VARCHAR(500)= NULL,
		@prm_Voyage						VARCHAR(500)= NULL,
		@prm_Place_of_Receipt			VARCHAR(100)= NULL,
		@prm_Place_of_Receipt_ETD		DATE = NULL,
		@prm_Port_of_Loading			VARCHAR(500)= NULL,
		@prm_ETD						DATE  = NULL,
		@prm_Place_Of_Discharge			VARCHAR(500)= NULL,
		@prm_ETA						DATE = NULL,
		@prm_Place_Of_Delivery			VARCHAR(500)= NULL,
		@prm_Place_Of_Delivery_ETA		DATE = NULL,
		@prm_Final_Destination			VARCHAR(500)= NULL,
		@prm_Final_ETA					DATE = NULL,
		@prm_Empty_Pickup				DATE = NULL,
		@prm_Delivery_ToPier			VARCHAR(500) = NULL,
		@prm_Freight					VARCHAR(500) = NULL,
		@prm_Ship_Mode					VARCHAR(100) = NULL,
		@prm_SVC_Term					VARCHAR(500) = NULL,
		@prm_Container_Qty				INT = NULL,
		@prm_OBL_Type					VARCHAR(400) = NULL,
		@prm_Doc_Cut_Of_Date			DATE = NULL,
		@prm_Post_cut_Of_Date			DATE = NULL,
		@prm_Rail_cut_Of_Date			DATE = NULL,
		@prm_BL_Cancelled				BIT = NULL,           
		@prm_Reasons_For_Cancel			VARCHAR(500) = NULL,
		@prm_Bussiness_Reffered_By		VARCHAR(500) = NULL,       
		@prm_Booking_Agent				BIT = NULL,                  
		@prm_Frt_Released				BIT = NULL,                
		@prm_Released_By				VARCHAR(500) = NULL
AS
BEGIN 
	DECLARE @varFile_No					INT,
			@varMBL_NO					BIGINT,
			@varOffice					VARCHAR(500)  ,
			@varBL_Type					VARCHAR(500),
			@varPost_Date				DATE,
			@varCarrier_Bkg_No			INT,
			@varITN_No					INT,
			@varCarrier					VARCHAR(500),
			@varBL_Acct_Carrier			VARCHAR (500),
			@varShipping_Agent			VARCHAR(300),
			@varOversea_Agent			VARCHAR(500),
			@varNotify					VARCHAR(500),
			@varForwarding_Agent		VARCHAR(500),
			@varCo_Loader				VARCHAR(500),
			@varCO						VARCHAR(200),
			@varDirect_Master			BIT,
			@varVessel					VARCHAR(500),
			@varVoyage					VARCHAR(500),
			@varPlace_of_Receipt		VARCHAR(100),
			@varPlace_of_Receipt_ETD	DATE ,
			@varPort_of_Loading			VARCHAR(500),
			@varETD						DATE  ,
			@varPlace_Of_Discharge		VARCHAR(500),
			@varETA						DATE ,
			@varPlace_Of_Delivery       VARCHAR(500),
			@varPlace_Of_Delivery_ETA   DATE ,
			@varFinal_Destination		VARCHAR(500),
			@varFinal_ETA				DATE ,
			@varEmpty_Pickup			DATE,
			@varDelivery_ToPier			VARCHAR(500),
			@varFreight					VARCHAR(500),
			@varShip_Mode				VARCHAR(100),
			@varSVC_Term				VARCHAR(500),
			@varContainer_Qty			INT ,
			@varOBL_Type				VARCHAR(400),
			@varDoc_Cut_Of_Date			DATE,
			@varPost_cut_Of_Date		DATE,
			@varRail_cut_Of_Date		DATE,
			@varBL_Cancelled			BIT,           
			@varReasons_For_Cancel		VARCHAR(500),
			@varBussiness_Reffered_By	VARCHAR(500),       
			@varBooking_Agent			BIT ,                     ---
			@varFrt_Released			BIT ,                ----
			@varReleased_By				VARCHAR(500)

	set	@varFile_No					=	@prm_File_No
	set	@varMBL_NO					=	@prm_MBL_NO
	set	@varOffice					=	@prm_Office
	set	@varBL_Type					=	@prm_BL_Type
	set	@varPost_Date				=	@prm_Post_Date
	set	@varCarrier_Bkg_No			=	@prm_Carrier_Bkg_No
	set	@varITN_No					=	@prm_ITN_No
	set	@varCarrier					=	@prm_Carrier
	set	@varBL_Acct_Carrier			=	@prm_BL_Acct_Carrier
	set	@varShipping_Agent			=	@prm_Shipping_Agent
	set	@varOversea_Agent			=	@prm_Oversea_Agent
	set	@varNotify					=	@prm_Notify
	set	@varForwarding_Agent		=	@prm_Forwarding_Agent
	set	@varCo_Loader				=	@prm_Co_Loader
	set	@varCO						=	@prm_CO
	set	@varDirect_Master			=	@prm_Direct_Master
	set	@varVessel					=	@prm_Vessel
	set	@varVoyage					=	@prm_Voyage
	set	@varPlace_of_Receipt		=	@prm_Place_of_Receipt
	set	@varPlace_of_Receipt_ETD	=	@prm_Place_of_Receipt_ETD
	set	@varPort_of_Loading			=	@prm_Port_of_Loading
	set	@varETD						=	@prm_ETD
	set	@varPlace_Of_Discharge		=	@prm_Place_Of_Discharge
	set	@varETA						=	@prm_ETA
	set	@varPlace_Of_Delivery       =	@prm_Place_Of_Delivery       
	set	@varPlace_Of_Delivery_ETA   =	@prm_Place_Of_Delivery_ETA   
	set	@varFinal_Destination		=	@prm_Final_Destination
	set	@varFinal_ETA				=	@prm_Final_ETA
	set	@varEmpty_Pickup			=	@prm_Empty_Pickup
	set	@varDelivery_ToPier			=	@prm_Delivery_ToPier
	set	@varFreight					=	@prm_Freight
	set	@varShip_Mode				=	@prm_Ship_Mode
	set	@varSVC_Term				=	@prm_SVC_Term
	set	@varContainer_Qty			=	@prm_Container_Qty
	set	@varOBL_Type				=	@prm_OBL_Type
	set	@varDoc_Cut_Of_Date			=	@prm_Doc_Cut_Of_Date
	set	@varPost_cut_Of_Date		=	@prm_Post_cut_Of_Date
	set	@varRail_cut_Of_Date		=	@prm_Rail_cut_Of_Date
	set	@varBL_Cancelled			=	@prm_BL_Cancelled
	set	@varReasons_For_Cancel		=	@prm_Reasons_For_Cancel
	set	@varBussiness_Reffered_By	=	@prm_Bussiness_Reffered_By
	set	@varBooking_Agent			=	@prm_Booking_Agent
	set	@varFrt_Released			=	@prm_Frt_Released
	set	@varReleased_By				=	@prm_Released_By

IF @prm_DMLType = 'I' AND NOT EXISTS(SELECT 1 FROM dbo.tbl_MBL_Information WHERE	File_No	=	@varFile_No AND MBL_NO	=	@varMBL_NO)
BEGIN
	INSERT INTO dbo.tbl_MBL_Information(
		 File_No
		,MBL_NO
		,Office
		,BL_Type
		,Post_Date
		,Carrier_Bkg_No
		,ITN_No
		,Carrier
		,BL_Acct_Carrier
		,Shipping_Agent
		,Oversea_Agent
		,Notify
		,Forwarding_Agent
		,Co_Loader
		,CO
		,Direct_Master
		,Vessel
		,Voyage
		,Place_of_Receipt
		,Place_of_Receipt_ETD
		,Port_of_Loading
		,ETD
		,Place_Of_Discharge
		,ETA
		,Place_Of_Delivery       
		,Place_Of_Delivery_ETA   
		,Final_Destination
		,Final_ETA
		,Empty_Pickup
		,Delivery_ToPier
		,Freight
		,Ship_Mode
		,SVC_Term
		,Container_Qty
		,OBL_Type
		,Doc_Cut_Of_Date
		,Post_cut_Of_Date
		,Rail_cut_Of_Date
		,BL_Cancelled
		,Reasons_For_Cancel
		,Bussiness_Reffered_By
		,Booking_Agent
		,Frt_Released
		,Released_By)
	VALUES(
		 @varFile_No
		,@varMBL_NO
		,@varOffice
		,@varBL_Type
		,@varPost_Date
		,@varCarrier_Bkg_No
		,@varITN_No
		,@varCarrier
		,@varBL_Acct_Carrier
		,@varShipping_Agent
		,@varOversea_Agent
		,@varNotify
		,@varForwarding_Agent
		,@varCo_Loader
		,@varCO
		,@varDirect_Master
		,@varVessel
		,@varVoyage
		,@varPlace_of_Receipt
		,@varPlace_of_Receipt_ETD
		,@varPort_of_Loading
		,@varETD
		,@varPlace_Of_Discharge
		,@varETA
		,@varPlace_Of_Delivery       
		,@varPlace_Of_Delivery_ETA   
		,@varFinal_Destination
		,@varFinal_ETA
		,@varEmpty_Pickup
		,@varDelivery_ToPier
		,@varFreight
		,@varShip_Mode
		,@varSVC_Term
		,@varContainer_Qty
		,@varOBL_Type
		,@varDoc_Cut_Of_Date
		,@varPost_cut_Of_Date
		,@varRail_cut_Of_Date
		,@varBL_Cancelled
		,@varReasons_For_Cancel
		,@varBussiness_Reffered_By
		,@varBooking_Agent
		,@varFrt_Released
		,@varReleased_By
		)
END
ELSE IF @prm_DMLType ='U'
	 BEGIN
		UPDATE dbo.tbl_MBL_Information 
		SET  
			 Office					=	@varOffice
			,BL_Type				=	@varBL_Type
			,Post_Date				=	@varPost_Date
			,Carrier_Bkg_No			=	@varCarrier_Bkg_No
			,ITN_No					=	@varITN_No
			,Carrier				=	@varCarrier
			,BL_Acct_Carrier		=	@varBL_Acct_Carrier
			,Shipping_Agent			=	@varShipping_Agent
			,Oversea_Agent			=	@varOversea_Agent
			,Notify					=	@varNotify
			,Forwarding_Agent		=	@varForwarding_Agent
			,Co_Loader				=	@varCo_Loader
			,CO						=	@varCO
			,Direct_Master			=	@varDirect_Master
			,Vessel					=	@varVessel
			,Voyage					=	@varVoyage
			,Place_of_Receipt		=	@varPlace_of_Receipt
			,Place_of_Receipt_ETD	=	@varPlace_of_Receipt_ETD
			,Port_of_Loading		=	@varPort_of_Loading
			,ETD					=	@varETD
			,Place_Of_Discharge		=	@varPlace_Of_Discharge
			,ETA					=	@varETA
			,Place_Of_Delivery      =	@varPlace_Of_Delivery       
			,Place_Of_Delivery_ETA  =	@varPlace_Of_Delivery_ETA   
			,Final_Destination		=	@varFinal_Destination
			,Final_ETA				=	@varFinal_ETA
			,Empty_Pickup			=	@varEmpty_Pickup
			,Delivery_ToPier		=	@varDelivery_ToPier
			,Freight				=	@varFreight
			,Ship_Mode				=	@varShip_Mode
			,SVC_Term				=	@varSVC_Term
			,Container_Qty			=	@varContainer_Qty
			,OBL_Type				=	@varOBL_Type
			,Doc_Cut_Of_Date		=	@varDoc_Cut_Of_Date
			,Post_cut_Of_Date		=	@varPost_cut_Of_Date
			,Rail_cut_Of_Date		=	@varRail_cut_Of_Date
			,BL_Cancelled			=	@varBL_Cancelled
			,Reasons_For_Cancel		=	@varReasons_For_Cancel
			,Bussiness_Reffered_By	=	@varBussiness_Reffered_By
			,Booking_Agent			=	@varBooking_Agent
			,Frt_Released			=	@varFrt_Released
			,Released_By			=	@varReleased_By
		WHERE	File_No	=	@varFile_No
			AND MBL_NO	=	@varMBL_NO
		END
		 ELSE IF @prm_DMLType ='D'
			  BEGIN
				DELETE FROM dbo.tbl_MBL_Information 
				WHERE File_No	=	@varFile_No
				AND MBL_NO	=	@varMBL_NO
			 END
		 ELSE IF @prm_DMLType ='S'
			  BEGIN
				SELECT  File_No
					   ,MBL_NO
					   ,Office
					   ,BL_Type
					   ,Post_Date
					   ,Carrier_Bkg_No
					   ,ITN_No
					   ,Carrier
					   ,BL_Acct_Carrier
					   ,Shipping_Agent
					   ,Oversea_Agent
					   ,Notify
					   ,Forwarding_Agent
					   ,Co_Loader
					   ,CO
					   ,Direct_Master
					   ,Vessel
					   ,Voyage
					   ,Place_of_Receipt
					   ,Place_of_Receipt_ETD
					   ,Port_of_Loading
					   ,ETD
					   ,Place_Of_Discharge
					   ,ETA
					   ,Place_Of_Delivery       
					   ,Place_Of_Delivery_ETA   
					   ,Final_Destination
					   ,Final_ETA
					   ,Empty_Pickup
					   ,Delivery_ToPier
					   ,Freight
					   ,Ship_Mode
					   ,SVC_Term
					   ,Container_Qty
					   ,OBL_Type
					   ,Doc_Cut_Of_Date
					   ,Post_cut_Of_Date
					   ,Rail_cut_Of_Date
					   ,BL_Cancelled
					   ,Reasons_For_Cancel
					   ,Bussiness_Reffered_By
					   ,Booking_Agent
					   ,Frt_Released
					   ,Released_By
				FROM dbo.tbl_MBL_Information 
				WHERE File_No	=	@varFile_No
				  AND MBL_NO	=	@varMBL_NO
			 END

END
GO