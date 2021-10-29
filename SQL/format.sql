If exists (Select * from sysobjects where ID = Object_id('NSP_TShopeeBuyer_SelectByUserName') And OBJECTPROPERTY(id, N'IsProcedure') = 1)
    drop procedure NSP_TShopeeBuyer_SelectByUserName
    go
    Create Procedure NSP_TShopeeBuyer_SelectByUserName
    (
        @buyer_username as VARCHAR(max)
    )
    as
        Select * 
        From [TShopeeBuyer] with (nolock)
        Where 1=1
        And [buyer_username] = @buyer_username
    go