object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'sChart Sample'
  ClientHeight = 668
  ClientWidth = 1134
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #47569#51008' '#44256#46357
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PaintBox1: TPaintBox
    AlignWithMargins = True
    Left = 5
    Top = 5
    Width = 877
    Height = 658
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 0
    Margins.Bottom = 5
    Align = alClient
    OnPaint = PaintBox1Paint
    ExplicitLeft = 100
    ExplicitTop = 105
    ExplicitWidth = 872
  end
  object Panel1: TPanel
    Left = 882
    Top = 0
    Width = 252
    Height = 668
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object RadioGroup1: TRadioGroup
      AlignWithMargins = True
      Left = 10
      Top = 5
      Width = 232
      Height = 160
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = ' CHART TYPES '
      Items.Strings = (
        'CANDLE'
        'CANDLE REPAINT 100/sec'
        'LINE'
        'LINES'
        'CANDLE and LINE')
      TabOrder = 0
      OnClick = RadioGroup1Click
    end
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 10
      Top = 180
      Width = 232
      Height = 278
      Margins.Left = 10
      Margins.Top = 5
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = ' CHART PROPERTIES '
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 78
        Width = 51
        Height = 15
        Caption = 'DECIMAL'
      end
      object Label2: TLabel
        Left = 8
        Top = 106
        Width = 67
        Height = 15
        Caption = 'GRADATION'
      end
      object Label3: TLabel
        Left = 8
        Top = 190
        Width = 112
        Height = 15
        Caption = 'HORIZONTAL LINE Y'
      end
      object Label4: TLabel
        Left = 8
        Top = 218
        Width = 75
        Height = 15
        Caption = 'LABEL WIDTH'
      end
      object Label5: TLabel
        Left = 8
        Top = 246
        Width = 125
        Height = 15
        Caption = 'LINE COLOR (constant)'
      end
      object CheckBox1: TCheckBox
        Left = 8
        Top = 22
        Width = 97
        Height = 17
        TabStop = False
        Caption = 'BOX'
        TabOrder = 0
        OnClick = CheckBox1Click
      end
      object CheckBox2: TCheckBox
        Left = 8
        Top = 50
        Width = 148
        Height = 17
        TabStop = False
        Caption = 'CANDLE COLOR'
        TabOrder = 1
        OnClick = CheckBox2Click
      end
      object CheckBox5: TCheckBox
        Left = 8
        Top = 134
        Width = 148
        Height = 17
        TabStop = False
        Caption = 'GRADATION EXTEND'
        TabOrder = 2
        OnClick = CheckBox5Click
      end
      object CheckBox6: TCheckBox
        Left = 8
        Top = 162
        Width = 145
        Height = 17
        TabStop = False
        Caption = 'HORIZONTAL LINE'
        TabOrder = 3
        OnClick = CheckBox6Click
      end
      object Edit1: TEdit
        Left = 174
        Top = 75
        Width = 50
        Height = 21
        TabStop = False
        AutoSize = False
        TabOrder = 4
        OnKeyDown = Edit1KeyDown
      end
      object Edit2: TEdit
        Left = 174
        Top = 103
        Width = 50
        Height = 21
        TabStop = False
        AutoSize = False
        TabOrder = 5
        OnKeyDown = Edit2KeyDown
      end
      object Edit3: TEdit
        Left = 174
        Top = 187
        Width = 50
        Height = 21
        TabStop = False
        AutoSize = False
        TabOrder = 6
        OnKeyDown = Edit3KeyDown
      end
      object Edit4: TEdit
        Left = 174
        Top = 215
        Width = 50
        Height = 21
        TabStop = False
        AutoSize = False
        TabOrder = 7
        OnKeyDown = Edit4KeyDown
      end
      object Edit5: TEdit
        Left = 174
        Top = 243
        Width = 50
        Height = 21
        TabStop = False
        AutoSize = False
        TabOrder = 8
        OnKeyDown = Edit5KeyDown
      end
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 561
    Top = 339
  end
end
