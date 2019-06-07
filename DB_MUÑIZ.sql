USE [DB_MUÑIZ]
GO
/****** Object:  Table [dbo].[Ingredientes]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ingredientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NOT NULL,
	[cantidad] [int] NOT NULL,
	[tipocantidad] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[COMIDAS]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[COMIDAS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposUsuarios]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposUsuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Descripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TiposUsuarios] ON
INSERT [dbo].[TiposUsuarios] ([id], [Descripcion]) VALUES (1, N'Admin')
INSERT [dbo].[TiposUsuarios] ([id], [Descripcion]) VALUES (2, N'Mesero/a')
SET IDENTITY_INSERT [dbo].[TiposUsuarios] OFF
/****** Object:  Table [dbo].[tableingredientes_x_comidas]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tableingredientes_x_comidas](
	[idcomida] [int] NOT NULL,
	[idingrediente] [int] NOT NULL,
	[cantnecesaria] [int] NOT NULL,
	[tipocant] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[tipo] [int] NOT NULL,
	[contrasenia] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[usuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Usuarios] ON
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (1, N'msar', 1, N'1234', N'Maximiliano Sar Fernandez')
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (2, N'pgonza', 2, N'1234', N'Pepe Gonzales')
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (3, N'crodri', 2, N'1234', N'Claudia Rodriguez')
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (4, N'melone', 2, N'1234', N'Franco Arguello')
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (5, N'elmacho', 1, N'1234', N'El Macho')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  Table [dbo].[Mesas]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mesas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mesero] [int] NOT NULL,
	[reservada] [bit] NOT NULL,
	[ClienteReserva] [varchar](100) NULL,
	[sillas] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Mesas] ON
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (1, 2, 0, NULL, 4)
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (2, 2, 0, NULL, 8)
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (3, 3, 0, NULL, 4)
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (4, 3, 1, N'Luis Majul', 4)
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (5, 4, 0, NULL, 6)
INSERT [dbo].[Mesas] ([id], [Mesero], [reservada], [ClienteReserva], [sillas]) VALUES (6, 4, 1, N'Silvio Soldan', 2)
SET IDENTITY_INSERT [dbo].[Mesas] OFF
/****** Object:  StoredProcedure [dbo].[auth_login]    Script Date: 06/06/2019 23:08:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[auth_login] (
@usuario varchar(50),
@contrasenia varchar (50)
)
as
begin
	
	declare @result int
	
	select @result=(select 1 from Usuarios where @usuario=usuario and contrasenia=@contrasenia)
	
	if(@result = 1)
		begin
		
		select 'OK'
		
		end
	
	else
		begin
		
		Select 'USUARIO O CONTRASEÑA INCORRECTAS'
			
		end
	
end
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmesero] [int] NOT NULL,
	[idmesa] [int] NOT NULL,
	[idcomida] [int] NOT NULL,
	[hora] [date] NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[aperturas_mesas]    Script Date: 06/06/2019 23:08:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aperturas_mesas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmesero] [int] NOT NULL,
	[idmesa] [int] NOT NULL,
	[horainicio] [date] NOT NULL,
	[horafin] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK__aperturas__idmes__59063A47]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__aperturas__idmes__59FA5E80]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__Mesas__Mesero__37A5467C]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[Mesas]  WITH CHECK ADD FOREIGN KEY([Mesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idcomid__5441852A]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmesa__534D60F1]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmeser__52593CB8]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__idcom__4CA06362]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__iding__4D94879B]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idingrediente])
REFERENCES [dbo].[Ingredientes] ([id])
GO
/****** Object:  ForeignKey [FK__Usuarios__tipo__32E0915F]    Script Date: 06/06/2019 23:08:27 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([tipo])
REFERENCES [dbo].[TiposUsuarios] ([id])
GO
