object FMovimentacao: TFMovimentacao
  Left = 0
  Top = 0
  Caption = 'Movimenta'#231#227'o'
  ClientHeight = 528
  ClientWidth = 935
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 501
    Width = 935
    Height = 27
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object cxButton1: TcxButton
      Left = 108
      Top = 1
      Width = 177
      Height = 25
      Action = AcRecibo
      TabOrder = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton2: TcxButton
      Left = 291
      Top = 1
      Width = 177
      Height = 25
      Action = AcCaixar
      TabOrder = 1
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton3: TcxButton
      Left = 474
      Top = 1
      Width = 177
      Height = 25
      Action = AcApagar
      TabOrder = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxButton4: TcxButton
      Left = 657
      Top = 1
      Width = 177
      Height = 25
      Action = AcConferencia
      TabOrder = 3
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 257
    Height = 501
    Align = alLeft
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 13
      Width = 30
      Height = 13
      Caption = 'Placa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 62
      Width = 84
      Height = 13
      Caption = 'Tipo de ve'#237'culo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 16
      Top = 165
      Width = 55
      Height = 13
      Caption = 'Descri'#231#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 16
      Top = 421
      Width = 60
      Height = 13
      Caption = 'Valor Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object JvEnterAsTab1: TJvEnterAsTab
      Left = 184
      Top = 408
      Width = 28
      Height = 28
    end
    object Label4: TLabel
      Left = 16
      Top = 116
      Width = 31
      Height = 13
      Caption = 'Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cxMaskEdit1: TcxMaskEdit
      Left = 16
      Top = 29
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Properties.EditMask = 'LLL-9999;1;_'
      Properties.MaxLength = 0
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.IsFontAssigned = True
      StyleFocused.Color = clGradientActiveCaption
      TabOrder = 0
      Text = '   -    '
      OnExit = cxMaskEdit1Exit
      Width = 121
    end
    object cxTextEdit1: TcxTextEdit
      Left = 16
      Top = 181
      ParentFont = False
      Properties.CharCase = ecUpperCase
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.Shadow = True
      Style.IsFontAssigned = True
      StyleFocused.Color = clGradientActiveCaption
      TabOrder = 4
      OnExit = cxTextEdit1Exit
      Width = 234
    end
    object cxListBox1: TcxListBox
      Left = 16
      Top = 217
      Width = 235
      Height = 200
      TabStop = False
      ItemHeight = 16
      Items.Strings = (
        'Tempo: 00:00'
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        'Total:')
      MultiSelect = True
      ParentFont = False
      ReadOnly = True
      Style.BorderStyle = cbsNone
      Style.Edges = [bLeft, bTop, bRight, bBottom]
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = []
      Style.HotTrack = True
      Style.Shadow = True
      Style.TextStyle = []
      Style.IsFontAssigned = True
      TabOrder = 5
    end
    object cxCalcEdit1: TcxCalcEdit
      Left = 16
      Top = 437
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      ParentShowHint = False
      Properties.DisplayFormat = '#,###0.00'
      Properties.ReadOnly = False
      ShowHint = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.Shadow = True
      Style.ButtonTransparency = ebtHideUnselected
      Style.IsFontAssigned = True
      TabOrder = 6
      OnExit = cxCalcEdit1Exit
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      Width = 113
    end
    object JvDBLookupCombo1: TJvDBLookupCombo
      Left = 16
      Top = 78
      Width = 230
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      LookupField = 'codigo'
      LookupDisplay = 'descricao'
      LookupSource = DTipoVeículo
      ParentFont = False
      TabOrder = 1
      OnEnter = JvDBLookupCombo1Enter
      OnExit = JvDBLookupCombo1Exit
    end
    object cxCalcEdit2: TcxCalcEdit
      Left = 16
      Top = 470
      TabStop = False
      EditValue = 0.000000000000000000
      ParentFont = False
      ParentShowHint = False
      Properties.DisplayFormat = '#,###0.00'
      Properties.ReadOnly = False
      ShowHint = False
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -13
      Style.Font.Name = 'Tahoma'
      Style.Font.Style = [fsBold]
      Style.Shadow = True
      Style.ButtonTransparency = ebtHideUnselected
      Style.IsFontAssigned = True
      TabOrder = 7
      Visible = False
      BiDiMode = bdRightToLeft
      ParentBiDiMode = False
      Width = 113
    end
    object JvDBLookupCombo2: TJvDBLookupCombo
      Left = 16
      Top = 133
      Width = 230
      Height = 23
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      LookupField = 'codigo'
      LookupDisplay = 'descricao'
      LookupSource = DPlano
      ParentFont = False
      TabOrder = 3
      OnEnter = JvDBLookupCombo1Enter
      OnExit = JvDBLookupCombo1Exit
    end
    object CheckBox1: TCheckBox
      Left = 54
      Top = 112
      Width = 97
      Height = 17
      Caption = 'Diarista?'
      TabOrder = 2
      OnClick = CheckBox1Click
    end
  end
  object Panel3: TPanel
    Left = 257
    Top = 0
    Width = 678
    Height = 501
    Align = alClient
    BevelInner = bvLowered
    BevelWidth = 2
    TabOrder = 2
    object Panel4: TPanel
      Left = 4
      Top = 4
      Width = 670
      Height = 28
      Align = alTop
      Alignment = taLeftJustify
      AutoSize = True
      BevelOuter = bvNone
      Caption = 'Perman'#234'ncia'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object JvTimeEdit1: TJvTimeEdit
        Left = 568
        Top = 0
        Width = 117
        Height = 28
        TabStop = False
        ButtonKind = bkStandard
        ShowSeconds = True
        Alignment = taCenter
        BorderStyle = bsNone
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clLime
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        ClipboardCommands = []
      end
    end
    object cxGrid1: TcxGrid
      Left = 4
      Top = 32
      Width = 670
      Height = 465
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object cxGrid1DBTableView1: TcxGridDBTableView
        PopupMenu = JvPopupMenu1
        NavigatorButtons.ConfirmDelete = False
        OnCellDblClick = cxGrid1DBTableView1CellDblClick
        DataController.DataModeController.GridMode = True
        DataController.DataSource = dsDMovimentacao
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsView.GroupByBox = False
        object cxgrdbclmnGrid1DBTableView1codigo: TcxGridDBColumn
          Caption = 'Ticket'
          DataBinding.FieldName = 'codigo'
        end
        object cxgrdbclmnGrid1DBTableView1hora_entrada: TcxGridDBColumn
          DataBinding.FieldName = 'hora_entrada'
          Width = 149
        end
        object cxgrdbclmnGrid1DBTableView1placa: TcxGridDBColumn
          DataBinding.FieldName = 'placa'
          Width = 143
        end
        object cxgrdbclmnGrid1DBTableView1descricao: TcxGridDBColumn
          DataBinding.FieldName = 'descricao'
          Width = 285
        end
        object cxgrdbclmnGrid1DBTableView1tipo_cliente: TcxGridDBColumn
          DataBinding.FieldName = 'tipo_cliente'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1situacao: TcxGridDBColumn
          DataBinding.FieldName = 'situacao'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1dt_inclucao: TcxGridDBColumn
          DataBinding.FieldName = 'dt_inclucao'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1hora_saida: TcxGridDBColumn
          DataBinding.FieldName = 'hora_saida'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1valor_cobrado: TcxGridDBColumn
          DataBinding.FieldName = 'valor_cobrado'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1valor_pago: TcxGridDBColumn
          DataBinding.FieldName = 'valor_pago'
          Visible = False
        end
        object cxgrdbclmnGrid1DBTableView1total_hora: TcxGridDBColumn
          DataBinding.FieldName = 'total_hora'
          Visible = False
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 464
    Top = 144
  end
  object DTipoVeículo: TDataSource
    DataSet = QTipoVeiculo
    Left = 528
    Top = 144
  end
  object QTipoVeiculo: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_TIPOVEICULO'
      'WHERE'
      'INATIVO = '#39'N'#39
      'ORDER BY DESCRICAO')
    Params = <>
    Left = 496
    Top = 144
  end
  object Botoes: TActionList
    Left = 432
    Top = 144
    object AcRecibo: TAction
      Category = 'Botao'
      Caption = 'F4 - Recibo'
      ShortCut = 115
      OnExecute = AcReciboExecute
    end
    object AcCaixar: TAction
      Category = 'Botao'
      Caption = 'F5 - Caixa'
      ShortCut = 116
      OnExecute = AcCaixarExecute
    end
    object AcApagar: TAction
      Category = 'Botao'
      Caption = 'Del - Apagar'
      ShortCut = 46
      OnExecute = AcApagarExecute
    end
    object AcConferencia: TAction
      Category = 'Botao'
      Caption = 'F6 - Confer'#234'ncia'
      ShortCut = 117
      OnExecute = AcConferenciaExecute
    end
    object AcFuncao: TAction
      Category = 'Botao'
      Caption = 'F7 - Fun'#231#245'es'
      ShortCut = 118
    end
  end
  object Timer2: TTimer
    Left = 464
    Top = 192
  end
  object dsDMovimentacao: TDataSource
    DataSet = QMovimentacao
    Left = 528
    Top = 192
  end
  object QMovimentacao: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_MOVIMENTACAO')
    Params = <>
    Left = 496
    Top = 192
    object intgrfldQMovimentacaocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object wdstrngfldQMovimentacaoplaca: TWideStringField
      DisplayLabel = 'Placa'
      FieldName = 'placa'
      Size = 8
    end
    object wdstrngfldQMovimentacaodescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object wdstrngfldQMovimentacaotipo_cliente: TWideStringField
      FieldName = 'tipo_cliente'
      Size = 1
    end
    object QMovimentacaohora_entrada: TDateTimeField
      DisplayLabel = 'Entrada'
      FieldName = 'hora_entrada'
    end
    object wdstrngfldQMovimentacaosituacao: TWideStringField
      FieldName = 'situacao'
      Size = 1
    end
    object QMovimentacaodt_inclucao: TDateField
      FieldName = 'dt_inclucao'
    end
    object QMovimentacaohora_saida: TDateTimeField
      FieldName = 'hora_saida'
    end
    object QMovimentacaovalor_cobrado: TFloatField
      FieldName = 'valor_cobrado'
      DisplayFormat = '#,###0.00'
      EditFormat = '#,###0.00'
    end
    object QMovimentacaovalor_pago: TFloatField
      FieldName = 'valor_pago'
      DisplayFormat = '#,###0.00'
      EditFormat = '#,###0.00'
    end
    object intgrfldQMovimentacaototal_hora: TIntegerField
      FieldName = 'total_hora'
    end
    object QMovimentacaotipoveiculo: TIntegerField
      FieldName = 'tipoveiculo'
    end
    object intgrfldQMovimentacaocodconvenio: TIntegerField
      FieldName = 'codconvenio'
    end
    object QMovimentacaovalor_desconto: TFloatField
      FieldName = 'valor_desconto'
      DisplayFormat = '#,###0.00'
      EditFormat = '#,###0.00'
    end
    object QMovimentacaoidplano: TIntegerField
      FieldName = 'idplano'
    end
  end
  object QEmpresa: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_EMPRESA')
    Params = <>
    Left = 432
    Top = 192
    object QEmpresacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QEmpresacnpj: TWideStringField
      FieldName = 'cnpj'
    end
    object QEmpresarazao_social: TWideStringField
      FieldName = 'razao_social'
      Size = 100
    end
    object QEmpresaendereco: TWideStringField
      FieldName = 'endereco'
      Size = 100
    end
    object QEmpresacidade: TWideStringField
      FieldName = 'cidade'
      Size = 50
    end
    object QEmpresabairro: TWideStringField
      FieldName = 'bairro'
      Size = 30
    end
    object QEmpresacep: TWideStringField
      FieldName = 'cep'
      Size = 9
    end
    object QEmpresauf: TWideStringField
      FieldName = 'uf'
      Size = 2
    end
    object QEmpresabloq_hora_windows: TWideStringField
      FieldName = 'bloq_hora_windows'
      Size = 1
    end
    object QEmpresatelefone: TWideStringField
      FieldName = 'telefone'
    end
    object QEmpresatelefone1: TWideStringField
      FieldName = 'telefone1'
    end
    object QEmpresafuncionamento: TWideStringField
      FieldName = 'funcionamento'
      Size = 50
    end
  end
  object JvPopupMenu1: TJvPopupMenu
    TrackButton = tbLeftButton
    Style = msOffice
    ImageMargin.Left = 0
    ImageMargin.Top = 0
    ImageMargin.Right = 0
    ImageMargin.Bottom = 0
    ImageSize.Height = 0
    ImageSize.Width = 0
    Left = 560
    Top = 192
    object Convnio1: TMenuItem
      Caption = 'Conv'#234'nio'
      ShortCut = 119
      OnClick = Convnio1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object F9Voucher1: TMenuItem
      Caption = 'Voucher'
      ShortCut = 120
      OnClick = F9Voucher1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Anotaes1: TMenuItem
      Caption = 'Anota'#231#245'es'
      ShortCut = 121
      OnClick = Anotaes1Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object PagamentodeMensalidades1: TMenuItem
      Caption = 'Pagamento de Mensalidades'
    end
  end
  object QVerificaMovimentacao: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_MOVIMENTACAO')
    Params = <>
    Left = 432
    Top = 232
    object QVerificaMovimentacaocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QVerificaMovimentacaoplaca: TWideStringField
      FieldName = 'placa'
      Size = 8
    end
    object QVerificaMovimentacaodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object QVerificaMovimentacaotipo_cliente: TWideStringField
      FieldName = 'tipo_cliente'
      Size = 1
    end
    object QVerificaMovimentacaosituacao: TWideStringField
      FieldName = 'situacao'
      Size = 1
    end
    object QVerificaMovimentacaodt_inclucao: TDateField
      FieldName = 'dt_inclucao'
    end
    object QVerificaMovimentacaohora_entrada: TDateTimeField
      FieldName = 'hora_entrada'
    end
    object QVerificaMovimentacaohora_saida: TDateTimeField
      FieldName = 'hora_saida'
    end
    object QVerificaMovimentacaovalor_cobrado: TFloatField
      FieldName = 'valor_cobrado'
    end
    object QVerificaMovimentacaovalor_pago: TFloatField
      FieldName = 'valor_pago'
    end
    object QVerificaMovimentacaototal_hora: TIntegerField
      FieldName = 'total_hora'
    end
    object QVerificaMovimentacaotipoveiculo: TIntegerField
      FieldName = 'tipoveiculo'
    end
  end
  object QVerificaMensalista: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      
        'SELECT A.*, B.DT_VALIDADE, B.IDPLANO, B.NOME, C.DESCRICAO, C.VAL' +
        'OR_PLANO'
      'FROM TB_VEICULOCLIENTE A'
      'INNER JOIN TB_CLIENTE B ON (A.CODCLIENTE = B.CODIGO)'
      'INNER JOIN TB_PLANO   C ON (B.IDPLANO    = C.CODIGO)')
    Params = <>
    Left = 464
    Top = 232
    object QVerificaMensalistacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QVerificaMensalistacodcliente: TIntegerField
      FieldName = 'codcliente'
    end
    object QVerificaMensalistaplaca: TWideStringField
      FieldName = 'placa'
      Size = 8
    end
    object QVerificaMensalistaveiculo: TWideStringField
      FieldName = 'veiculo'
      Size = 50
    end
    object QVerificaMensalistainativo: TWideStringField
      FieldName = 'inativo'
      Size = 1
    end
    object QVerificaMensalistaIDPLANO: TIntegerField
      FieldName = 'IDPLANO'
    end
    object QVerificaMensalistaDESCRICAO: TWideStringField
      FieldName = 'DESCRICAO'
      Size = 100
    end
    object QVerificaMensalistaVALOR_PLANO: TFloatField
      FieldName = 'VALOR_PLANO'
    end
    object QVerificaMensalistaDT_VALIDADE: TDateField
      FieldName = 'DT_VALIDADE'
    end
    object QVerificaMensalistaidtipoveiculo: TIntegerField
      FieldName = 'idtipoveiculo'
    end
    object QVerificaMensalistaNOME: TWideStringField
      FieldName = 'NOME'
      Size = 100
    end
  end
  object QVerificaAnotacao: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_ANOTACAO')
    Params = <>
    Left = 496
    Top = 232
    object intgrfldQVerificaAnotacaocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object intgrfldQVerificaAnotacaocod_cliente: TIntegerField
      FieldName = 'cod_cliente'
    end
    object wdstrngfldQVerificaAnotacaoplaca: TWideStringField
      FieldName = 'placa'
      Size = 8
    end
    object wdstrngfldQVerificaAnotacaomensagem: TWideStringField
      FieldName = 'mensagem'
      Size = 150
    end
    object wdstrngfldQVerificaAnotacaopermite_entrada: TWideStringField
      FieldName = 'permite_entrada'
      Size = 1
    end
    object wdstrngfldQVerificaAnotacaoimprimi_cupom: TWideStringField
      FieldName = 'imprimi_cupom'
      Size = 1
    end
    object wdstrngfldQVerificaAnotacaoinativo: TWideStringField
      FieldName = 'inativo'
      ReadOnly = True
      Size = 1
    end
  end
  object QCaixa: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_CAIXA')
    Params = <>
    Left = 528
    Top = 232
    object intgrfldQCaixacodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object wdstrngfldQCaixadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object wdstrngfldQCaixatipo: TWideStringField
      FieldName = 'tipo'
      Size = 1
    end
    object QCaixavalor_pago: TFloatField
      FieldName = 'valor_pago'
      DisplayFormat = '#,###0.00'
      EditFormat = '#,###0.00'
    end
    object wdstrngfldQCaixafechado: TWideStringField
      FieldName = 'fechado'
      Size = 1
    end
    object QCaixadt_entrada: TDateField
      FieldName = 'dt_entrada'
    end
    object QCaixavalor_saida: TFloatField
      FieldName = 'valor_saida'
      DisplayFormat = '#,###0.00'
      EditFormat = '#,###0.00'
    end
    object QCaixaidmovimentacao: TIntegerField
      FieldName = 'idmovimentacao'
    end
  end
  object dsDCaixa: TDataSource
    DataSet = QCaixa
    Left = 560
    Top = 232
  end
  object QCalculaHora: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT '
      
        'SUM(CEILING((TIMESTAMPDIFF(MINUTE,HORA_ENTRADA,HORA_SAIDA)/60)))' +
        ' AS HORACHEIA,'
      
        'FLOOR(TIMESTAMPDIFF(SECOND,HORA_ENTRADA,HORA_SAIDA) / 3600) AS H' +
        'ORAS,'
      
        'FLOOR((TIMESTAMPDIFF(SECOND,HORA_ENTRADA,HORA_SAIDA)-((FLOOR(TIM' +
        'ESTAMPDIFF(SECOND, HORA_ENTRADA, HORA_SAIDA) / 3600)) * 3600))  ' +
        '/ 60) as Minutos,'
      
        'SEC_TO_TIME( TIMESTAMPDIFF(SECOND, HORA_ENTRADA,HORA_SAIDA)) AS ' +
        'SEGUNDO'
      ' FROM TB_MOVIMENTACAO'
      'GROUP BY CODIGO')
    Params = <>
    Left = 432
    Top = 272
    object QCalculaHoraHORAS: TLargeintField
      FieldName = 'HORAS'
      ReadOnly = True
    end
    object QCalculaHoraMinutos: TLargeintField
      FieldName = 'Minutos'
      ReadOnly = True
    end
    object QCalculaHoraHORACHEIA: TLargeintField
      FieldName = 'HORACHEIA'
      ReadOnly = True
    end
    object QCalculaHoraSEGUNDO: TTimeField
      FieldName = 'SEGUNDO'
      ReadOnly = True
    end
  end
  object QLocalizatipo: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_TIPOVEICULO'
      'WHERE'
      'INATIVO = '#39'N'#39
      'ORDER BY DESCRICAO')
    Params = <>
    Left = 472
    Top = 272
    object QLocalizatipocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QLocalizatipodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object QLocalizatipolotacao: TIntegerField
      FieldName = 'lotacao'
    end
    object QLocalizatipovalor_quizeminutos: TFloatField
      FieldName = 'valor_quizeminutos'
    end
    object QLocalizatipovalor_quinzeseguintes: TFloatField
      FieldName = 'valor_quinzeseguintes'
    end
    object QLocalizatipovalor_trintaminutos: TFloatField
      FieldName = 'valor_trintaminutos'
    end
    object QLocalizatipovalor_trintaminutos_seguinte: TFloatField
      FieldName = 'valor_trintaminutos_seguinte'
    end
    object QLocalizatipoprimeiros_minutos: TIntegerField
      FieldName = 'primeiros_minutos'
    end
    object QLocalizatipovalor_primeiros_minutos: TFloatField
      FieldName = 'valor_primeiros_minutos'
    end
    object QLocalizatipovalor_hora: TFloatField
      FieldName = 'valor_hora'
    end
    object QLocalizatipovalor_hora_seguinte: TFloatField
      FieldName = 'valor_hora_seguinte'
    end
    object QLocalizatipovalor_pernoite: TFloatField
      FieldName = 'valor_pernoite'
    end
    object QLocalizatipovalor_diaria: TFloatField
      FieldName = 'valor_diaria'
    end
    object QLocalizatipoinativo: TWideStringField
      FieldName = 'inativo'
      Size = 1
    end
    object QLocalizatipocortesia: TTimeField
      FieldName = 'cortesia'
    end
  end
  object DPlano: TDataSource
    DataSet = QPlano
    Left = 536
    Top = 272
  end
  object QPlano: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_PLANO'
      'WHERE INATIVO = '#39'N'#39
      'AND COB_VALOR = '#39'S'#39
      'ORDER BY DESCRICAO')
    Params = <>
    Left = 504
    Top = 272
    object QPlanocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QPlanodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object QPlanohorario_inicial: TTimeField
      FieldName = 'horario_inicial'
    end
    object QPlanohora_final: TTimeField
      FieldName = 'hora_final'
    end
    object QPlanonum_vagas: TIntegerField
      FieldName = 'num_vagas'
    end
    object QPlanovalor_plano: TFloatField
      FieldName = 'valor_plano'
    end
    object QPlanoinativo: TWideStringField
      FieldName = 'inativo'
      Size = 1
    end
    object QPlanocob_valor: TWideStringField
      FieldName = 'cob_valor'
      Size = 1
    end
  end
  object QVerificaPlano: TZQuery
    Connection = DM.Conexao
    SQL.Strings = (
      'SELECT * FROM TB_PLANO')
    Params = <>
    Left = 432
    Top = 320
    object QVerificaPlanocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object QVerificaPlanodescricao: TWideStringField
      FieldName = 'descricao'
      Size = 100
    end
    object QVerificaPlanohorario_inicial: TTimeField
      FieldName = 'horario_inicial'
    end
    object QVerificaPlanohora_final: TTimeField
      FieldName = 'hora_final'
    end
    object QVerificaPlanonum_vagas: TIntegerField
      FieldName = 'num_vagas'
    end
    object QVerificaPlanovalor_plano: TFloatField
      FieldName = 'valor_plano'
    end
    object QVerificaPlanoinativo: TWideStringField
      FieldName = 'inativo'
      Size = 1
    end
    object QVerificaPlanocob_valor: TWideStringField
      FieldName = 'cob_valor'
      Size = 1
    end
  end
end
