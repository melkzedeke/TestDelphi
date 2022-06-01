object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 413
  ClientWidth = 659
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 10
    Top = 64
    Width = 64
    Height = 13
    Caption = 'Cod. Produto'
  end
  object Label2: TLabel
    Left = 98
    Top = 64
    Width = 46
    Height = 13
    Caption = 'Descricao'
  end
  object Label3: TLabel
    Left = 234
    Top = 64
    Width = 80
    Height = 13
    Caption = 'Valor Unit'#225'rio R$'
  end
  object Label4: TLabel
    Left = 8
    Top = 16
    Width = 59
    Height = 13
    Caption = 'Cod. Cliente'
  end
  object Label5: TLabel
    Left = 96
    Top = 16
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label6: TLabel
    Left = 373
    Top = 64
    Width = 21
    Height = 13
    Caption = 'QTD'
  end
  object Label7: TLabel
    Left = 447
    Top = 64
    Width = 43
    Height = 13
    Caption = 'V.Total P'
  end
  object Label11: TLabel
    Left = 10
    Top = 370
    Width = 83
    Height = 13
    Caption = 'Total Geral -> R$'
  end
  object Button1: TButton
    Left = 566
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Gravar Pedido'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StringGrid1: TStringGrid
    Left = 8
    Top = 112
    Width = 638
    Height = 249
    FixedCols = 0
    RowCount = 2
    TabOrder = 8
    OnKeyDown = StringGrid1KeyDown
    OnKeyPress = StringGrid1KeyPress
    OnSelectCell = StringGrid1SelectCell
  end
  object EdtCodPro: TEdit
    Left = 8
    Top = 77
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 3
    OnKeyPress = EdtCodProKeyPress
  end
  object Button2: TButton
    Left = 535
    Top = 75
    Width = 111
    Height = 25
    Caption = 'Insert'
    TabOrder = 7
    OnClick = Button2Click
  end
  object EdtDescricao: TEdit
    Left = 98
    Top = 77
    Width = 120
    Height = 21
    TabOrder = 4
  end
  object EdtValorUnitario: TEdit
    Left = 233
    Top = 77
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object EdtCodCli: TEdit
    Left = 8
    Top = 31
    Width = 73
    Height = 21
    NumbersOnly = True
    TabOrder = 1
    OnKeyPress = EdtCodCliKeyPress
  end
  object EdtNomeCli: TEdit
    Left = 96
    Top = 32
    Width = 258
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object EdtQuantidade: TEdit
    Left = 372
    Top = 77
    Width = 53
    Height = 21
    NumbersOnly = True
    TabOrder = 6
    OnKeyPress = EdtQuantidadeKeyPress
  end
  object EdtValorTotalProduto: TEdit
    Left = 444
    Top = 77
    Width = 85
    Height = 21
    TabOrder = 9
  end
  object EdtLinha: TEdit
    Left = 416
    Top = 367
    Width = 121
    Height = 21
    TabOrder = 10
    Visible = False
  end
  object Panel1: TPanel
    Left = 169
    Top = 168
    Width = 304
    Height = 89
    TabOrder = 11
    Visible = False
    object Label8: TLabel
      Left = 16
      Top = 15
      Width = 80
      Height = 13
      Caption = 'Valor Unitario R$'
    end
    object Label9: TLabel
      Left = 129
      Top = 15
      Width = 21
      Height = 13
      Caption = 'QTD'
    end
    object Label10: TLabel
      Left = 205
      Top = 15
      Width = 43
      Height = 13
      Caption = 'V.Total P'
    end
    object EdtValorUnitarioEdit: TEdit
      Left = 16
      Top = 29
      Width = 89
      Height = 21
      TabOrder = 0
      OnKeyPress = EdtValorUnitarioEditKeyPress
    end
    object EdtQTDEdit: TEdit
      Left = 129
      Top = 29
      Width = 48
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      OnKeyPress = EdtQTDEditKeyPress
    end
    object EdtValorTotalProdutoEdit: TEdit
      Left = 204
      Top = 29
      Width = 69
      Height = 21
      TabOrder = 2
    end
    object EdtLinhaEdit: TEdit
      Left = 16
      Top = 64
      Width = 80
      Height = 21
      TabOrder = 3
      Visible = False
    end
  end
  object EdtTotaGeral: TEdit
    Left = 96
    Top = 367
    Width = 121
    Height = 21
    TabOrder = 12
    Text = '0,00'
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=teste'
      'User_Name=root'
      'Password=123456'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    Left = 416
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 496
    Top = 8
  end
end
