object fpedido: Tfpedido
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 513
  ClientWidth = 795
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object pnRodape: TPanel
    Left = 0
    Top = 468
    Width = 795
    Height = 45
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object btnovo: TSpeedButton
      Left = 139
      Top = 7
      Width = 108
      Height = 26
      Caption = 'Novo pedido'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000590000005900000000000000000000000000FF0000FF
        0000FF00000000000000000000000000000000000000F394242BF297208EF396
        21D3F39621F3F39621F3F39621D3F296218DF3981E2A00000000000000000000
        0000000000000000000000000000FFAA2B06F3962192F39621FCF39621FFF396
        21FFF39621FFF39621FFF39621FFF39621FFF39621FBF3972290FF9933050000
        00000000000000000000FFAA2B06F39721BCF39621FFF39621FFF39621FFF396
        21FFF39621FFF39621FFF39621FFF39621FFF39621FFF39621FFF39621BBFF99
        33050000000000000000F3952193F39621FFF39621FFF39621FFF39621FFF396
        21FFF39928FFF39928FFF39621FFF39621FFF39621FFF39621FFF39621FFF397
        229000000000F394242BF39621FCF39621FFF39621FFF39621FFF39621FFF396
        21FFF7D4A7FFF7D4A7FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FCF3981E2AF396228FF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF8D9B2FFF8D9B2FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF295218CF39622D5F39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF8D9B2FFF8D9B2FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF39621D3F39621F2F39621FFF39621FFF39A29FFF7D4A7FFF8D9B2FFF8D9
        B2FFFAEFE3FFFAEFE3FFF8D9B2FFF8D9B2FFF7D3A6FFF39928FFF39621FFF396
        21FFF39621F1F39621F3F39621FFF39621FFF39A29FFF7D4A7FFF8D9B2FFF8D9
        B2FFFAEFE3FFFAEFE3FFF8D9B2FFF8D9B2FFF7D4A7FFF39A29FFF39621FFF396
        21FFF39621F2F39622D5F39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF8D9B2FFF8D9B2FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF39621D3F3952191F39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF8D9B2FFF8D9B2FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FFF297208EF397232CF39621FCF39621FFF39621FFF39621FFF39621FFF396
        21FFF7D4A7FFF7D4A7FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21FCF394242B00000000F3972195F39621FFF39621FFF39621FFF39621FFF396
        21FFF39928FFF39928FFF39621FFF39621FFF39621FFF39621FFF39621FFF396
        21920000000000000000FFAA2B06F39620BDF39621FFF39621FFF39621FFF396
        21FFF39621FFF39621FFF39621FFF39621FFF39621FFF39621FFF39721BCFFAA
        2B06000000000000000000000000FFAA2B06F3972195F39621FDF39621FFF396
        21FFF39621FFF39621FFF39621FFF39621FFF39621FCF3952193FFAA2B060000
        00000000000000000000000000000000000000000000F397232CF3972290F396
        20D4F49621F4F49621F4F39620D4F3972290F397232C00000000000000000000
        000000000000}
      ParentFont = False
      OnClick = btnovoClick
    end
    object btgravar: TSpeedButton
      Left = 257
      Top = 7
      Width = 108
      Height = 26
      Caption = 'Gravar pedido'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCAEBDD97
        D6BDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFAEDDCA23AB7424B07881C8ACFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA0D9C224AE7625B17927
        B27A24AC76D4EEE3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFF93D4BA25B27A26B57B26B57B26B57B26B67B31AE7CFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF89D1B526B77B26B87E27B87E26B47B26
        B57C25B87E26B97E76C9A8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF95D9BD
        27BB7F27BC8027BD8026B77CC9EADD87D0B327BD8027BC8026B97DCBEDDFFFFF
        FFFFFFFFFFFFFFFFFFFFD8F1E727BC7F28C08328C18326B97ECEEEE1FFFFFFFF
        FFFF3FBC8B28C28428C1832FB880FEFFFFFFFFFFFFFFFFFFFFFF95D8BD29C787
        29C68727BC80D5F2E6FFFFFFFFFFFFFFFFFFE5F7F027BF8129C48629C68664CA
        A1FFFFFFFFFFFFFFFFFFECF9F434C58945C993E7F8F1FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF9BE0C429C8882CC88929C787B0E7D1FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF50CB9A2ACE8C2BCD
        8B29C486EFFBF6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF3FCF92AC7882BCF8D2BD18E4ACB98FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB9EDD82BD1
        8E2CD28F2BD490B7E9D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFF75DBB12CD7922CD28FD0F2E4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFA5ECD0CDF5E5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      OnClick = btgravarClick
    end
    object btExcluir: TSpeedButton
      Left = 377
      Top = 7
      Width = 108
      Height = 26
      Caption = 'Excluir pedido'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000590000005900000000000000000000000000FF0000FF
        0000FF000000000000000000000000000000546DE685546EE7F9546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7F9536EE884000000000000
        000000000000000000000000000000000000546EE7F9546EE7FF546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7F8000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF6D84
        EBFF546EE7FF546EE7FF6A81EAFF5871E8FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FFE3E7
        FBFFA2B1F2FF7F92EDFFF0F2FDFF6A81EAFF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF657D
        E9FFE8ECFCFFF6F7FEFF7F92EDFF546EE7FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF7F92
        EDFFF0F2FDFFE8ECFCFFA2B1F2FF546EE7FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FFE4E8
        FBFF7F92EDFF657DE9FFE3E7FBFF6D84EBFF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF000000000000
        000000000000000000000000000000000000546EE7FF546EE7FF546EE7FF546E
        E7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF546EE7FF000000000000
        00000000000000000000000000009E9577FF9E9577FF9E9577FF9E9577FF9E95
        77FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF0000
        00000000000000000000000000009E9577FF9E9577FF9E9577FF9E9577FF9E95
        77FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF0000
        00000000000000000000000000009E9577C59E9577FF9E9577FF9E9577FF9E95
        77FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577FF9E9577C30000
        0000000000000000000000000000000000000000000000000000000000008C80
        62FF00000000000000008C8062FF000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000008C80
        62FF8C8062FF8C8062FF8C8062FF000000000000000000000000000000000000
        000000000000}
      ParentFont = False
      OnClick = btExcluirClick
    end
    object btCancelar: TSpeedButton
      Left = 501
      Top = 7
      Width = 108
      Height = 26
      Caption = 'Cancelar'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        200003000000000400006F0000006F00000000000000000000000000FF0000FF
        0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF004365FF264466FF804367
        FFB34366FFE61C51FFFD2355FFE82756FFC02C5BFF46FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000FF014266FF704366FFF64366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF1A50FFFF2757FFAF0000FF02FFFF
        FF00FFFFFF00FFFFFF000000FF014465FFB54366FFFF4366FFFF4366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF2354FFEA0000
        FF02FFFFFF00FFFFFF004266FF704366FFFF4366FFFF4366FFFF4366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF2757
        FFAFFFFFFF004365FF264366FFF64366FFFF4366FFFF4366FFFF607DFDFF4769
        FFFF4366FFFF194FFFFF2356FEFF587DF8FF194FFFFF194FFFFF194FFFFF1A50
        FFFF2C5BFF464466FF804366FFFF4366FFFF4366FFFF607DFDFFEAEAF3FFBEC7
        F6FF4769FFFF2356FEFFD2D6E6FFE1E0E0FF587DF8FF194FFFFF194FFFFF194F
        FFFF2757FFBF4367FFB34366FFFF4366FFFF4366FFFF4769FFFFBEC7F6FFF4F2
        F2FFBEC7F6FFD2D6E6FFE1DFDFFFD2D6E6FF2356FEFF194FFFFF194FFFFF194F
        FFFF2355FFE84366FFE64366FFFF4366FFFF4366FFFF4366FFFF4769FFFFBEC7
        F6FFF4F2F2FFE1DFDFFFD2D6E6FF2356FEFF194FFFFF194FFFFF194FFFFF194F
        FFFF1C51FFFD4366FFE64366FFFF4366FFFF4366FFFF4366FFFF4769FFFFBEC7
        F6FFF4F2F2FFE1DFDFFFD2D6E6FF2356FEFF194FFFFF194FFFFF194FFFFF194F
        FFFF1C51FFFD4367FFB34366FFFF4366FFFF4366FFFF4769FFFFBEC7F6FFF4F2
        F2FFBEC7F6FFD2D6E6FFE1DFDFFFD2D6E6FF2356FEFF194FFFFF194FFFFF194F
        FFFF2355FFE84466FF804366FFFF4366FFFF4366FFFF607DFDFFEAEAF3FFBEC7
        F6FF4769FFFF2356FEFFD2D6E6FFE1E0E0FF587DF8FF194FFFFF194FFFFF194F
        FFFF2757FFBF4365FF264366FFF64366FFFF4366FFFF4366FFFF607DFDFF4769
        FFFF4366FFFF194FFFFF2356FEFF587DF8FF194FFFFF194FFFFF194FFFFF1A50
        FFFF2C5BFF46FFFFFF004266FF704366FFFF4366FFFF4366FFFF4366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF2757
        FFAFFFFFFF00FFFFFF000000FF014465FFB54366FFFF4366FFFF4366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF194FFFFF194FFFFF2354FFEA0000
        FF02FFFFFF00FFFFFF00FFFFFF000000FF014266FF704366FFF64366FFFF4366
        FFFF4366FFFF194FFFFF194FFFFF194FFFFF1A50FFFF2757FFAF0000FF02FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004365FF264466FF804367
        FFB34366FFE61C51FFFD2355FFE82756FFC02C5BFF46FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00}
      ParentFont = False
      OnClick = btCancelarClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 52
    Width = 795
    Height = 73
    Align = alTop
    Caption = 'Dados do pedido'
    Color = 16513785
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object lblNumero: TLabel
      Left = 18
      Top = 24
      Width = 53
      Height = 14
      Caption = 'N'#176' Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object btBuscaCliente: TSpeedButton
      Left = 306
      Top = 40
      Width = 29
      Height = 24
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000760000007600000000000000000000000000FF0000FF
        0000FF000000797472FF37322FFF6F6C69FFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFF554E49FF403B37FF393431FF696562FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFABA8A6FF4E4843FF433D3AFF393431FF676361FFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFABA8A6FF4E4743FF433E3AFF393431FF676360FFFEFE
        FEFFFEFEFEFFFFB673FFFFB574FFFFAD72FFFFAD72FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFABA8A5FF4E4743FF433E3AFF373230FF9F7E
        65FFFFA770FFFFA371FFFFA370FFFFA570FFFFA770FFFFA970FFFFAD71FFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFAAA7A5FF504944FF9E7C57FFFFA1
        6FFFFFA371FFFFA874FFFFD0A4FFFFD0A4FFFFA571FFFFA56FFFFFA870FFFFAF
        72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFBDB09AFFFFD17BFFFFC6
        79FFFFF7C9FFFFFDD0FFFFFFD0FFFFFFD0FFFFFFD0FFFFDBB0FFFFA26EFFFFA8
        70FFFFAE72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67CFFFFD57DFFFFF3
        C0FFFFFFDDFFFFFFD5FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFD7ACFFFFA4
        6FFFFFAA70FFFEFEFEFFFEFEFEFFFEFEFEFFFFD87DFFFFD77DFFFFDA84FFFFFF
        E7FFFFFFE3FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFA4
        70FFFFA66FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67BFFFFD77CFFFFE196FFFFFF
        E9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFA5
        73FFFFA46FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD57AFFFFD67BFFFFE295FFFFFF
        EAFFFFFFE9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFA5
        72FFFFA56FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD479FFFFD67BFFFFD982FFFFFF
        E9FFFFFFE9FFFFFFE9FFFFFFE7FFFFFFE3FFFFFFDCFFFFFFD6FFFFFED1FFFFA5
        6EFFFFA86EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD77BFFFFE9
        A7FFFFFFE9FFFFFFE9FFFFFFE8FFFFFFE6FFFFFFE1FFFFFFDAFFFFC392FFFFA6
        6DFFFFAC6CFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD579FFFFD67AFFFFD7
        7BFFFFE7A4FFFFFFE6FFFFFFE7FFFFFFE5FFFFFFDFFFFFDA85FFFFB672FFFFAC
        6BFFFFAE66FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD7
        7AFFFFD77BFFFFD77CFFFFD87EFFFFD87EFFFFD77EFFFFD67FFFFFD27EFFFFC7
        7BFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD7
        78FFFFD77AFFFFD77BFFFFD77CFFFFD77DFFFFD67DFFFFD47DFFFFCF7FFFFEFE
        FEFFFEFEFEFF}
      ParentFont = False
      OnClick = btBuscaClienteClick
    end
    object Label5: TLabel
      Left = 110
      Top = 24
      Width = 26
      Height = 14
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label7: TLabel
      Left = 259
      Top = 24
      Width = 39
      Height = 14
      Caption = 'Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label11: TLabel
      Left = 343
      Top = 24
      Width = 90
      Height = 14
      Caption = 'Nome do cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object btPesquisarPedido: TSpeedButton
      Left = 73
      Top = 40
      Width = 29
      Height = 24
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000760000007600000000000000000000000000FF0000FF
        0000FF000000797472FF37322FFF6F6C69FFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFF554E49FF403B37FF393431FF696562FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFABA8A6FF4E4843FF433D3AFF393431FF676361FFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFABA8A6FF4E4743FF433E3AFF393431FF676360FFFEFE
        FEFFFEFEFEFFFFB673FFFFB574FFFFAD72FFFFAD72FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFABA8A5FF4E4743FF433E3AFF373230FF9F7E
        65FFFFA770FFFFA371FFFFA370FFFFA570FFFFA770FFFFA970FFFFAD71FFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFAAA7A5FF504944FF9E7C57FFFFA1
        6FFFFFA371FFFFA874FFFFD0A4FFFFD0A4FFFFA571FFFFA56FFFFFA870FFFFAF
        72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFBDB09AFFFFD17BFFFFC6
        79FFFFF7C9FFFFFDD0FFFFFFD0FFFFFFD0FFFFFFD0FFFFDBB0FFFFA26EFFFFA8
        70FFFFAE72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67CFFFFD57DFFFFF3
        C0FFFFFFDDFFFFFFD5FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFD7ACFFFFA4
        6FFFFFAA70FFFEFEFEFFFEFEFEFFFEFEFEFFFFD87DFFFFD77DFFFFDA84FFFFFF
        E7FFFFFFE3FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFA4
        70FFFFA66FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67BFFFFD77CFFFFE196FFFFFF
        E9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFA5
        73FFFFA46FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD57AFFFFD67BFFFFE295FFFFFF
        EAFFFFFFE9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFA5
        72FFFFA56FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD479FFFFD67BFFFFD982FFFFFF
        E9FFFFFFE9FFFFFFE9FFFFFFE7FFFFFFE3FFFFFFDCFFFFFFD6FFFFFED1FFFFA5
        6EFFFFA86EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD77BFFFFE9
        A7FFFFFFE9FFFFFFE9FFFFFFE8FFFFFFE6FFFFFFE1FFFFFFDAFFFFC392FFFFA6
        6DFFFFAC6CFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD579FFFFD67AFFFFD7
        7BFFFFE7A4FFFFFFE6FFFFFFE7FFFFFFE5FFFFFFDFFFFFDA85FFFFB672FFFFAC
        6BFFFFAE66FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD7
        7AFFFFD77BFFFFD77CFFFFD87EFFFFD87EFFFFD77EFFFFD67FFFFFD27EFFFFC7
        7BFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD7
        78FFFFD77AFFFFD77BFFFFD77CFFFFD77DFFFFD67DFFFFD47DFFFFCF7FFFFEFE
        FEFFFEFEFEFF}
      ParentFont = False
      OnClick = btPesquisarPedidoClick
    end
    object edtNumeroPedido: TEdit
      Left = 14
      Top = 41
      Width = 57
      Height = 22
      Hint = 'Digite um codito para localizar'
      Alignment = taRightJustify
      BevelInner = bvNone
      Color = 16447992
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      NumbersOnly = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = edtNumeroPedidoExit
      OnKeyPress = edtNumeroPedidoKeyPress
    end
    object edtCliente: TEdit
      Left = 259
      Top = 41
      Width = 46
      Height = 22
      Alignment = taRightJustify
      BevelInner = bvNone
      Color = 16447992
      Ctl3D = True
      Enabled = False
      NumbersOnly = True
      ParentCtl3D = False
      TabOrder = 2
      OnChange = edtClienteChange
      OnExit = edtClienteExit
      OnKeyPress = edtClienteKeyPress
    end
    object edtdata: TDateTimePicker
      Left = 110
      Top = 40
      Width = 143
      Height = 25
      BevelInner = bvLowered
      Date = 44268.000000000000000000
      Format = 'dd/MM/yyyy HH:mm:ss'
      Time = 0.017971770830627070
      Color = 15921906
      Enabled = False
      TabOrder = 1
    end
    object edtNomeCliente: TEdit
      Left = 341
      Top = 41
      Width = 394
      Height = 22
      Color = 16447992
      Ctl3D = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object gpbItens: TGroupBox
    Left = 0
    Top = 202
    Width = 795
    Height = 202
    Align = alClient
    Caption = 'Itens (DEL - Excluir Item  ENTER - Editar item)'
    TabOrder = 2
    object gridInutilizacoes: TDBGrid
      Left = 2
      Top = 21
      Width = 791
      Height = 179
      Align = alClient
      DataSource = dtsPedido
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = 8404992
      TitleFont.Height = -11
      TitleFont.Name = 'MS Reference Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = gridInutilizacoesDrawColumnCell
      OnKeyDown = gridInutilizacoesKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'produto_codigo'
          Title.Caption = 'C'#243'd.Produto'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'descricao'
          Title.Caption = 'Produto'
          Width = 367
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Caption = 'Qt.'
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Title.Caption = 'Vlr.Unitario'
          Width = 86
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Title.Caption = 'Vlr.Total'
          Width = 85
          Visible = True
        end>
    end
    object Panel4: TPanel
      Left = 2
      Top = 16
      Width = 791
      Height = 5
      Align = alTop
      Color = 9947424
      ParentBackground = False
      TabOrder = 1
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 409
    Width = 795
    Height = 54
    Align = alBottom
    Caption = 'Totais'
    Color = clWhite
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 8404992
    Font.Height = -12
    Font.Name = 'Calibri'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    object Label1: TLabel
      Left = 18
      Top = 27
      Width = 43
      Height = 14
      Caption = 'Qt.Itens'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 215
      Top = 27
      Width = 68
      Height = 14
      Caption = 'Total Pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object edtQtItens: TEdit
      Left = 67
      Top = 24
      Width = 121
      Height = 20
      Alignment = taRightJustify
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = 16447992
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object edtVlrTotal: TEdit
      Left = 292
      Top = 23
      Width = 121
      Height = 20
      Alignment = taRightJustify
      BevelKind = bkFlat
      BorderStyle = bsNone
      Color = 16447992
      Ctl3D = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object gpbInserir: TGroupBox
    Left = 0
    Top = 130
    Width = 795
    Height = 72
    Align = alTop
    Caption = 'Inserir Itens'
    Color = 16513785
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label4: TLabel
      Left = 18
      Top = 20
      Width = 42
      Height = 14
      Caption = 'Produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object btPesquisarProduto: TSpeedButton
      Left = 73
      Top = 39
      Width = 26
      Height = 24
      Hint = 'Pesquisar produtos'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -13
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      Glyph.Data = {
        42040000424D4204000000000000420000002800000010000000100000000100
        20000300000000040000760000007600000000000000000000000000FF0000FF
        0000FF000000797472FF37322FFF6F6C69FFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFF554E49FF403B37FF393431FF696562FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFABA8A6FF4E4843FF433D3AFF393431FF676361FFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFABA8A6FF4E4743FF433E3AFF393431FF676360FFFEFE
        FEFFFEFEFEFFFFB673FFFFB574FFFFAD72FFFFAD72FFFEFEFEFFFEFEFEFFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFABA8A5FF4E4743FF433E3AFF373230FF9F7E
        65FFFFA770FFFFA371FFFFA370FFFFA570FFFFA770FFFFA970FFFFAD71FFFEFE
        FEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFAAA7A5FF504944FF9E7C57FFFFA1
        6FFFFFA371FFFFA874FFFFD0A4FFFFD0A4FFFFA571FFFFA56FFFFFA870FFFFAF
        72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFBDB09AFFFFD17BFFFFC6
        79FFFFF7C9FFFFFDD0FFFFFFD0FFFFFFD0FFFFFFD0FFFFDBB0FFFFA26EFFFFA8
        70FFFFAE72FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67CFFFFD57DFFFFF3
        C0FFFFFFDDFFFFFFD5FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFD7ACFFFFA4
        6FFFFFAA70FFFEFEFEFFFEFEFEFFFEFEFEFFFFD87DFFFFD77DFFFFDA84FFFFFF
        E7FFFFFFE3FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFFFD0FFFFA4
        70FFFFA66FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67BFFFFD77CFFFFE196FFFFFF
        E9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFFFD0FFFFA5
        73FFFFA46FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD57AFFFFD67BFFFFE295FFFFFF
        EAFFFFFFE9FFFFFFE8FFFFFFE4FFFFFFDDFFFFFFD6FFFFFFD2FFFFFFD0FFFFA5
        72FFFFA56FFFFEFEFEFFFEFEFEFFFEFEFEFFFFD479FFFFD67BFFFFD982FFFFFF
        E9FFFFFFE9FFFFFFE9FFFFFFE7FFFFFFE3FFFFFFDCFFFFFFD6FFFFFED1FFFFA5
        6EFFFFA86EFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD77BFFFFE9
        A7FFFFFFE9FFFFFFE9FFFFFFE8FFFFFFE6FFFFFFE1FFFFFFDAFFFFC392FFFFA6
        6DFFFFAC6CFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD579FFFFD67AFFFFD7
        7BFFFFE7A4FFFFFFE6FFFFFFE7FFFFFFE5FFFFFFDFFFFFDA85FFFFB672FFFFAC
        6BFFFFAE66FFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD67AFFFFD7
        7AFFFFD77BFFFFD77CFFFFD87EFFFFD87EFFFFD77EFFFFD67FFFFFD27EFFFFC7
        7BFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFEFEFEFFFFD7
        78FFFFD77AFFFFD77BFFFFD77CFFFFD77DFFFFD67DFFFFD47DFFFFCF7FFFFEFE
        FEFFFEFEFEFF}
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      OnClick = btPesquisarProdutoClick
    end
    object Label6: TLabel
      Left = 546
      Top = 20
      Width = 15
      Height = 14
      Caption = 'Qt.'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 421
      Top = 20
      Width = 65
      Height = 14
      Caption = 'Vlr. Unit'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 494
      Top = 42
      Width = 8
      Height = 14
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 567
      Top = 42
      Width = 10
      Height = 14
      Caption = '='
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 606
      Top = 20
      Width = 27
      Height = 14
      Caption = 'Total'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object edtBuscaProduto: TEdit
      Left = 14
      Top = 40
      Width = 57
      Height = 22
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16447992
      Ctl3D = True
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      NumbersOnly = True
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 0
      OnExit = edtBuscaProdutoExit
      OnKeyPress = edtBuscaProdutoKeyPress
    end
    object edtQuantidade: TEdit
      Left = 507
      Top = 40
      Width = 57
      Height = 22
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16447992
      Ctl3D = True
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      NumbersOnly = True
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 3
      OnChange = edtValorUnChange
    end
    object edtValorUn: TEdit
      Left = 433
      Top = 40
      Width = 57
      Height = 22
      Alignment = taRightJustify
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = 16447992
      Ctl3D = True
      DoubleBuffered = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      TabOrder = 2
      OnChange = edtValorUnChange
    end
    object edtTotal: TEdit
      Left = 580
      Top = 40
      Width = 57
      Height = 22
      Alignment = taRightJustify
      Color = 16447992
      Ctl3D = True
      DoubleBuffered = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      NumbersOnly = True
      ParentCtl3D = False
      ParentDoubleBuffered = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object edtDescricaoProduto: TEdit
      Left = 105
      Top = 40
      Width = 318
      Height = 22
      Color = 16447992
      Ctl3D = True
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      MaxLength = 8
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object btInserirProduto: TBitBtn
      Left = 645
      Top = 40
      Width = 94
      Height = 23
      Hint = 'Insere ou atualiza um item'
      Caption = 'Inserir F3'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFD4EDE398D0BA98D0B9D3ECE2FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6AC5A124
        B07925B07961C19AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF6FC9A525B27825B27865C39DFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF6FCAA625
        B47A25B47A65C59FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF6FCCA726B77C26B77C66C7A0FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73CCA827
        BA7E27BA7E69C8A2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD3F0E568CFA5
        6DD1A96DD0A96DD0A96FCEA83CBA8727BD8027BD8039B8856FCDA76DD0A96DD0
        A96DD1A968CEA5D4F1E59BD9C028C38528C18328C18328C18328C18328C08328
        C08328C08328C08328C18328C18328C18328C18328C3859AD9BF9BDAC129C687
        29C48529C48529C48529C48529C38529C28429C28429C38529C48529C48529C4
        8529C48529C5879BDBC1D4F2E66FD7AD73D7AE74D7AF74D7AF75D5AE40C38E2A
        C7882AC7883EC28D75D4AE74D7AF74D7AF73D7AE6FD7ADD4F2E6FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF74D6AF2ACB8A2ACB8A6BD3AAFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73DDB32B
        CE8C2BCE8C6AD8ABFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF73DEB32CD18E2CD18E6ADAADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF73E1B52C
        D4902CD4906ADDAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFF6FE2B32CD8932DD89367DDADFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD5F6E99C
        E3C79CE3C7D4F5E8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentFont = False
      TabOrder = 5
      OnClick = btInserirProdutoClick
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 404
    Width = 795
    Height = 5
    Align = alBottom
    Color = 9947424
    ParentBackground = False
    TabOrder = 5
  end
  object Panel2: TPanel
    Left = 0
    Top = 125
    Width = 795
    Height = 5
    Align = alTop
    Color = 9947424
    ParentBackground = False
    TabOrder = 6
  end
  object Panel3: TPanel
    Left = 0
    Top = 463
    Width = 795
    Height = 5
    Align = alBottom
    Color = 9947424
    ParentBackground = False
    TabOrder = 7
  end
  object Panel5: TPanel
    Left = 0
    Top = 0
    Width = 795
    Height = 52
    Align = alTop
    TabOrder = 8
    object Label13: TLabel
      Left = 88
      Top = 16
      Width = 112
      Height = 25
      Caption = 'Pedidos v1.0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clGray
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 88
      Top = 17
      Width = 112
      Height = 25
      Caption = 'Pedidos v1.0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 88
      Top = 14
      Width = 112
      Height = 25
      Caption = 'Pedidos v1.0'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object imglogo: TImage
      Left = 1
      Top = 1
      Width = 81
      Height = 50
      Align = alLeft
      Center = True
      Proportional = True
      Transparent = True
      ExplicitHeight = 46
    end
  end
  object dtsPedido: TDataSource
    Left = 272
    Top = 296
  end
  object olink: TFDPhysMySQLDriverLink
    Left = 216
    Top = 296
  end
end
