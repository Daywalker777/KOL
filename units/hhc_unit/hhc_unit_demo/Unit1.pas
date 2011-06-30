{ KOL MCK } // Do not remove this line!
{$DEFINE KOL_MCK}
unit Unit1;

interface

{$IFDEF KOL_MCK}
uses Windows, Messages, ShellAPI, KOL {$IFNDEF KOL_MCK}, mirror, Classes, mckCtrls, Controls{$ENDIF}, KOL_HHC_unit;
{$ELSE}
{$I uses.inc}
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;
{$ENDIF}

type
  {$IFDEF KOL_MCK}
  {$I MCKfakeClasses.inc}
  PForm1 = ^TForm1;
  TForm1 = object(TObj)
    Form: PControl;
  {$ELSE not_KOL_MCK}
  TForm1 = class(TForm)
  {$ENDIF KOL_MCK}
    KOLProject1: TKOLProject;
    KOLForm1: TKOLForm;
    procedure KOLForm1FormCreate(Sender: PObj);
    procedure KOLForm1Paint(Sender: PControl; DC: HDC);
    procedure Button1Click(Sender: PObj);
    procedure Button2Click(Sender: PObj);
    procedure KOLForm1Destroy(Sender: PObj);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1 {$IFDEF KOL_MCK} : PForm1 {$ELSE} : TForm1 {$ENDIF} ;
  but1,but2:Pbitmapbutton;
  fon:PBitmap;
  fon_:HBRUSH;

{$IFDEF KOL_MCK}
procedure NewForm1( var Result: PForm1; AParent: PControl );
{$ENDIF}

implementation

{$IFNDEF KOL_MCK} {$R *.DFM} {$ENDIF}

{$IFDEF KOL_MCK}
{$I Unit1_1.inc}
{$ENDIF}

procedure TForm1.KOLForm1FormCreate(Sender: PObj);//����� �� ����� ��������� ��������
var asd:PBitmap;// ������ ��� ���������� �������� ��������
begin
asd:=NewBitmap(0,0);//������� ������ ������
asd.LoadFromFile('bot_01.bmp');//��������� ���� �������� �� �����
but1:=Newbitmapbuttonex(form,asd.Handle,0,0,clWhite);// ������� ������ ������,
                  //��������� ��������, ����� ������ ������� � �������
but1.OnClick:=Button2Click;//��������� ������� �� ����� (����� ��������� ��������� ��� ����� �� ��������)
//but1.DoubleBuffered:=true;//���� ������������� �� ��� � ������� ������ ���������� �������,
                            //�� � ������ ����������� (���������� ��� ������� �������������)
                            //���� �� ��������� ������ �����. ����� ��� ��������� ��� ���������� �� �������� � ����������� �������� �����???????
asd.LoadFromFile('bot_02.bmp');
but2:=Newbitmapbuttonex(form,asd.Handle,0,0,clWhite);
but2.OnClick:=Button1Click;
//but2.DoubleBuffered:=true;
asd.Free;//���������� ��������� ������, �� ��� ������ �� ����� (�� ���������� � ����� ������� ��������)


fon:=NewBitmap(0,0);//������� ������ ��� �������� �������
fon.LoadFromFile('fon.bmp');//������ �����������  - ������ ���������� � truecolor
                            //������� ����� �������� ��� ��� ��������� ��-�� ������ ���-�� ������ - �������� ����� ��������
bit2bg_bit(form.Color,7,fon.Handle);// ������������ ����������� ����� ��� ���������� � ������ �����, ������ ������ ����, �������� (��� ������ ��� �����������) � ����� ������ �������
fon_:=CreatePatternBrush(fon.Handle);//������� ����� �� ����� ������� >>>>> ������ form.onpaint (KOLForm1.paint)
but1.update_rgn;
end;

procedure TForm1.KOLForm1Paint(Sender: PControl; DC: HDC);
begin
FillRect( DC,form.ClientRect,fon_);// ��������� ����� ���������
end;

procedure TForm1.Button1Click(Sender: PObj);
begin
ShowMessage('�� ����� ������!!');
end;

procedure TForm1.Button2Click(Sender: PObj);
begin
ShowMessage('������� ������');
end;

procedure TForm1.KOLForm1Destroy(Sender: PObj);
begin // ����������� ������� �������
fon.Free;           // ��� ����� ���� ������� (� ����������� ������� �����!!!) ����� �������� �����
DeleteObject(fon_);// ������� ����� (������ ����� �� ������ �� ����� ��������)
end;

end.




