USE [DB_MUÑIZ]
GO
/****** Object:  Table [dbo].[TiposUsuarios]    Script Date: 07/23/2019 16:26:02 ******/
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
/****** Object:  Table [dbo].[COMIDAS]    Script Date: 07/23/2019 16:26:02 ******/
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
SET IDENTITY_INSERT [dbo].[COMIDAS] ON
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (1, N'Fideos con tuco', 100.0000)
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (2, N'Manaos Cola 1.5l', 60.0000)
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (3, N'Milanga con pure', 140.0000)
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (4, N'Milanga con fritas', 140.0000)
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (5, N'Coto Cola Naranja 2l', 20.0000)
INSERT [dbo].[COMIDAS] ([id], [Descripcion], [precio]) VALUES (6, N'Pecsi 1.5l', 80.0000)
SET IDENTITY_INSERT [dbo].[COMIDAS] OFF
/****** Object:  Table [dbo].[Ingredientes]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ingredientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](60) NOT NULL,
	[cantidad] [float] NOT NULL,
	[tipocantidad] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Ingredientes] ON
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (1, N'fideos', 15, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (2, N'papas', 28, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (3, N'tomate', 16, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (4, N'Manaos Cola 1.5l', 5, N'U')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (5, N'Coto Cola Naranja', 8, N'U')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (6, N'Carne Picada', 10, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (7, N'Milanesa Pollo', 25, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (8, N'Pepsi 1,5l', 8, N'U')
SET IDENTITY_INSERT [dbo].[Ingredientes] OFF
/****** Object:  Table [dbo].[auxing]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[auxing](
	[id] [int] NULL,
	[descripcion] [varchar](50) NULL,
	[cantidad] [float] NULL,
	[tipo] [varchar](10) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[auxing] ([id], [descripcion], [cantidad], [tipo]) VALUES (6, N'Carne Picada', 0.60000002384185791, N'kg')
INSERT [dbo].[auxing] ([id], [descripcion], [cantidad], [tipo]) VALUES (3, N'tomate', 0.60000002384185791, N'kg')
/****** Object:  StoredProcedure [dbo].[cargaraux]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cargaraux](
@id int,
@desc varchar(50),
@cant float,
@tipo varchar(10)
)
as
begin

insert into auxing values (@id,@desc,@cant,@tipo)

end
GO
/****** Object:  StoredProcedure [dbo].[cargar_stocks]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cargar_stocks](
@id int,
@cant float
)
as
begin

update Ingredientes set cantidad=cantidad + @cant where id = @id

select * from Ingredientes where  id = @id

end
GO
/****** Object:  StoredProcedure [dbo].[AgregarCom]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AgregarCom](
@desc varchar(50),
@precio float
)
as
begin

insert into COMIDAS(descripcion,precio) values (@desc,@precio)
select top 1 id from comidas order by id desc

end
GO
/****** Object:  StoredProcedure [dbo].[Agregaring]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Agregaring](
@desc varchar(50),
@cant float,
@tipo varchar(10)
)
as
begin

insert into Ingredientes(descripcion,cantidad,tipocantidad) values (@desc,@cant,@tipo)

end
GO
/****** Object:  StoredProcedure [dbo].[eliminaring]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminaring](
@id int
)
as
begin

delete from Ingredientes where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[listaraux]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listaraux]
as
begin

select * from auxing
truncate table auxing

end
GO
/****** Object:  StoredProcedure [dbo].[listar_Stock]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_Stock](
@param varchar (50) = ''
)
as
begin
if(@param = '')
begin

select * from Ingredientes 

end
else
	begin
	select * from Ingredientes where descripcion like '%' + @param + '%'
	end
end
GO
/****** Object:  StoredProcedure [dbo].[Mod_Ing]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Mod_Ing](
@id int,
@desc varchar (50),
@cant float,
@tipocant varchar(10)
)
as
begin

update Ingredientes set descripcion=@desc, cantidad=@cant, tipocantidad=@tipocant where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[Mod_comida]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Mod_comida](@id int,
@descripcion varchar (50),
@precio money
)
as
begin

update COMIDAS set Descripcion=@descripcion , precio=@precio where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[prepararaux]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[prepararaux]
as
begin

truncate table auxing

end
GO
/****** Object:  Table [dbo].[tableingredientes_x_comidas]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tableingredientes_x_comidas](
	[idcomida] [int] NOT NULL,
	[idingrediente] [int] NOT NULL,
	[cantnecesaria] [float] NOT NULL,
	[tipocant] [varchar](10) NOT NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tableingredientes_x_comidas] ON
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (1, 1, 0.4, N'kg', 1)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (1, 3, 0.4, N'kg', 2)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (1, 6, 0.25, N'kg', 3)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (2, 4, 1, N'U', 4)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (3, 7, 0.35, N'kg', 5)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (3, 2, 0.5, N'kg', 6)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (4, 7, 0.35, N'kg', 7)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (4, 2, 0.35, N'kg', 8)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (5, 5, 1, N'U', 9)
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (6, 8, 1, N'U', 11)
SET IDENTITY_INSERT [dbo].[tableingredientes_x_comidas] OFF
/****** Object:  Table [dbo].[Usuarios]    Script Date: 07/23/2019 16:26:02 ******/
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
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (4, N'fargue', 2, N'1234', N'Franco Arguello')
INSERT [dbo].[Usuarios] ([id], [usuario], [tipo], [contrasenia], [Nombre]) VALUES (5, N'elmacho', 1, N'1234', N'El Macho')
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  StoredProcedure [dbo].[eliminarcomida]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarcomida](
@id int
)
as
begin

