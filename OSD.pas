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
    procedure ShowBriefly;
  end;

implementation

uses AppStates;

var
  lastNumLockState, lastCapsLockState, lastScrollLockState: boolean;
  isFirstTime: boolean;
  disappearTick: double;

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

  if visible and (now >= disappearTick) then
    visible := false

  { TODO: Write the labels }

  if lastNumLockState <> numLockState then begin
    lastNumLockState := numLockState;

    visible := true;
  end;

  if lastCapsLockState <> capsLockState then begin
    lastCapsLockState := capsLockState;

    visible := true;
  end;

    if lastScrollLockState <> scrollLockState then begin
    lastScrollLockState := scrollLockState;

    visible := true;
  end;
end;

procedure TForm2.ShowBriefly;
begin
  self.Visible := true;
  disappearTick := Now + 1.0;
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

