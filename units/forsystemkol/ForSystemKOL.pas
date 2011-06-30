(****************************************************************)
(* ������ ForSystemKOL (v1.1)                                   *)
(*   - ������ � ��������� ���������                             *)
(*   - ������ � ������� ������� ����                            *)
(*   - Bool2STR, Str2Bool (������� ���� �� ����)                *)
(*                                                              *)
(* 09.12.2003                                                   *)
(* Rabotahoff Alexandr (RA)                                     *)
(* e-mail: Holden@bk.ru                                         *)
(****************************************************************)
unit ForSystemKOL;

interface

uses KOL;

Function Any2Ten(s:ShortString;sys:byte):LongInt;
{������� �� ����� ������� ��������� � 10-�
1) Length(s)<=255, ����� ���������;
2) 2<=Sys<=26, ����� ���������� =2 ��� =26;
3) � s ����������� ������������ ����� � ��������� �����
(���� ���������� ������ �������, �� ��� ����� ��������� ��� 0);
4) ���� ������� ����� �� ����� �������� � �������� ����������
�������� �������� ������� ���������, �� ������ ����� ������� �����
���������� ����������� ���������� �� ���� ������� ���������;}
Function Ten2Any(a:LongInt;sys:byte):ShortString;
{������� �� 10-� ������� ��������� � �����
2<=Sys<=26, ����� ���������� =2 ��� =26}
Function Ten2Two(a:LongInt;CountDigits:byte):ShortString;
{���������� ����� � � ����� �������� ������� ���������
������ � ���������� ����� ����� CountDigits ���� (�.�. ���)
���� ���� ����� �� �������, �� ��������� ������� 0,
� ���� ���� ����� ������, ��� �ountDigits, �� ����� �������
������� "������" ����
��������:
 Ten2Two(1,8) ����� ="00000001"
 Ten2Two(255,8) ����� ="11111111"
 Ten2Two(256,8) ����� ="00000000"
 Ten2Two(257,8) ����� ="00000001"}