delete from COMIDAS where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[Mod_user]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Mod_user](@id int,
@usuario varchar (50),
@tipo int,
@contra varchar(50),
@nombre varchar(50)
)
as
begin

update Usuarios set usuario=@usuario, tipo=@tipo, contrasenia=@contra , Nombre=@nombre where id=@id
end
GO
/****** Object:  StoredProcedure [dbo].[RestarStock]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RestarStock] (
@id int
)
as
begin

update Ingredientes set cantidad = cantidad - (select cantnecesaria from tableingredientes_x_comidas where idcomida = @id) where id=(select idingrediente from tableingredientes_x_comidas where idcomida=@id)

end
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Mesero] [int] NOT NULL,
	[sillas] [int] NOT NULL,
	[salon] [int] NULL,
	[habilitada] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mesas] ON
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (1, 2, 6, 1, 1)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (2, 2, 5, 1, 1)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (3, 3, 8, 2, 1)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (4, 3, 2, 2, 1)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (5, 4, 10, 2, 1)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (6, 4, 4, 1, 1)
SET IDENTITY_INSERT [dbo].[Mesas] OFF
/****** Object:  StoredProcedure [dbo].[listarusuarios]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listarusuarios]
as
begin

select * from Usuarios

end
GO
/****** Object:  StoredProcedure [dbo].[listarCxI]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listarCxI]  (
@id int
)
as 
begin

select i.id,i.descripcion,c.cantnecesaria,c.tipocant from tableingredientes_x_comidas as c
inner join Ingredientes as i on i.id=c.idingrediente
 where c.idcomida=@id

end
GO
/****** Object:  StoredProcedure [dbo].[listarcomidas]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listarcomidas]
as
begin
select distinct c.id,c.Descripcion,c.precio from COMIDAS as c
inner join tableingredientes_x_comidas as ci on c.id=ci.idcomida
inner join Ingredientes as i on ci.idingrediente = i.id
where ci.cantnecesaria < i.cantidad
end
GO
/****** Object:  Table [dbo].[IngresosUsuarios]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IngresosUsuarios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [int] NOT NULL,
	[fechaentrada] [datetime] NOT NULL,
	[fechasalida] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[IngresosUsuarios] ON
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (1, 4, CAST(0x0000AA7801257CAE AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (2, 4, CAST(0x0000AA780125A447 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (3, 5, CAST(0x0000AA780125E712 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (4, 4, CAST(0x0000AA7801265184 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (5, 4, CAST(0x0000AA780126A877 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (6, 4, CAST(0x0000AA780126E8E1 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (7, 3, CAST(0x0000AA7801278031 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (8, 4, CAST(0x0000AA780128BB39 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (9, 4, CAST(0x0000AA780128CAFB AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (10, 4, CAST(0x0000AA780128E5DA AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (18, 5, CAST(0x0000AA780143663D AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (19, 4, CAST(0x0000AA7A00E1B2AF AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (20, 4, CAST(0x0000AA7A00E2439C AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (21, 4, CAST(0x0000AA7A0107686E AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (22, 5, CAST(0x0000AA85012799C3 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (23, 5, CAST(0x0000AA85012E9377 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (24, 5, CAST(0x0000AA85013061A3 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (25, 5, CAST(0x0000AA8501324CD4 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (26, 4, CAST(0x0000AA860166DC96 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (27, 4, CAST(0x0000AA8601677961 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (28, 4, CAST(0x0000AA870136B102 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (29, 4, CAST(0x0000AA87013E1812 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (30, 4, CAST(0x0000AA87013E66A9 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (11, 3, CAST(0x0000AA7801291340 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (12, 4, CAST(0x0000AA780129A467 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (13, 4, CAST(0x0000AA780129F18F AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (14, 4, CAST(0x0000AA78012A015E AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (15, 4, CAST(0x0000AA78012A5291 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (16, 4, CAST(0x0000AA78012E1375 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (17, 4, CAST(0x0000AA78012F67BA AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (43, 1, CAST(0x0000AA87018953ED AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (31, 4, CAST(0x0000AA87013EDB62 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (32, 4, CAST(0x0000AA87013F68E4 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (33, 4, CAST(0x0000AA87013FA20A AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (34, 4, CAST(0x0000AA87013FFD55 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (35, 4, CAST(0x0000AA8701403268 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (36, 4, CAST(0x0000AA8701419DA9 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (37, 4, CAST(0x0000AA870142700E AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (38, 1, CAST(0x0000AA87016D101C AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (39, 1, CAST(0x0000AA87016EDA50 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (40, 1, CAST(0x0000AA87016FABBF AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (41, 1, CAST(0x0000AA8701713929 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (42, 1, CAST(0x0000AA87017182D6 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (44, 5, CAST(0x0000AA8B001E3E93 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (45, 5, CAST(0x0000AA8B001E6552 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (46, 5, CAST(0x0000AA8B001E71DF AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (47, 5, CAST(0x0000AA8B001F2008 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (48, 5, CAST(0x0000AA8B001FBDA0 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (49, 5, CAST(0x0000AA8C00FF2DEA AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (50, 5, CAST(0x0000AA8C00FF8F36 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (51, 5, CAST(0x0000AA8C00FFBC8E AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (52, 4, CAST(0x0000AA8C01045A78 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (53, 4, CAST(0x0000AA8C0104ADBC AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (54, 4, CAST(0x0000AA8C01059AB7 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (55, 4, CAST(0x0000AA8C010785D7 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (58, 4, CAST(0x0000AA900140EE87 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (59, 4, CAST(0x0000AA9001458F0F AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (60, 5, CAST(0x0000AA90014C2570 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (68, 5, CAST(0x0000AA910153D8B0 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (69, 5, CAST(0x0000AA9300EB18DA AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (56, 1, CAST(0x0000AA8C0107B1BC AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (57, 5, CAST(0x0000AA8C0108CD70 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (61, 5, CAST(0x0000AA90014E2473 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (62, 5, CAST(0x0000AA9001518404 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (63, 5, CAST(0x0000AA900151DFE4 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (64, 5, CAST(0x0000AA90015790DA AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (65, 5, CAST(0x0000AA90016058C3 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (66, 5, CAST(0x0000AA900160D00D AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (67, 5, CAST(0x0000AA900160ED71 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[IngresosUsuarios] OFF
/****** Object:  StoredProcedure [dbo].[listar_meseros]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[listar_meseros]
as
begin
select id,nombre from usuarios where tipo=2
end
GO
/****** Object:  StoredProcedure [dbo].[eliminarCxI]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[AgregarCxI]    Script Date: 07/12/2019 09:39:47 ******/
create proc [dbo].[eliminarCxI](
@iding int,
@idcom int
)
as
begin

