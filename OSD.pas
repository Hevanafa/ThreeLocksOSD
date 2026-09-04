unit OSD;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    StateLabel: TLabel;
    StatePollTimer: TTimer;
    procedure FormCreate(Sender:TObject);
    procedure FormShow(Sender:TObject);
    procedure StatePollTimerTimer(Sender:TObject);
  private

  public

  end;

implementation

uses AppStates;

var
  lastNumLockState, lastCapsLockState, lastScrollLockState: boolean;
  isFirstTime: boolean;

{$R *.lfm}

{ TForm2 }

procedure TForm2.StatePollTimerTimer(Sender:TObject);
begin
  if isFirstTime then begin
    { Don't show any notifications yet }
    lastNumLockState := numLockState;
    lastCapsLockState := capsLockState;
    lastScrollLockState := scrollLockState;
  end;

  { TODO: Process notifications }
end;

procedure TForm2.FormCreate(Sender:TObject);
begin
  isFirstTime := true;
end;

procedure TForm2.FormShow(Sender:TObject);
begin
  StatePollTimer.Enabled := true;
end;

end.

