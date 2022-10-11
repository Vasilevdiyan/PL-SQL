/*
table 123456781 Buchungen
{
    Caption = 'Buchungen';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Bookingid"; Code[10])
        {
            Caption = 'Bookingid';
            DataClassification = ToBeClassified;
        }
     
          field(2; "Flueg_id"; Code[10])
        {
            Caption = 'Flueg_id';
            DataClassification = ToBeClassified;
            TableRelation = Fluege.Flueg_id ;
        }

         field(3; "StartDATE"; Date)
        {
            Caption = 'StartDATE';
            DataClassification = ToBeClassified;
         
           
        }
          field(4; "Start_Airport_ID"; Code[12])
        {
            Caption = 'Start_Airport_ID';
            DataClassification = ToBeClassified;
          
           
        }




    }
    keys
    {
        key(PK; "Bookingid",Flueg_id)
        {
            Clustered = true;
        }
    }
}
*/