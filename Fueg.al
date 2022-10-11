/*
table 123456780 Fluege
{
    Caption = 'Fluege';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Flueg_id"; Code[10])
        {
            Caption = 'Flueg_id';
            DataClassification = ToBeClassified;
        }
     
          field(2; "Kapazitaet"; Integer)
        {
            Caption = 'Kapazitaet';
            DataClassification = ToBeClassified;
        }
           field(3; "Start_Aiport_ID"; Code[12])
        {
            Caption = 'Start_Aiport_ID';
            DataClassification = ToBeClassified;
        }
             field(4; "StartDate"; Date)
        {
            Caption = 'StartDate';
            DataClassification = ToBeClassified;
        }
        



    }
    keys
    {
        key(PK; "Flueg_id")
        {
            Clustered = true;
        }
    }
}
*/