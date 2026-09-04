unit OSD;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls,ExtCtrls,
  AppStates;

type

  { TForm2 }

  TForm2 = class(TForm)
    StateLabel: TLabel;
    StatePollTimer: TTimer;
    procedure StatePollTimerTimer(Sender:TObject);
  private

  public

  end;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.StatePollTimerTimer(Sender:TObject);
begin

end;

end.

