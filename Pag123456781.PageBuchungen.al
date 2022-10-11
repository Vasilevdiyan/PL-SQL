/*page 123456781 PageBuchungen
{
    Caption = 'PageBuchungen';
    PageType = List;
    SourceTable = Buchungen;
    
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Bookingid; Rec.Bookingid)
                {
                    ToolTip = 'Specifies the value of the Bookingid field.';
                    ApplicationArea = All;
                }
                field(Flueg_id; Rec.Flueg_id)
                {
                    ToolTip = 'Specifies the value of the Flueg_id field.';
                    ApplicationArea = All;
                }
                field(StartDATE; Rec.StartDATE)
                {
                    ToolTip = 'Specifies the value of the StartDATE field.';
                    ApplicationArea = All;
                }
                  field(Start_Airport_ID; Rec.Start_Airport_ID)
                {
                    ToolTip = 'Specifies the value of the StartDATE field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
*/