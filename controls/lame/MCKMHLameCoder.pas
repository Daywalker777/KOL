unit MCKMHLameCoder;
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
  KOL, KOLMHLameCoder, Mirror, MCKObjs, Classes, Graphics;

type

  TKOLMHLameCoder = class(TKOLObj)
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

constructor TKOLMHLameCoder.Create(AOwner: TComponent);
begin
  inherited;
  // �������� �� ���������
end;

destructor TKOLMHLameCoder.Destroy;
begin
  inherited;
end;

function TKOLMHLameCoder.AdditionalUnits;
begin
   Result := ', KOLMHLameCoder';
end;


procedure TKOLMHLameCoder.SetupFirst(SL: TStringList; const AName, AParent, Prefix: String);
begin
  SL.Add('');
  SL.Add(Prefix+AName+':=NewMHLameCoder('+AParent+');');
end;

function TKOLMHLameCoder.SetupParams(const AName, AParent: String): String;
begin
  Result:='';
end;

procedure Register;
begin
  RegisterComponents('KOL Misc', [TKOLMHLameCoder]);
end;

end.