Function GetDPNE(DPNEComplette:AnsiString;DPNEDif:ShortString):AnsiString;
{ DPNE=DiskPathNameExt-���������������������
 DPNEComplette-�������� ������ ���� � ����� (����, ����, ��� ����� � ����������),
               [����� ���� ���������, ��������, ������� SaveDialog1.FileName]
 DPNEDif (�� �������� � ��������) [�� ������� ������� ���� ���, �� � ��� ��������]:
 'D' ��� 'Disk'; -������� ������ ��� ����� (��� ':' � �����) [C]
 'P' ��� 'Puth'; -������� ������ ���� � ����� (��� ����� '\' � ����� � ������) [windows\temp]
 'DP' ��� 'Disk_Puth'; -������� ������ ��� ����� � ���� � ����� (��� ����� '\' � �����) [C:\windows\temp]
 'N' ��� 'Name'; -������� ������ ��� ����� (��� ����� � �����) [MyFile]
 'E' ��� 'Ext'; -������� ������ ���������� (��� ����� � ������) [exe]
 'PN' ��� 'Puth_Name'; -������� ���� � ��� ����� (��� ���������� � ��� ����� � �����) [windows\temp\MyFile]
 'DPN' ��� 'Disk_Puth_Name'; -������� ��� �����, ���� � ��� ����� (��� ���������� � ��� ����� � �����) [C:\windows\temp\MyFile]
 'NE' ��� 'Name_Ext'; -������� ��� � ���������� [MyFile.exe]
 'PNE' ��� 'Puth_Name_Ext'; -������� ����, ��� � ���������� [windows\temp\MyFile.exe]
 'DPNE' ��� 'Disk_Puth_Name_Ext'; -������� ��� �����, ����, ��� � ���������� [C:\windows\temp\MyFile.exe]

 ���� � DPNEComplette � ������ � � ����� ����� ���� " ��� ' ["C:\Windows\MyFile.exe"],['C:\Windows\MyFile.exe']
 �� �������� ����������� � ���� [C:\Windows\MyFile.exe], �.�. ��� �������
 [� KOL � ������ ��� �� ��������, � ��� ��������� TFilenameEdit (�� RxLib) ������� ������ (��� ������?) ������]}
Function AddExt(FileName,Ext:AnsiString):AnsiString;
{������� ��������� � ����� ����� FileName ���������� Ext.
���� � ����� ����� ��� ���������� ��� ����, �� ����������
��� ��� �� �����������.
���������� ����������� ���� ������ � ����� ����� ���������
���������� ���.
� EXT ����� ����������� ��������� ���������� ����� "/",
��� ������ �������� ('htm/html/xhtml')
������ ���������� ����������� � ������� �������� ����������}

Function Bool2STR(bool:Boolean):AnsiString;
{�� Boolean � String
����� ��� �������� exe ������, ��� ����� ���:
 Bool2Str: array [Boolean] of String = ('FALSE', 'TRUE');
 (����������!)
}
Function Str2Bool(s:AnsiString):Boolean;
{�� String � Boolean}

implementation

Function Any2Ten(s:ShortString;sys:byte):LongInt;
var m,n,k,p,l,dl:LongInt;
begin
  k:=0;
try
  dl:=Length(s);
  s:=AnsiUpperCase(s);
  if Sys<2 then sys:=2;
  if sys>26 then sys:=26;
//  if dl=0 then s:='0';
  if dl>0 then
  for n:=dl-1 downto 0 do
  begin
    p:=1;
    for m:=1 to n do p:=p*sys;
    if (ord(s[dl-n])>=65)and(ord(s[dl-n])<=90) then l:=Ord(s[dl-n])-55
    else if (ord(s[dl-n])>=48)and(ord(s[dl-n])<=57) then l:=Str2Int(s[dl-n])
    else l:=0;
    if l>sys-1 then l:=sys-1;
    k:=k+l*p;
  end;
finally
  Result:=k;
end;
end;

function Ten2Any(a:LongInt;sys:byte):ShortString;
var s:ShortString;
    koll,n:LongInt;
    otv:array [1..255] of byte;
begin
  s:='';
try
  if Sys<2 then sys:=2;
  if sys>26 then sys:=26;
  koll:=1;
  while a<>0 do
  begin
    otv[koll]:=a mod sys;
    a:=a div sys;
    inc(koll);
  end;
  for n:=koll-1 downto 1 do
  begin
    if otv[n]>=10 then s:=s+chr(otv[n]+55)
    else s:=s+Int2Str(otv[n]);
  end;
finally
  if s='' then s:='0';
  Result:=s;
end;
end;

Function Ten2Two(a:LongInt;CountDigits:byte):ShortString;
var len:Integer;
begin
  Result:=Ten2Any(a,2);
  len:=Length(Result);
  if len>CountDigits
  then Result:=copy(Result,Len-CountDigits+1,CountDigits)
  else Result:=StringOfChar('0',CountDigits-Len)+Result;
end;

Function GetDPNE(DPNEComplette:AnsiString;DPNEDif:ShortString):AnsiString;
var dl,n:LongInt;
    Mas:array [0..3] of AnsiString; // 0-Disk; 1-Puth; 2-Name; 3-Ext
    uk,First:Byte;
    SExt:AnsiString;
    dif:AnsiString;
    add1,add2:ShortString;
begin
  Result:='';
  dl:=Length(DPNEComplette);
  for uk:=0 to 3 do mas[uk]:='';

  if ((DPNEComplette[1]='"')and(DPNEComplette[dl]='"'))or
     ((DPNEComplette[1]='''')and(DPNEComplette[dl]=''''))
  then begin
    First:=2;
    dec(dl);
  end
  else First:=1;

  uk:=3;
  for n:=dl downto First do
  begin
    if uk=0 then mas[0]:=DPNEComplette[n]+mas[0];

    if uk=1
    then begin
      if DPNEComplette[n]<>':' then mas[1]:=DPNEComplette[n]+mas[1]
      else dec(Uk);
    end;

    if uk=2
    then begin
      if DPNEComplette[n]<>'\' then Mas[2]:=DPNEComplette[n]+mas[2]
      else dec(uk);
    end;

    if uk=3
    then begin
      if DPNEComplette[n]=':'
      then begin
        mas[1]:=mas[3];
        mas[3]:='';
        dec(uk);Dec(uk);Dec(Uk);
      end
      else if DPNEComplette[n]='\'
      then begin
        mas[2]:=mas[3];
        mas[3]:='';
        dec(uk);dec(uk);
      end
      else if DPNEComplette[n]<>'.' then Mas[3]:=DPNEComplette[n]+mas[3]
           else dec(uk);
    end;
  end;//n
  if mas[3]='' then SExt:=''
    else SExt:='.'+mas[3];
  if (mas[1]<>'')and(mas[1][1]='\') then mas[1]:=copy(mas[1],2,Length(mas[1])-1);

  if mas[1]<>'' then add2:='\' else add2:='';
  if mas[0]<>'' then add1:=':\' else add1:='';
  dif:=AnsiLowerCase(DPNEDif);
  if (dif='d')or(Dif='disk') then Result:=mas[0]
  else if (dif='p')or(Dif='puth') then Result:=mas[1]
  else if (dif='dp')or(Dif='disk_puth') then Result:=mas[0]+add1{':\'}+mas[1]
  else if (dif='n')or(Dif='name') then Result:=mas[2]
  else if (dif='e')or(Dif='ext') then Result:=mas[3]
  else if (dif='pn')or(Dif='puth_name') then Result:=mas[1]+add2{'\'}+mas[2]
  else if (dif='dpn')or(Dif='disk_puth_name') then Result:=mas[0]+add1{':\'}+mas[1]+add2{'\'}+mas[2]
  else if (dif='ne')or(Dif='name_ext') then Result:=mas[2]+SExt
  else if (dif='pne')or(Dif='puth_name_ext') then Result:=mas[1]+add2{'\'}+mas[2]+SExt
  else if (dif='dpne')or(Dif='disk_puth_name_ext') then Result:=mas[0]+add1{':\'}+mas[1]+add2{'\'}+mas[2]+SExt;
//  Result:=AnsiLowerCase(Result);
end;

Function AddExt(FileName,Ext:AnsiString):AnsiString;
var exts:array [1..255] of AnsiString;
    n,kol:integer;
    f:boolean;
begin
try
  kol:=1;
  exts[1]:='';
  for n:=1 to Length(ext) do
  begin
    if ext[n]<>'/' then exts[kol]:=exts[kol]+ext[n]
    else begin
      inc(kol);
      exts[kol]:='';
    end;
  end;
  if exts[1]='' then exts[1]:=ext;
  f:=False;n:=1;
  while (n<=kol)and(not(f)) do
  begin
    if GetDPNE(FileName,'Ext')=Exts[n] then f:=True;
    inc(n);
  end;
  if not F then Result:=GetDPNE(FileName,'Disk_Puth_Name')+'.'+Exts[1]//��������� ����������
  else Result:=FileName;//�� ���� ������ ���������
except
  Result:=FileName;
end;
end;

Function Bool2STR(bool:Boolean):AnsiString;
begin
  if bool then result:='True'
  else Result:='False';
end;

Function Str2Bool(s:AnsiString):Boolean;
begin
  result:=AnsiLowerCase(s)='true';
end;

end.

