Unit BaseType;
{---------------------------------------------------------------------------}
                                  INTERFACE
{---------------------------------------------------------------------------}
type
     DefaultTypeRealMy={single}
                       {double}
                       {single}
                       extended;
     DTRM=DefaultTypeRealMy;
const
    SizeOfMyReal=SizeOf(DefaultTypeRealMy);
{================================================
  Type    �     Range         �Digits �Bytes
 �������������������������������������������
  single  �  1.5e-45..3.4e38  �  7-8  �  4
  real    �  2.9e-39..1.7e38  � 11-12 �  6
  double  � 5.0e-324..1.7e308 � 15-16 �  8
  extended�3.4e-4932..1.1e4932� 19-20 � 10
 �������������������������������������������
  comp    �  -9.2e18..9.2e18  � 19-20 �  8
 �������������������������������������������
  Note: The comp type is a 64-bit integer.

=================================================}
  SingleMashEpsilon= 1.19209289550781E-0007;
    RealMashEpsilon= 9.09494701772928E-0013;
  DoubleMashEpsilon= 2.22044604925031E-0016;
ExtendedMashEpsilon= 1.08420217248550E-0019;

  Function RealTypeName:String;
  Function GetMashEpsilon:DefaultTypeRealMy;
  Function GetRealTypeQuasiMax:DefaultTypeRealMy;
{---------------------------------------------------------------------------}
                               IMPLEMENTATION
{---------------------------------------------------------------------------}
  Function GetMashEpsilon:DefaultTypeRealMy;
   begin
     Case SizeOfMyReal of
     4: GetMashEpsilon:=  SingleMashEpsilon;
     6: GetMashEpsilon:=    RealMashEpsilon;
     8: GetMashEpsilon:=  DoubleMashEpsilon;
    10: GetMashEpsilon:=ExtendedMashEpsilon;
    end;
   end;
  Function GetRealTypeQuasiMax;
   begin
     Case SizeOfMyReal of
     4: GetRealTypeQuasiMax:=3e37;     {3.4e38}
     6: GetRealTypeQuasiMax:=1e37;     {1.7e38}
     8: GetRealTypeQuasiMax:=1e307;    {1.7e308;}
    10: GetRealTypeQuasiMax:=1e4931;   {1.1e4932}
    end;
   end;

  Function RealTypeName;
   begin
     Case SizeOfMyReal of
     4: RealTypeName:='single';
     6: RealTypeName:='real';
     8: RealTypeName:='double';
    10: RealTypeName:='extended';
    end;
   end;
{---------------------------------------------------------------------------}
{                         ���������������� �����                            }
{---------------------------------------------------------------------------}
(*
 Begin
 Writeln('GetRealTypeQuasiMax=',GetRealTypeQuasiMax);Readln;
*)
End.