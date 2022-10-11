
/*
page 123456780 PageFueg
{
    Caption = 'PageFueg';
    PageType = List;
    SourceTable = Fluege;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Flueg_id; Rec.Flueg_id)
                {
                    ToolTip = 'Specifies the value of the Flueg_id field.';
                    ApplicationArea = All;
                }
                field(Kapazitaet; Rec.Kapazitaet)
                {
                    ToolTip = 'Specifies the value of the Kapazitaet field.';
                    ApplicationArea = All;
                }
                  field(Start_Aiport_ID; Rec.Start_Aiport_ID  )
                {
                    ToolTip = 'Specifies the value of the Kapazitaet field.';
                    ApplicationArea = All;
                }
                   field(StartDate; Rec.StartDate  )
                {
                    ToolTip = 'Specifies the value of the Kapazitaet field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
*/