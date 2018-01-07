unit OverseasSocket;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DateUtils,
  Dialogs, StdCtrls, ExtCtrls, AppEvnts, ShellAPI,  ScktComp, WinSock, SyncObjs,WinInet;

type
  TStock =record
    ExchangeId: string[5];
    CommodityId: string[10];
    Time: string[8];
    Option: string;
    SettleMentYear: integer;
    SettleMentMonth: integer;
    StrickPrice: integer;
    SalePrice: double;
    UnitVol: integer;
    ToTalVol: integer;
    Bid1_Price: double;
    Ask1_Price: double;
    Bid1_Vol: integer;
    Ask1_Vol: integer;
  end;

  THead = record
    ExchangeId: string[5];
    CommodityId: string[10];
    Option: string;
    SettleMentYear: integer;
    SettleMentMonth: integer;
    StrickPrice: integer;
    OpenPrice: double;
    HighPrice: double;
    LowPrice: double;
    RefPrice: double;
    bDenominator: double;
  end;

  TTick = record
    ExchangeId: string[5];
    CommodityId: string[10];
    Option: string;
    SettleMentYear: integer;
    SettleMentMonth: integer;
    StrickPrice: integer;
    TickTime: string[8];
    index: integer;
    SalePrice: double;
    SaleVol: integer;
  end;


  TBestBidAsk = record
    ExchangeId: string[5];
    CommodityId: string[10];
    Option: string;
    SettleMentYear: integer;
    SettleMentMonth: integer;
    StrickPrice: integer;
    TickTime: string[11];
    AskPrice1:double;
    AskPrice2:double;
    AskPrice3:double;
    AskPrice4:double;
    AskPrice5:double;
    BidPrice1:double;
    BidPrice2:double;
    BidPrice3:double;
    BidPrice4:double;
    BidPrice5:double;
    AskVol1: integer;
    AskVol2: integer;
    AskVol3: integer;
    AskVol4: integer;
    AskVol5: integer;
    BidVol1: integer;
    BidVol2: integer;
    BidVol3: integer;
    BidVol4: integer;
    BidVol5: integer;
    TotalVol:integer;
    TotalBuyCount:integer;
    TotalSellCount:integer;
  end;



const PUBLIC_SOCKET = 'LSocket.dll';
function ApiSendCmd(Ttype:integer): longint;stdcall; external PUBLIC_SOCKET;
function Certify( Source: PAnsiChar; UserID: PAnsiChar; UserPW: PAnsiChar; ApHandle: longint): longint;stdcall;external PUBLIC_SOCKET;//register; external PUBLIC_SOCKET;
implementation
end.

