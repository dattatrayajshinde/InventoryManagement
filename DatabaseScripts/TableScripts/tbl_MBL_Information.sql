 --Create database WorldCargoFrieght_DB
 --GO
 USE WorldCargoFrieght_DB
 GO

CREATE TABLE  dbo.tbl_MBL_Information(
File_No					INT,
MBL_NO					VARCHAR(500),
Office					VARCHAR(500)  NOT NUll,
BL_Type					VARCHAR(500),
Post_Date				DATE,
Carrier_Bkg_No			INT,
ITN_No					INT,
Carrier					VARCHAR(500),
BL_Acct_Carrier			VARCHAR (500),
Shipping_Agent			VARCHAR(300),
Oversea_Agent			VARCHAR(500),
Notify					VARCHAR(500),
Forwarding_Agent		VARCHAR(500),
Co_Loader				VARCHAR(500),
CO						VARCHAR(200),
Direct_Master			BIT,
Vessel					VARCHAR(500),
Voyage					VARCHAR(500),
Place_of_Receipt		VARCHAR(100),
Place_of_Receipt_ETD	DATE ,
Port_of_Loading			VARCHAR(500),
ETD						DATE  NOT NULL,
Place_Of_Discharge		VARCHAR(500),
ETA						DATE ,
Place_Of_Delivery       VARCHAR(500),
Place_Of_Delivery_ETA   DATE ,
Final_Destination		VARCHAR(500),
Final_ETA				DATE ,
Empty_Pickup			DATE,
Delivery_ToPier			VARCHAR(500),
Freight					VARCHAR(500),
Ship_Mode				VARCHAR(100),
SVC_Term				VARCHAR(500),
Container_Qty			INT ,
OBL_Type				VARCHAR(400),
Doc_Cut_Of_Date			DATE,
Post_cut_Of_Date		DATE,
Rail_cut_Of_Date		DATE,
BL_Cancelled			BIT,           
Reasons_For_Cancel		VARCHAR(500),
Bussiness_Reffered_By	VARCHAR(500),       
Booking_Agent			BIT ,                     ---
Frt_Released			BIT ,                ----
Released_By				VARCHAR(500)
)





