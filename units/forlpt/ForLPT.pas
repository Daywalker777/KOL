(****************************************************************)
(* ������ ForLPT (v1.1)                                         *)
(*   - ������ � LPT-������ ���������� ASM                       *)
(*                                                              *)
(* 10.12.2003                                                   *)
(* Rabotahoff Alexandr (RA)                                     *)
(* e-mail: Holden@bk.ru                                         *)
(****************************************************************)

{LPT1  (��� ����)
  2f 3f .  4f 8t 7t 6t 5t 4t 3t 2t 1t +   t-ToPort
   -  -  -  -  -  -  -  -  -  .  1f +     f-FromPort

  "-" - ������
  "+" - +5B
  "." - �� ����

 ���� �: 87654321
}
Unit ForLPT;

interface
  Function BitFromLPT(Nom:byte):byte;
  {������ ������ ���� � LPT-����� � ����� ����� Nom
  (���� ��� �����, ������� ��� ����� ���������� �� ������� ������
  [� �������� f - ��� �������� FromPort]) }
  procedure HalfByteFromLPT(var Value:Byte;isLeftHalf:boolean);
  {�������� ����� 4 ���������� ���� � value. ���� isLeftHalf=true
  �� ������������ � ����� ����� (� ���� 8765).
  ����� � ���� 4321, ������ �������� ������ ����
  ���������� � ���1, � �.�.
              ���� isLeftHalf=false, ��:
              xxxx0000-������, ���� ���� ����
              ....4321-������ ���
              xxxx1111-������, ���� ���� �����
              x-������� � ���� ���� �� ���������� }

  Procedure BitToLPT(bit:byte;Nom:byte);
  {������ ������ ���� � LPT-���� �� ����� Nom
  (���� ��� �����, ������� ��� ����� ���������� �� ������� ������
  [� �������� t - ��� �������� ToPort]) }
  Procedure ByteToLPT(data:byte);
  {������ ����� � LPT-���� ���
  ����:87654321  [��� �� ����, ������� � �������� t]
  ����:87654321 - �� Data}
  Procedure ClearLPT;
  {�������� ���� - ������� �� ��� ���� 0}

Implementation

function NomToByteForPort(Nom:byte):byte;
begin
  asm
     mov al,1
     mov cl,nom
     dec cl
     shl al,cl //���������� ����� ����� cl ��� (����� ���� ����������� - ROL ???)
     mov result,al
  end;
end;

Procedure ByteToLPT(data:byte);
//������ ����� � LPT-���� ���
//����:87654321
//����:87654321 - �� Data
begin
  asm
     {����� ����� LPT1}
     mov dx,378h
     {������ ����� �������� �� ����� Nom}
     mov al,data
     out dx,al
  end;
end;


Procedure BitToLPT(bit:byte;Nom:byte);
var adr:byte;
begin
  asm
     {!�������}
     mov al,nom
     cmp al,8
     jbe @m1 //if nom<=8 then goto m1
     mov al,8
     jmp @ex
@m1: cmp al,1
     jae @ex //if nom>=1 then goto ex
     mov al,1

@ex: mov bl,bit
     cmp bl,1
     jbe @go //if a<=1 then goto go
     mov bl,1 //a ��� bl

@go: {!�������������� ������ ���� � ������(������� ����� ������� ����) }
     mov ah,0
     mov cl,al //��������� �������� al(nom) ��� �����
     call NomToByteForPort //� ������� ���������� al, � ��������� ������� ���������� ���� �� � al
     mov adr,al

     {!������ ��� �� ������ �����}
     dec cl //���� �� 1 �� nom-1
     shl bl,cl //���������� ����� bl ����� cl ���
               //a ��� bl


     {����������� ����� ��� ���������� ������� �������� �����}
     mov cl,adr
     not cl
     {����� ����� LPT1}
     mov dx,378h
     {��������� ������ �������� �����}
     in al,dx
     and al,cl
     mov cl,al
     {������ ����� �������� �� ����� Nom}
     or bl,cl
     mov al,bl
     out dx,al
  end;
end;

Procedure ClearLPT;
begin
  asm
    mov ax,0
    call ByteToLPT
  end;
end;

Function BitFromLPT(Nom:byte):byte;
var adr:byte;
begin
  asm
     {!�������}
     mov al,nom
     cmp al,4
     jbe @m1 //if nom<=4 then goto m1
     mov al,4
     jmp @ex
@m1: cmp al,1
     jae @ex //if nom>=1 then goto ex
     mov al,1

@ex: {!�������������� ������ ���� � ������(������� ����� ������� ����) }
     mov ah,0
     add al,3
     mov cl,al //��������� �������� al(nom) ��� �����
     call NomToByteForPort //� ������� ���������� al, � ��������� ������� ���������� ���� �� � al
     mov adr,al

     {!������ �����}
     mov dx,379h //����� ����� LPT1
     in al,dx //������ �������� �����
     and al, adr //�������� ������ ��� (��� �������� ����������=0)
//   � al �������� ����������� � ����� ������

     {!����� ������ ���}
     dec cl //���� �� 1 �� nom-1
     shr al,cl //���������� ����� ������ cl ���
     mov result,al
  end;
end;

procedure HalfByteFromLPT(var Value:Byte;isLeftHalf:boolean);
var temp:byte;
begin
 {���� �: 87654321 }
 temp:=value;
  asm
     {!������ �����}
     mov dx,379h //����� ����� LPT1
     in al,dx //������ �������� �����
              //10000111-����-������, ���� ���� ����
              //.4321...-������ ���
              //11111111-����-������, ���� ���� �����

     shl al,1 //���� �.�. 8-� ��� �� 1 �� 0 (�� �������)
     shr al,4 //�������� �� 4 ������, �.�. ���� 321(�� ��������� �� ������ �����) =1
              //������ �����:
              //00000000-������, ���� ���� ����
              //....4321-������ ���
              //00001111-������, ���� ���� �����

      mov dl,0
      cmp isLeftHalf,dl
      je @ex //if isLeftHalf=false then goto ex
      shl al,4 //�������� ������ �����
 @ex: or temp,al
  end;
 value:=temp;
end;

end.
