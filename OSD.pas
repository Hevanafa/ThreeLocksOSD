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

uses AppStates, DateUtils;

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

    isFirstTime := false;
  end;

  if visible and (now >= disappearTick) then
    visible := false;

  { TODO: Write the labels }

  if lastNumLockState <> numLockState then begin
    lastNumLockState := numLockState;

    ShowBriefly;
  end;

  if lastCapsLockState <> capsLockState then begin
    lastCapsLockState := capsLockState;

    ShowBriefly;
  end;

    if lastScrollLockState <> scrollLockState then begin
    lastScrollLockState := scrollLockState;

    ShowBriefly;
  end;
end;

procedure TForm2.ShowBriefly;
begin
  Visible := true;
  disappearTick := IncSecond(now, 1);
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

