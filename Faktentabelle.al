/*
table 123456782 Faktentabelle
{
    Caption = 'Faktentabelle';
    DataClassification = ToBeClassified;

    fields
    {
           field(1; "Jahr";Integer)
        {
            Caption = 'Jahr';
            DataClassification = ToBeClassified;
           
        }
        field(2; "Start_Aiport"; Code[10])
        {
            Caption = 'Start_Aiport';
            DataClassification = ToBeClassified;
          
        }
     
       

         field(3; "Maximaltransportierbare_Gaeste"; Integer)
        {
            Caption = 'Maximal_transportierbare_Gaeste';
            DataClassification = ToBeClassified;
          
        }
             field(4; "Anzahl von Fluggeaste"; Integer)
        {
            Caption = 'Anzahl von Fluggeaste';
            DataClassification = ToBeClassified;
          
        }
               field(5; "AnzahlFluege"; Integer)
        {
            Caption = 'AnzahlFluege';
            DataClassification = ToBeClassified;
          
        }



    }
    keys
    {
        key(PK; Jahr,Start_Aiport)
        {
            Clustered = true;
        }
    }
}
*/