delete from tableingredientes_x_comidas where idcomida=@idcom and @iding=idingrediente

end
GO
/****** Object:  StoredProcedure [dbo].[eliminaruser]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminaruser](
@id int
)
as
begin

delete from Usuarios where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[eliminartodosCxI]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[AgregarCxI]    Script Date: 07/12/2019 09:39:47 ******/
create proc [dbo].[eliminartodosCxI](
@idcom int
)
as
begin

delete from tableingredientes_x_comidas where idcomida=@idcom

end
GO
/****** Object:  StoredProcedure [dbo].[AgregarCxI]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AgregarCxI](
@id int,
@idcomida int,
@cant float,
@tipo varchar(10)
)
as
begin

select top 1 @idcomida = id from COMIDAS order by id desc
print @idcomida
insert into tableingredientes_x_comidas(idcomida,idingrediente,cantnecesaria,tipocant) values (@idcomida,@id,@cant,@tipo)

end
GO
/****** Object:  StoredProcedure [dbo].[AgregarUsuario]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AgregarUsuario](
@usuario varchar(50),
@tipo int,
@cont varchar(50),
@Nombre varchar(50)
)
as
begin

insert into Usuarios(usuario,tipo,contrasenia,Nombre) values (@usuario,@tipo,@cont,@Nombre)

end
GO
/****** Object:  StoredProcedure [dbo].[auth_login]    Script Date: 07/23/2019 16:26:01 ******/
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
	declare @tipo int
	declare @id int
	select @result=(select 1 from Usuarios where @usuario=usuario and contrasenia=@contrasenia)
	
	if(@result = 1)
		begin
		
		select @tipo = tipo from Usuarios where @usuario=usuario
		select @id = id from Usuarios where @usuario=usuario
		select 'OK',@tipo,@id, Nombre from Usuarios where usuario=@usuario
		
		insert into dbo.IngresosUsuarios(usuario,fechaentrada) values (@id,GETDATE())
		
		end
	
	else
		begin
		
		Select 'USUARIO O CONTRASEÑA INCORRECTAS'
			
		end
	
