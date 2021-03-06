unit OverSeasOrder;

interface

uses Windows, Messages, SysUtils, Variants, Classes, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, StrUtils, SKCOMLib_TLB, String_Form;

  procedure OverseasFutureOrder(OderPrice: Extended);
  function ConvertOrderDate(Year_Str, Month_Str: String): String;
  function getProductNO(Comm_Str: String): String;


implementation

uses ChungYi_Main, Quote_uSKQ, SQLFunc, Public_Variant, StringList_Fun, DMRecord,
     Quote, Strategy, Stock_OptionOrder;

// overseas 期貨下單
procedure OverseasFutureOrder(OderPrice: Extended);
var
   Item, ListItem, ListItem1 : TListItem;
   iCode : integer;
   iSize : integer;

   SeaOrder: OVERSEAFUTUREORDER;
   getOrderMsg: WideString;
   StockList: TStringList;
   getTime : TDateTime;
   Date_Str, Year_Str, Month_Str: String;
begin
   StockList:= TstringList.Create;
   StockList.Add(fmChungYi.cbbCommNO.Text);
   StockList.Delimiter:= ',';
   StockList.DelimitedText:= StockList.Text;

   getTime:= Now;
   Date_Str:= stringreplace(DateToStr(getTime), '/', '', [rfReplaceAll, rfIgnoreCase]);
   Year_Str:= MidStr(Date_Str, 1, 4);
   Month_Str:= MidStr(Date_Str, 5, 2);

   fmChungYi.edtPrice.Text:= FloatToStr(CloseP); // 價格判定

       Item := fmChungYi.ListView1.Items.Item[0];

           ListItem := fmChungYi.ListView3.Items.Add;
           ListItem.Caption := Item.SubItems[0]+Item.Caption;
           ListItem.SubItems.Add(TickTime);  //0
           ListItem.SubItems.Add( fmChungYi.cbbCommNO.Text);  //1
           ListItem.SubItems.Add( fmChungYi.rgBuySell.Items.Strings[ fmChungYi.rgBuySell.ItemIndex]);
           ListItem.SubItems.Add( fmChungYi.rgTradeType.Items.Strings[ fmChungYi.rgTradeType.ItemIndex]);
           ListItem.SubItems.Add( fmChungYi.edtPrice.Text);
           ListItem.SubItems.Add(IntToStr(TradeQty));
           ListItem.SubItems.Add( '');
           ListItem.SubItems.Add( '');


           if iCode <> 0 then
           begin
            ShowMessage('無法讀取即時庫存, 請洽證券商');
            Exit;
           end;

           SeaOrder.bstrFullAccount:= WideString(FutureAccount);
           SeaOrder.bstrExchangeNo:= WideString(StockList[0]);
      //     SeaOrder.bstrStockNo:= WideString(StockList[1]);
           SeaOrder.bstrStockNo:= getProductNO(StockList[1]);
      //     SeaOrder.bstrYearMonth:= WideString(Year_Str + Month_Str); // ???
           SeaOrder.bstrYearMonth:= ConvertOrderDate(Year_Str, Month_Str);
      //     SeaOrder.bstrYearMonth2:= WideString(Year_Str + Month_Str); // ???
           SeaOrder.bstrOrder:= WideString(FloatToStr(OderPrice));
      //     SeaOrder.bstrOrderNumerator:= WideString(FloatToStr(OderPrice)); // ???
           SeaOrder.bstrTrigger:= WideString(FloatToStr(OderPrice));   // ???
      //     SeaOrder.bstrTriggerNumerator:= WideString(FloatToStr(OderPrice));  // ???
           if(fmChungYi.rgBuySell.Items.Strings[ fmChungYi.rgBuySell.ItemIndex]='B') then
             SeaOrder.sBuySell:= 0
           else
             SeaOrder.sBuySell:= 1;

           SeaOrder.sDayTrade:= 0; // ???
           if(TradeQty > 2) then
             TradeQty:= 1;
           SeaOrder.nQty:= TradeQty;
           SeaOrder.sTradeType:= 0; // 0:ROD  1:IOC  2:FOK
           SeaOrder.sSpecialTradeType:= 0; // 0:LMT  1:MKT  2:STL  3.STP ???
           SeaOrder.sNewClose:= 0; //新平倉，0:新倉 1:平倉 (目前海選可使用新、平倉;海期僅新倉可選)


           iCode := fmQuote.SKOrderLib1.SendOverSeaFutureOrder(WideString(fmQuote.edtLogID.Text), false,
             SeaOrder, getOrderMsg);

             if (iCode <> SK_SUCCESS) and (iCode <> 5)  then
             begin
              ListItem.SubItems.Strings[7] := '委託失敗, Code: ' + IntToStr( iCode)+ ' ' + getOrderMsg;
              // 如果保證金不足, 自動平倉
               if AnsiContainsStr(getOrderMsg, '保證金不足') then fmChungYi.btnBalance.Click;
              // 暫時程式, 須刪除
               TempShowInterestStock();
             end else begin

              TriggerInternal:= True;

              ListItem.SubItems.Strings[6] := getOrderMsg;
              // 獲取未平倉庫存
              fmQuote.SKOrderLib1.GetOverSeaFutureOpenInterest(PAnsiChar(WideString(fmChungYi.edUserid.Text)), PAnsiChar(WideString(FutureAccount)));

              TempShowInterestStock();
             end;

   LastInventory:= False; // 一下單後, 昨日留倉判定歸 false
   // 顯示當日損益
   fmQuote.lbBalance.Caption:= '當日損益: ' + FloatToStr(GetBalance());
 //  Windows.Beep(440, 1000);
end;

function ConvertOrderDate(Year_Str, Month_Str: String): String;
var Year_Int, Month_Int: Integer;
begin
  Year_Int:= StrToInt(Year_Str);
  Month_Int:= StrToInt(Month_Str);
  if(Month_Int > 9) then begin
    Month_Int:= Month_Int + 3 - 12;
    Year_Int:= Year_Int + 1;
  end else
    Month_Int:= Month_Int + 3;

  if(Month_Int < 10) then
    Result:= IntToStr(Year_Int) + '0' + IntToStr(Month_Int)
  else
    Result:= IntToStr(Year_Int) + IntToStr(Month_Int);
end;

function getProductNO(Comm_Str: String): String;
var Position: Integer;
begin
  Position:= Pos('_', Comm_Str);
  Result:= StrMiddle(Comm_Str, 1, Position - 1);
end;

end.
