unit KOLMHAboutDialog;
//  MHAboutDialog ��������� (MHAboutDialog Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 21-���(oct)-2001
//  ���� ��������� (Last correction Date): 15-���(feb)-2003
//  ������ (Version): 1.14
//  EMail: Gandalf@kol.mastak.ru
//  WWW: http://kol.mastak.ru
//  ������������� (Thanks):
//    Michael Beschetov
//    Alexander Pravdin
//  ����� � (New in):
//  V1.14
//  [+] ��������� D7 (D7 Support) [KOLnMCK]
//
//  V1.13
//  [+] ��������� D6 (D6 Support) <Thanks to Alexander Pravdin> [KOLnMCK]
//
//  V1.12 2002-����-10
//  Opti-z (KOL)
//
//  V1.11 2002-����-20
//  PChar Bug Fix (Thanks to Michael Beschetov)
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)

interface

uses
  KOL, Windows, ShellAPI;

type

  TIconType=(itShell,itApplication,itCustom);
  {
  ��� ������
  it_Shell - ��������� (������ Windows)
  it_Application - ���� ���������� (Applet.Icon)
  it_Custom - ��������� (MHAboutDialog.Icon)
  }

  PMHAboutDialog =^TMHAboutDialog;
  TKOLMHAboutDialog = PMHAboutDialog;

  TMHAboutDialog = object(TObj)
  private
  public
    Title:String;
    CopyRight:String;
    Text:String;
    Icon:HIcon;
    IconType:TIconType;
    destructor Destroy; virtual;
    procedure Execute;
  end;

function NewMHAboutDialog:PMHAboutDialog;

implementation

function NewMHAboutDialog:PMHAboutDialog;
begin
  New(Result, Create);
end;

destructor TMHAboutDialog.Destroy;
begin
  DestroyIcon(Icon);
  inherited;
end;

procedure TMHAboutDialog.Execute;
var
  HWndOwner:THandle;
  TMPIcon:HIcon;
begin
  if Assigned(Applet) then
    HWndOwner:=Applet.Handle
  else
    HWndOwner:=0;
  case IconType of
    itShell:TMPIcon:=0;
    itApplication:TMPIcon:=Applet.Icon;
    itCustom:TMPIcon:=Icon;
  end; //case
  ShellAbout(HWndOwner,PChar(Title+'#'+Text),PChar(CopyRight),TMPIcon);
end;

end.
