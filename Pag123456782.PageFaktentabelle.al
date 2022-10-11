/*page 123456782 PageFaktentabelle
{
    Caption = 'PageFaktentabelle';
    PageType = List;
    SourceTable = Faktentabelle;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Jahr; Rec.Jahr)
                {
                    ToolTip = 'Specifies the value of the Jahr field.';
                    ApplicationArea = All;
                }
                field(Start_Aiport; Rec.Start_Aiport)
                {
                    ToolTip = 'Specifies the value of the Start_Aiport field.';
                    ApplicationArea = All;
                }
                field(Maximaltransportierbare_Gaeste; Rec.Maximaltransportierbare_Gaeste)
                {
                    ToolTip = 'Specifies the value of the Maximal_transportierbare_Gaeste field.';
                    ApplicationArea = All;
                }
                field("Anzahl von Fluggeaste"; Rec."Anzahl von Fluggeaste")
                {
                    ToolTip = 'Specifies the value of the Anzahl von Fluggeaste field.';
                    ApplicationArea = All;
                }
                field(AnzahlFluege; Rec.AnzahlFluege)
                {
                    ToolTip = 'Specifies the value of the AnzahlFluege field.';
                    ApplicationArea = All;
                }
            }
        }
    }
    trigger OnOpenPage()
    begin

        RecPSFT.DeleteAll();
        RecPSFT.Reset();


        if RecFlueg.FindFirst() then
            repeat
                RecPSFT.Jahr := Date2DMY(RecFlueg.StartDate, 3);
                RecPSFT.Start_Aiport := RecFlueg.Start_Aiport_ID;

                if not RecPSFT.Get(RecPSFT.Jahr, RecPSFT.Start_Aiport) then
                    RecPSFT.Insert();
            until RecFlueg.Next() = 0;



        RecPSFT.Reset();
        RecFlueg.Reset();
        // Wie viele Fluggäste passen in alle Flüge aus einem Flughafen in einem Jahr  x
        if RecFlueg.FindFirst() then
            repeat
                RecPSFT.SetRange(Start_Aiport, RecFlueg.Start_Aiport_ID);
                Jahr2 := Date2DMY(RecFlueg.StartDate, 3);
                RecPSFT.SetRange(Jahr, Jahr2);
                if RecPSFT.FindFirst() then
                    RecPSFT.Maximaltransportierbare_Gaeste := RecFlueg.Kapazitaet + RecPSFT.Maximaltransportierbare_Gaeste;
                RecPSFT.Modify();



            until RecFlueg.Next() = 0;



        RecPSFT.Reset();
        RecBuchung.Reset();
        RecFlueg.Reset();
        // Wie viele Gäste buchen einen Flug in einem Jahr isngesamt 10
        if RecBuchung.FindFirst() then
            repeat
                Jahr2 := Date2DMY(RecBuchung.StartDate, 3);
                RecPSFT.SetRange(Start_Aiport, RecBuchung.Start_Airport_ID);
                RecPSFT.SetRange(Jahr, Jahr2);
                if RecPSFT.FindFirst() then
                    RecPSFT."Anzahl von Fluggeaste" := RecPSFT."Anzahl von Fluggeaste" + 1;
                RecPSFT.Modify();

            until RecBuchung.Next() = 0;


        RecPSFT.Reset();
        RecBuchung.Reset();
        RecFlueg.Reset();

        // Wie viele Flüge gibt es Insgesamt 5
        if RecFlueg.FindFirst() then
            repeat
                Jahr2 := Date2DMY(RecFlueg.StartDate, 3);
                RecPSFT.SetRange(Start_Aiport, RecFlueg.Start_Aiport_ID);
                RecPSFT.SetRange(Jahr, Jahr2);
                if RecPSFT.FindFirst() then
                    RecPSFT.AnzahlFluege := RecPSFT.AnzahlFluege + 1;
                RecPSFT.Modify();


            until RecFlueg.Next() = 0;







    end;




    var

        RecFlueg: Record Fluege;
        RecBuchung: Record Buchungen;
        RecPSFT: Record Faktentabelle;
        Jahr2: Integer;
        endJahr: Date;


}
*/