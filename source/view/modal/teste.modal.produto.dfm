object FmodalProdutos: TFmodalProdutos
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Produtos'
  ClientHeight = 309
  ClientWidth = 604
  Color = 16250356
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Calibri'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 604
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 10
      Width = 37
      Height = 14
      Caption = 'Campo'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 222
      Top = 9
      Width = 50
      Height = 14
      Caption = 'Pesquisa'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8404992
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object btPesquisar: TSpeedButton
      Left = 477
      Top = 5
      Width = 108
      Height = 26
      Caption = 'Pesquisar'
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
      OnClick = btPesquisarClick
    end
    object cbCampos: TComboBox
      Left = 69
      Top = 6
      Width = 139
      Height = 22
      Style = csOwnerDrawVariable
      ItemIndex = 0
      TabOrder = 0
      Text = 'Descri'#231#227'o'
      OnChange = cbCamposChange
      Items.Strings = (
        'Descri'#231#227'o'
        'Valor')
    end
    object edtPesquisa: TEdit
      Left = 297
      Top = 6
      Width = 174
      Height = 22
      TabOrder = 1
      OnKeyPress = edtPesquisaKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 268
    Width = 604
    Height = 41
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btCancelar: TSpeedButton
      Left = 289
      Top = 6
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
        0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF003939FF243737FF7E3636
        FFB23636FFE60505F5FD0C0CF6E81313F7BE1B1BF743FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF000000FF013535FF6E3636FFF53636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0202F4FF1313F8AD0000FF02FFFF
        FF00FFFFFF00FFFFFF000000FF013636FFB43636FFFF3636FFFF3636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF0C0CF6E90000
        FF02FFFFFF00FFFFFF003535FF6E3636FFFF3636FFFF3636FFFF3636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF1313
        F8ADFFFFFF003939FF243636FFF53636FFFF3636FFFF5959FAFFB1B1EEFF3E3E
        FEFF3636FFFF0000F4FF1514F1FFC7C3DAFF4F4EEBFF0000F4FF0000F4FF0202
        F4FF1B1BF7433737FF7E3636FFFF3636FFFF3636FFFFB1B1EEFFE7E7E7FFBDBD
        EDFF3E3EFEFF1514F1FFCFCBD8FFD8D3D3FFC7C3DAFF0000F4FF0000F4FF0000
        F4FF1313F7BE3636FFB23636FFFF3636FFFF3636FFFF3E3EFEFFBDBDEDFFE7E7
        E7FFBDBDEDFFCFCBD8FFD8D3D3FFCFCBD8FF1514F1FF0000F4FF0000F4FF0000
        F4FF0C0CF6E83636FFE63636FFFF3636FFFF3636FFFF3636FFFF3E3EFEFFBDBD
        EDFFE7E7E7FFD8D3D3FFCFCBD8FF1514F1FF0000F4FF0000F4FF0000F4FF0000
        F4FF0505F5FD3636FFE63636FFFF3636FFFF3636FFFF3636FFFF3E3EFEFFBDBD
        EDFFE7E7E7FFD8D3D3FFCFCBD8FF1514F1FF0000F4FF0000F4FF0000F4FF0000
        F4FF0505F5FD3636FFB23636FFFF3636FFFF3636FFFF3E3EFEFFBDBDEDFFE7E7
        E7FFBDBDEDFFCFCBD8FFD8D3D3FFCFCBD8FF1514F1FF0000F4FF0000F4FF0000
        F4FF0C0CF6E83737FF7E3636FFFF3636FFFF3636FFFFB1B1EEFFE7E7E7FFBDBD
        EDFF3E3EFEFF1514F1FFCFCBD8FFD8D3D3FFC7C3DAFF0000F4FF0000F4FF0000
        F4FF1313F7BE3939FF243636FFF53636FFFF3636FFFF5959FAFFB1B1EEFF3E3E
        FEFF3636FFFF0000F4FF1514F1FFC7C3DAFF4F4EEBFF0000F4FF0000F4FF0202
        F4FF1B1BF743FFFFFF003535FF6E3636FFFF3636FFFF3636FFFF3636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF1313
        F8ADFFFFFF00FFFFFF000000FF013636FFB43636FFFF3636FFFF3636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0000F4FF0000F4FF0C0CF6E90000
        FF02FFFFFF00FFFFFF00FFFFFF000000FF013535FF6E3636FFF53636FFFF3636
        FFFF3636FFFF0000F4FF0000F4FF0000F4FF0202F4FF1313F8AD0000FF02FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003939FF243737FF7E3636
        FFB23636FFE60505F5FD0C0CF6E81313F7BE1B1BF743FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00}
      ParentFont = False
      OnClick = btCancelarClick
    end
    object btconfirmar: TSpeedButton
      Left = 173
      Top = 6
      Width = 108
      Height = 26
      Caption = 'Confirmar'
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
      OnClick = btconfirmarClick
    end
  end
  object gridBuscas: TDBGrid
    Left = 0
    Top = 41
    Width = 604
    Height = 227
    Align = alClient
    DataSource = dtsProdutos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = 8404992
    TitleFont.Height = -11
    TitleFont.Name = 'MS Reference Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = gridBuscasDrawColumnCell
    OnDblClick = gridBuscasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigo'
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
        FieldName = 'preco'
        Title.Caption = 'Vlr.Unitario'
        Width = 86
        Visible = True
      end>
  end
  object dtsProdutos: TDataSource
    DataSet = cdsProdutos
    Left = 288
    Top = 152
  end
  object cdsProdutos: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 368
    Top = 152
  end
end
