unit GeneralFunction;

interface

uses Windows, Messages, SysUtils, Controls, Classes, DBClient, DB, Dialogs,
     Graphics, Forms;

 function TimeTransfer(TimeStr: String): String;
 function RecordStockQty(StockNO: String): Integer;
 function GetProgramDir(): String;

implementation

uses Public_Variant, Quote, DMRecord;

// 轉換時間
function TimeTransfer(TimeStr: String): String;
begin
 if Length(TimeStr) = 1 then
   Result:= '00:00:0' + TimeStr
 else if Length(TimeStr) = 2 then
   Result:= '00:00:' + TimeStr
 else if Length(TimeStr) = 3 then
   Result:= '00:0' + Copy(TimeStr, 1, 1) + ':' + Copy(TimeStr, 2, 2)
 else if Length(TimeStr) = 4 then
   Result:= '00:' + Copy(TimeStr, 1, 2) + ':' + Copy(TimeStr, 3, 2)
 else if Length(TimeStr) = 5 then
   Result:= '0' + Copy(TimeStr, 1, 1) + ':' + Copy(TimeStr, 2, 2) + ':' + Copy(TimeStr, 4, 2)
 else if Length(TimeStr) = 6 then
   Result:= Copy(TimeStr, 1, 2) + ':' + Copy(TimeStr, 3, 2) + ':' + Copy(TimeStr, 5, 2);
end;

// 判斷從哪一點開始下載
function RecordStockQty(StockNO: String): Integer;
begin
{ DataModule1.asqQU_Temp.SQL.Text:= 'select * from TradeRecord where StockNO="'
      + StockNO + '" and TradeDate="' + DateToStr(Date) + '"';
 DataModule1.asqQU_Temp.Open;

 if DataModule1.asqQU_Temp.RecordCount > 0 then
  Result:= DataModule1.asqQU_Temp.RecordCount
 else
  Result:= 0; }

 if SQLList.Count > 0 then
  Result:= SQLList.Count
 else
  Result:= 0;
end;

function GetProgramDir(): String;
var
        s   :   string;
begin
        SetLength(s,255);
        GetWindowsDirectory(Pchar(s),255);
        SetLength(s,StrLen(Pchar(s)));
end;
end.
