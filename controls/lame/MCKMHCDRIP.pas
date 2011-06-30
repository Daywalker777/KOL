unit MCKMHCDRIP;
//  MHLame ��������� (MHLame Component)
//  ����� (Author): ����� ������� (Zharov Dmitry) aka �������� (Gandalf)
//  ���� �������� (Create date): 15-���(feb)-2003
//  ���� ��������� (Last correction Date): 15-���(feb)-2003
//  ������ (Version): 1.0
//  EMail: Gandalf@kol.mastak.ru
//  WWW: http://kol.mastak.ru
//  ������������� (Thanks):
//    Alexei O. Sabline
//  ����� � (New in):
//  V1.0
//  [+] ������
//
//  ������ ��� (To-Do list):
//  1. ��������� (Asm)
//  2. �������������� (Optimize)
//  3. ���������� (Exceptions)


interface

uses
  KOL, KOLMHCDRIP, Mirror, MCKObjs, Classes, Graphics;

type

  TKOLMHCDRIP = class(TKOLObj)
  private
  protected
    function  AdditionalUnits: string; override;
    procedure SetupFirst(SL: TStringList; const AName,AParent, Prefix: String); override;
    function SetupParams(const AName, AParent: String): String;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published

  end;

  procedure Register;

implementation

constructor TKOLMHCDRip.Create(AOwner: TComponent);
begin
  inherited;
  // �������� �� ���������
end;

destructor TKOLMHCDRip.Destroy;
begin
  inherited;
end;

function TKOLMHCDRip.AdditionalUnits;
begin
   Result := ', KOLMHCDRip';
end;


procedure TKOLMHCDRip.SetupFirst(SL: TStringList; const AName, AParent, Prefix: String);
begin
  SL.Add('');
  SL.Add(Prefix+AName+':=NewMHCDRIP('+AParent+');');
end;

function TKOLMHCDRip.SetupParams(const AName, AParent: String): String;
begin
  Result:='';
end;

procedure Register;
begin
  RegisterComponents('KOL Misc', [TKOLMHCDRip]);
end;

end.