end
GO
/****** Object:  Table [dbo].[aperturas_mesas]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aperturas_mesas](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmesero] [int] NOT NULL,
	[idmesa] [int] NOT NULL,
	[horainicio] [datetime] NOT NULL,
	[horafin] [datetime] NULL,
	[MontoFacturado] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[aperturas_mesas] ON
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (1, 4, 5, CAST(0x0000AA860166F600 AS DateTime), CAST(0x0000AA87014154E1 AS DateTime), 300.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (2, 4, 5, CAST(0x0000AA8701415C81 AS DateTime), CAST(0x0000AA8701416077 AS DateTime), 0.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (3, 4, 5, CAST(0x0000AA870141A611 AS DateTime), CAST(0x0000AA8701421401 AS DateTime), 0.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (4, 4, 5, CAST(0x0000AA8701423782 AS DateTime), CAST(0x0000AA870142793C AS DateTime), 0.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (5, 4, 5, CAST(0x0000AA8701427E25 AS DateTime), CAST(0x0000AA8C010487B8 AS DateTime), 280.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (6, 4, 6, CAST(0x0000AA8C0104B0BC AS DateTime), CAST(0x0000AA8C0104D218 AS DateTime), 460.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (7, 4, 6, CAST(0x0000AA8C01059ED9 AS DateTime), CAST(0x0000AA8C01077699 AS DateTime), 100.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (8, 4, 5, CAST(0x0000AA900140F068 AS DateTime), CAST(0x0000AA90014453B8 AS DateTime), 0.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (9, 4, 6, CAST(0x0000AA900142150E AS DateTime), CAST(0x0000AA9001473C85 AS DateTime), 480.0000)
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin], [MontoFacturado]) VALUES (10, 4, 5, CAST(0x0000AA90014461BB AS DateTime), CAST(0x0000AA9001473807 AS DateTime), 380.0000)
SET IDENTITY_INSERT [dbo].[aperturas_mesas] OFF
/****** Object:  StoredProcedure [dbo].[Agregarmesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Agregarmesa](
@salon int,
@habilitada bit
)
as
begin

insert into Mesas(Mesero,sillas,salon,habilitada) values (1,0,@salon,@habilitada)

end
GO
/****** Object:  StoredProcedure [dbo].[eliminarmesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[eliminarmesa](
@id int
)
as
begin

delete from Mesas where id=@id

end
GO
/****** Object:  StoredProcedure [dbo].[Cerrardia]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cerrardia](
@id int
)
as
begin

declare @sesion int

select @sesion = id from ingresosusuarios where usuario = @id and fechasalida=NULL

update dbo.IngresosUsuarios set fechasalida=getdate()where id=@sesion
		

end
GO
/****** Object:  StoredProcedure [dbo].[cargar_mesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[cargar_mesa] (
@idmesero int,
@idmesa int,
@cantsillas int,
@habilitada	bit
)
as
begin

update Mesas set Mesero=@idmesero,sillas=@cantsillas,habilitada=@habilitada where id=@idmesa
select 'OK'
end
GO
/****** Object:  StoredProcedure [dbo].[listar_mesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_mesa]
as
begin
select m.id,m.Mesero,u.Nombre,m.salon,m.sillas,m.habilitada from Mesas as m
inner join Usuarios as u on m.Mesero = u.id where m.habilitada=1
end
GO
/****** Object:  Table [dbo].[pedidos]    Script Date: 07/23/2019 16:26:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pedidos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idmesero] [int] NOT NULL,
	[idmesa] [int] NOT NULL,
	[idcomida] [int] NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[hora] [datetime] NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[pedidos] ON
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (1, 4, 5, 1, N'Fideos con tuco', CAST(0x0000AA860166FED5 AS DateTime), 60.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (2, 4, 5, 4, N'Milanga con fritas', CAST(0x0000AA86016703AE AS DateTime), 20.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (3, 4, 5, 3, N'Milanga con pure', CAST(0x0000AA860167081D AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (4, 4, 5, 5, N'Coto Cola Naranja 2l', CAST(0x0000AA8601670C31 AS DateTime), 80.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (5, 4, 5, 3, N'Milanga con pure', CAST(0x0000AA8701428344 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (6, 4, 5, 4, N'Milanga con fritas', CAST(0x0000AA8C01046731 AS DateTime), 20.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (7, 4, 6, 1, N'Fideos con tuco', CAST(0x0000AA8C0104B3C2 AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (8, 4, 6, 3, N'Milanga con pure', CAST(0x0000AA8C0104BE0E AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (9, 4, 6, 4, N'Milanga con fritas', CAST(0x0000AA8C0104C0D1 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (10, 4, 6, 5, N'Coto Cola Naranja 2l', CAST(0x0000AA8C0104C584 AS DateTime), 20.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (11, 4, 6, 2, N'Manaos Cola 1.5l', CAST(0x0000AA8C0104C92B AS DateTime), 60.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (12, 4, 6, 1, N'Fideos con tuco', CAST(0x0000AA8C0105B80E AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (13, 4, 5, 1, N'Fideos con tuco', CAST(0x0000AA900140F260 AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (14, 4, 5, 3, N'Milanga con pure', CAST(0x0000AA9001411619 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (15, 4, 5, 1, N'Fideos con tuco', CAST(0x0000AA90014168BB AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (16, 4, 5, 1, N'Fideos con tuco', CAST(0x0000AA900141AA74 AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (17, 4, 6, 4, N'Milanga con fritas', CAST(0x0000AA90014218E8 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (18, 4, 6, 5, N'Coto Cola Naranja 2l', CAST(0x0000AA90014222A8 AS DateTime), 20.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (19, 4, 6, 6, N'Pecsi 1.5l', CAST(0x0000AA9001422B82 AS DateTime), 80.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (20, 4, 6, 4, N'Milanga con fritas', CAST(0x0000AA9001423296 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (21, 4, 6, 1, N'Fideos con tuco', CAST(0x0000AA90014259B7 AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (22, 4, 5, 3, N'Milanga con pure', CAST(0x0000AA9001446829 AS DateTime), 140.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (23, 4, 5, 1, N'Fideos con tuco', CAST(0x0000AA90014480C3 AS DateTime), 100.0000)
INSERT [dbo].[pedidos] ([id], [idmesero], [idmesa], [idcomida], [descripcion], [hora], [precio]) VALUES (24, 4, 5, 4, N'Milanga con fritas', CAST(0x0000AA900144CCD0 AS DateTime), 140.0000)
SET IDENTITY_INSERT [dbo].[pedidos] OFF
/****** Object:  StoredProcedure [dbo].[mesaxmesero]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[mesaxmesero](
@id int
)
as
begin

select id from Mesas where Mesero = @id

end
GO
/****** Object:  StoredProcedure [dbo].[VerificarMesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VerificarMesa]  (
@idmesa int
)
as

begin

	declare @result int
	set @result= 1
print @result
	set @result=(SELECT CASE WHEN COUNT(1) > 0 THEN 1 ELSE 0 END AS [Value]

FROM aperturas_mesas S

WHERE S.idmesa = @idmesa and S.horainicio is not NULL AND 
      S.horafin is NULL)
	
      
print @result
	if(@result <> 1)
		begin
print @result
		select 'OK'
		end

	else
		begin
print @result
		Select horainicio from aperturas_mesas where idmesa=@idmesa and horafin is null


		end



end
GO
/****** Object:  StoredProcedure [dbo].[TraerPedidos]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[TraerPedidos](
@idmesa int,
@hora datetime
)
as
begin


select idcomida,descripcion,precio from pedidos where hora > @hora and idmesa=@idmesa
end
GO
/****** Object:  StoredProcedure [dbo].[listar_pedidos]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_pedidos]  (
@datestart varchar(50) = '',
@dateend varchar(50) = '',
@mesa int = ''
)
as
begin

set @datestart = CONVERT(VARCHAR,@datestart,120)
set @dateend = CONVERT(VARCHAR,@dateend,120)

Select * from pedidos where idmesa = @mesa and hora between @datestart and @dateend  


end
GO
/****** Object:  StoredProcedure [dbo].[listar_aperturas]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_aperturas]
as
begin
select a.id,u.Nombre,a.idmesa,a.horainicio,a.horafin,a.MontoFacturado from aperturas_mesas as a
inner join Usuarios as u on a.idmesero = u.id
end
GO
/****** Object:  StoredProcedure [dbo].[Cerrarmesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cerrarmesa] (
@id int,
@monto money
)
as
begin

declare @sesion int

select @sesion = id from aperturas_mesas where idmesa = @id and horafin is NULL
print @sesion
update dbo.aperturas_mesas set horafin=getdate(), MontoFacturado=@monto where idmesa = @id and horafin is NULL
		

end
GO
/****** Object:  StoredProcedure [dbo].[Cargar_Pedido]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Cargar_Pedido](
@idmesa int,
@idmesero int,
@idcomida int,
@descripcion varchar(50),
@precio money
)
as
begin

insert into pedidos (idmesero,idmesa,idcomida,descripcion,hora,precio) values (@idmesero,@idmesa,@idcomida,@descripcion,GETDATE(),@precio)
select id from tableingredientes_x_comidas where @idcomida=idcomida

end
GO
/****** Object:  StoredProcedure [dbo].[abrir_Mesa]    Script Date: 07/23/2019 16:26:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[abrir_Mesa](
@id int,
@idmesero int
)
as
begin

insert into aperturas_mesas (idmesero,idmesa,horainicio) values (@idmesero,@id,GETDATE())

end
GO
/****** Object:  ForeignKey [FK__aperturas__idmes__4BAC3F29]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__aperturas__idmes__4CA06362]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__IngresosU__usuar__4D94879B]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[IngresosUsuarios]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__Mesas__Mesero__4E88ABD4]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[Mesas]  WITH CHECK ADD FOREIGN KEY([Mesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idcomid__4F7CD00D]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmesa__5070F446]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmeser__5165187F]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__idcom__52593CB8]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__iding__534D60F1]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idingrediente])
REFERENCES [dbo].[Ingredientes] ([id])
GO
/****** Object:  ForeignKey [FK__Usuarios__tipo__5441852A]    Script Date: 07/23/2019 16:26:02 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([tipo])
REFERENCES [dbo].[TiposUsuarios] ([id])
GO
