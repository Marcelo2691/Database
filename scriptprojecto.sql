USE [Daniel_Marcelo]
GO
/****** Object:  Schema [ca]    Script Date: 25/06/2019 09:10:32 ******/
CREATE SCHEMA [ca]
GO
/****** Object:  Table [ca].[Localização_Equipamento]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Localização_Equipamento](
	[Designação] [varchar](40) NOT NULL,
	[Código_Localização_Equipamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Localização_Equipamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Engenheiro]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Engenheiro](
	[Nome_Engenheiro] [varchar](40) NOT NULL,
	[Código_Engenheiro] [int] NOT NULL,
	[NIF] [char](9) NOT NULL,
	[Salário] [money] NOT NULL,
	[Contacto_Engenheiro] [char](9) NOT NULL,
	[Idade] [char](2) NOT NULL,
	[Grau_Formação] [varchar](40) NOT NULL,
	[Área_Formação] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Engenheiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Reparação_do_Equipamento]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Reparação_do_Equipamento](
	[Código_Reparação] [int] NOT NULL,
	[Código_Equipamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Reparação] ASC,
	[Código_Equipamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Engenheiros_da_Reparação]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Engenheiros_da_Reparação](
	[Código_Reparação] [int] NOT NULL,
	[Código_Engenheiro] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Reparação] ASC,
	[Código_Engenheiro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Reparação]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Reparação](
	[Designação] [varchar](40) NOT NULL,
	[Código_Reparação] [int] NOT NULL,
	[Data_Reparação] [date] NOT NULL,
	[Custo_Reparação] [money] NOT NULL,
	[Tempo_Estimado] [time](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Reparação] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Equipamento]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Equipamento](
	[Designação] [varchar](40) NOT NULL,
	[Código_Equipamento] [int] NOT NULL,
	[Peso] [float] NOT NULL,
	[Cor] [varchar](10) NOT NULL,
	[Consumo_Equipamento] [float] NULL,
	[Código_Estado_Equipamento] [int] NOT NULL,
	[Código_Localização_Equipamento] [int] NOT NULL,
	[Código_Marca] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Equipamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Engenheiro]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Engenheiro] AS
SELECT e.Nome_Engenheiro,
	eq.Designação,
	r.Data_Reparação,
	re.Código_Equipamento
From ca.Engenheiro as e
left join ca.Engenheiros_da_Reparação as er on er.Código_Engenheiro = e.Código_Engenheiro
left join ca.Reparação as r on r.Código_Reparação=er.Código_Reparação
left join ca.Reparação_do_Equipamento as re on re.Código_Reparação=er.Código_Reparação
left join ca.Equipamento as eq on eq.Código_Equipamento = re.Código_Equipamento
left join ca.Localização_Equipamento as le on le.Código_Localização_Equipamento = eq.Código_Localização_Equipamento
where eq.Código_Localização_Equipamento = 1
GO
/****** Object:  Table [ca].[Tipo_Serviço]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Tipo_Serviço](
	[Designação] [varchar](40) NOT NULL,
	[Código_Tipo_Serviço] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Tipo_Serviço] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Técnico]    Script Date: 25/06/2019 09:10:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Técnico](
	[Nome_Técnico] [varchar](40) NOT NULL,
	[Código_Técnico] [int] NOT NULL,
	[NIF] [char](9) NOT NULL,
	[Salário] [money] NOT NULL,
	[Contacto_técnico] [char](9) NOT NULL,
	[Idade] [char](2) NOT NULL,
	[Grau_Formação] [varchar](40) NOT NULL,
	[Área_Formação] [varchar](30) NOT NULL,
	[Código_Equipa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Técnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Equipa_Técnica]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Equipa_Técnica](
	[Código_Equipa] [int] NOT NULL,
	[Número_Membros] [int] NOT NULL,
	[Matricula] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Equipa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Serviço]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Serviço](
	[Custo_total] [money] NOT NULL,
	[Código_Serviço] [int] NOT NULL,
	[Código_Tipo_de_Serviço] [int] NOT NULL,
	[Código_Equipa] [int] NOT NULL,
	[Código_Cliente] [int] NOT NULL,
	[Código_Equipamento] [int] NOT NULL,
	[Data_Serivço] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Serviço] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[técnicos_serviço1]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create VIEW [dbo].[técnicos_serviço1] AS
SELECT t.Nome_Técnico as Técnico,
	s.Data_Serivço,
	s.Custo_total
FROM ca.Técnico as t
left join ca.Equipa_Técnica as et on t.Código_Técnico = et.Código_Técnico
left join ca.Serviço as s on s.Código_Equipa = et.Código_Equipa
left join ca.Tipo_Serviço as ts on ts.Código_Tipo_Serviço = s.Código_Tipo_de_Serviço
where ts.Código_Tipo_Serviço = 1
GO
/****** Object:  Table [ca].[Carrinha]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Carrinha](
	[Matrícula] [varchar](8) NOT NULL,
	[Peso_Limite] [float] NOT NULL,
	[Número_passageiros] [int] NOT NULL,
	[Marca] [varchar](15) NOT NULL,
	[Data_Compra] [date] NULL,
	[Usuário] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Matrícula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[categoria_cliente]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[categoria_cliente](
	[Designação] [varchar](40) NOT NULL,
	[Código_categoria_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_categoria_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[cliente]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[cliente](
	[Nome_Cliente] [varchar](40) NOT NULL,
	[Código_cliente] [int] NOT NULL,
	[Tamanho_do_espaço] [int] NOT NULL,
	[Distrito_cliente] [varchar](25) NULL,
	[Morada_Cliente] [varchar](50) NOT NULL,
	[Código_postal_Cliente] [char](8) NULL,
	[Contacto] [char](9) NOT NULL,
	[Código_Categoria_cliente] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Estado_Equipamento]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Estado_Equipamento](
	[Designação] [varchar](40) NOT NULL,
	[Código_Estado_Equipamento] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Estado_Equipamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Fornecedor]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Fornecedor](
	[Designação] [varchar](40) NOT NULL,
	[Código_Fornecedor] [int] NOT NULL,
	[Marca_fornecida] [varchar](40) NOT NULL,
	[Distância_à_Empresa] [real] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Fornecedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ca].[Marca_Equipamento]    Script Date: 25/06/2019 09:10:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ca].[Marca_Equipamento](
	[Designação] [varchar](40) NOT NULL,
	[Código_Marca] [int] NOT NULL,
	[Código_Fornecedor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Código_Marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [ca].[cliente]  WITH CHECK ADD  CONSTRAINT [FK_cliente_categoria_cliente] FOREIGN KEY([Código_Categoria_cliente])
REFERENCES [ca].[categoria_cliente] ([Código_categoria_cliente])
GO
ALTER TABLE [ca].[cliente] CHECK CONSTRAINT [FK_cliente_categoria_cliente]
GO
ALTER TABLE [ca].[Engenheiros_da_Reparação]  WITH CHECK ADD  CONSTRAINT [FK_Engenheiros_da_Reparação_Engenheiro] FOREIGN KEY([Código_Engenheiro])
REFERENCES [ca].[Engenheiro] ([Código_Engenheiro])
GO
ALTER TABLE [ca].[Engenheiros_da_Reparação] CHECK CONSTRAINT [FK_Engenheiros_da_Reparação_Engenheiro]
GO
ALTER TABLE [ca].[Engenheiros_da_Reparação]  WITH CHECK ADD  CONSTRAINT [FK_Engenheiros_da_Reparação_Reparação] FOREIGN KEY([Código_Reparação])
REFERENCES [ca].[Reparação] ([Código_Reparação])
GO
ALTER TABLE [ca].[Engenheiros_da_Reparação] CHECK CONSTRAINT [FK_Engenheiros_da_Reparação_Reparação]
GO
ALTER TABLE [ca].[Equipa_Técnica]  WITH CHECK ADD  CONSTRAINT [FK_Equipa_Técnica_Carrinha] FOREIGN KEY([Matricula])
REFERENCES [ca].[Carrinha] ([Matrícula])
GO
ALTER TABLE [ca].[Equipa_Técnica] CHECK CONSTRAINT [FK_Equipa_Técnica_Carrinha]
GO
ALTER TABLE [ca].[Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Equipamento_Estado_Equipamento] FOREIGN KEY([Código_Estado_Equipamento])
REFERENCES [ca].[Estado_Equipamento] ([Código_Estado_Equipamento])
GO
ALTER TABLE [ca].[Equipamento] CHECK CONSTRAINT [FK_Equipamento_Estado_Equipamento]
GO
ALTER TABLE [ca].[Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Equipamento_Localização_Equipamento] FOREIGN KEY([Código_Localização_Equipamento])
REFERENCES [ca].[Localização_Equipamento] ([Código_Localização_Equipamento])
GO
ALTER TABLE [ca].[Equipamento] CHECK CONSTRAINT [FK_Equipamento_Localização_Equipamento]
GO
ALTER TABLE [ca].[Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Equipamento_Marca_Equipamento] FOREIGN KEY([Código_Marca])
REFERENCES [ca].[Marca_Equipamento] ([Código_Marca])
GO
ALTER TABLE [ca].[Equipamento] CHECK CONSTRAINT [FK_Equipamento_Marca_Equipamento]
GO
ALTER TABLE [ca].[Marca_Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Marca_Equipamento_Fornecedor] FOREIGN KEY([Código_Fornecedor])
REFERENCES [ca].[Fornecedor] ([Código_Fornecedor])
GO
ALTER TABLE [ca].[Marca_Equipamento] CHECK CONSTRAINT [FK_Marca_Equipamento_Fornecedor]
GO
ALTER TABLE [ca].[Reparação_do_Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Reparação_do_Equipamento_Equipamento] FOREIGN KEY([Código_Reparação])
REFERENCES [ca].[Equipamento] ([Código_Equipamento])
GO
ALTER TABLE [ca].[Reparação_do_Equipamento] CHECK CONSTRAINT [FK_Reparação_do_Equipamento_Equipamento]
GO
ALTER TABLE [ca].[Reparação_do_Equipamento]  WITH CHECK ADD  CONSTRAINT [FK_Reparação_do_Equipamento_Reparação] FOREIGN KEY([Código_Reparação])
REFERENCES [ca].[Reparação] ([Código_Reparação])
GO
ALTER TABLE [ca].[Reparação_do_Equipamento] CHECK CONSTRAINT [FK_Reparação_do_Equipamento_Reparação]
GO
ALTER TABLE [ca].[Serviço]  WITH CHECK ADD  CONSTRAINT [FK_Serviço_cliente] FOREIGN KEY([Código_Cliente])
REFERENCES [ca].[cliente] ([Código_cliente])
GO
ALTER TABLE [ca].[Serviço] CHECK CONSTRAINT [FK_Serviço_cliente]
GO
ALTER TABLE [ca].[Serviço]  WITH CHECK ADD  CONSTRAINT [FK_Serviço_Equipa_Técnica] FOREIGN KEY([Código_Equipa])
REFERENCES [ca].[Equipa_Técnica] ([Código_Equipa])
GO
ALTER TABLE [ca].[Serviço] CHECK CONSTRAINT [FK_Serviço_Equipa_Técnica]
GO
ALTER TABLE [ca].[Serviço]  WITH CHECK ADD  CONSTRAINT [FK_Serviço_Equipamento] FOREIGN KEY([Código_Equipamento])
REFERENCES [ca].[Equipamento] ([Código_Equipamento])
GO
ALTER TABLE [ca].[Serviço] CHECK CONSTRAINT [FK_Serviço_Equipamento]
GO
ALTER TABLE [ca].[Serviço]  WITH CHECK ADD  CONSTRAINT [FK_Serviço_Tipo_Serviço] FOREIGN KEY([Código_Tipo_de_Serviço])
REFERENCES [ca].[Tipo_Serviço] ([Código_Tipo_Serviço])
GO
ALTER TABLE [ca].[Serviço] CHECK CONSTRAINT [FK_Serviço_Tipo_Serviço]
GO
ALTER TABLE [ca].[Técnico]  WITH CHECK ADD  CONSTRAINT [FK_Técnico_Equipa_Técnica] FOREIGN KEY([Código_Equipa])
REFERENCES [ca].[Equipa_Técnica] ([Código_Equipa])
GO
ALTER TABLE [ca].[Técnico] CHECK CONSTRAINT [FK_Técnico_Equipa_Técnica]
GO


/****** Object:  Trigger [ca].[TRG_LOGNovaCarrinha]    Script Date: 25/06/2019 09:14:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [ca].[TRG_LOGNovaCarrinha]
ON [ca].[Carrinha]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON 
		DECLARE @Matrícula varchar (8)
		SELECT "@Matrícula" = Matrícula
		FROM Carrinha

		UPDATE ca.Carrinha 
			SET Data_Compra = getdate (), Usuário = (select user)

		WHERE Matrícula = @Matrícula
		return
END
GO

ALTER TABLE [ca].[Carrinha] ENABLE TRIGGER [TRG_LOGNovaCarrinha]
GO


/****** Object:  Trigger [ca].[TRG_LOGNovoEquipamento]    Script Date: 25/06/2019 09:18:14 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [ca].[TRG_LOGNovoEquipamento]
ON [ca].[Equipamento]
FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON 
		DECLARE @Código_Estado_Equipamento int
				,@Código_Localização_Equipamento int
				
		SELECT @Código_Estado_Equipamento = Código_Estado_Equipamento,
				@Código_Localização_Equipamento = Código_Localização_Equipamento
		FROM deleted
		IF @Código_Estado_Equipamento = 1 
			UPDATE ca.Localização_Equipamento
				Set Código_Localização_Equipamento = 1
		Where  Código_Localização_Equipamento = @Código_Localização_Equipamento
		return
END
GO

ALTER TABLE [ca].[Equipamento] ENABLE TRIGGER [TRG_LOGNovoEquipamento]
GO

/****** Object:  Trigger [ca].[TRG_LOGNovoEquipamento2]    Script Date: 25/06/2019 09:15:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [ca].[TRG_LOGNovoEquipamento2] 
ON [ca].[Equipamento]
FOR UPDATE
AS
BEGIN
	SET NOCOUNT ON 
		DECLARE @Código_Estado_Equipamento int
				,@Código_Localização_Equipamento int
				
		SELECT @Código_Estado_Equipamento = Código_Estado_Equipamento,
				@Código_Localização_Equipamento = Código_Localização_Equipamento
		FROM deleted
		IF @Código_Estado_Equipamento = 2 
			UPDATE ca.Localização_Equipamento
				Set Código_Localização_Equipamento = 2
		Where  Código_Localização_Equipamento = @Código_Localização_Equipamento
		return
END
GO

ALTER TABLE [ca].[Equipamento] ENABLE TRIGGER [TRG_LOGNovoEquipamento2]
GO


