USE [DB_MUÑIZ]
GO
/****** Object:  Table [dbo].[TiposUsuarios]    Script Date: 06/28/2019 13:19:46 ******/
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
/****** Object:  Table [dbo].[COMIDAS]    Script Date: 06/28/2019 13:19:46 ******/
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
/****** Object:  Table [dbo].[Ingredientes]    Script Date: 06/28/2019 13:19:46 ******/
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
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (1, N'fideos', 12, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (2, N'papas', 40, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (3, N'tomate', 25, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (4, N'Manaos Cola 1.5l', 15, N'U')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (5, N'Coto Cola Naranja', 15, N'U')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (6, N'Carne Picada', 10, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (7, N'Milanesa Pollo', 15, N'kg')
INSERT [dbo].[Ingredientes] ([id], [descripcion], [cantidad], [tipocantidad]) VALUES (8, N'Pepsi 1,5l', 10, N'U')
SET IDENTITY_INSERT [dbo].[Ingredientes] OFF
/****** Object:  StoredProcedure [dbo].[eliminaring]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarcomida]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[cargar_stocks]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[cargar_stocks](
@id int,
@cant int
)
as
begin

update Ingredientes set cantidad=cantidad + @cant where id = @id

select * from Ingredientes where  id = @id

end
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 06/28/2019 13:19:46 ******/
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
/****** Object:  Table [dbo].[tableingredientes_x_comidas]    Script Date: 06/28/2019 13:19:46 ******/
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
INSERT [dbo].[tableingredientes_x_comidas] ([idcomida], [idingrediente], [cantnecesaria], [tipocant], [id]) VALUES (6, 8, 1, N'U', 10)
SET IDENTITY_INSERT [dbo].[tableingredientes_x_comidas] OFF
/****** Object:  StoredProcedure [dbo].[Mod_Ing]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Mod_Ing](
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
/****** Object:  StoredProcedure [dbo].[listar_Stock]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[listar_meseros]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[RestarStock]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RestarStock](
@id int
)
as
begin

update Ingredientes set cantidad = cantidad - (select cantnecesaria from tableingredientes_x_comidas where id= @id)

end
GO
/****** Object:  Table [dbo].[Mesas]    Script Date: 06/28/2019 13:19:46 ******/
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
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (1, 2, 6, 1, NULL)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (2, 2, 5, 1, NULL)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (3, 3, 8, 2, NULL)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (4, 3, 2, 2, NULL)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (5, 4, 10, 2, NULL)
INSERT [dbo].[Mesas] ([id], [Mesero], [sillas], [salon], [habilitada]) VALUES (6, 4, 4, 1, NULL)
SET IDENTITY_INSERT [dbo].[Mesas] OFF
/****** Object:  StoredProcedure [dbo].[listarcomidas]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  Table [dbo].[IngresosUsuarios]    Script Date: 06/28/2019 13:19:46 ******/
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
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (11, 3, CAST(0x0000AA7801291340 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (12, 4, CAST(0x0000AA780129A467 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (13, 4, CAST(0x0000AA780129F18F AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (14, 4, CAST(0x0000AA78012A015E AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (15, 4, CAST(0x0000AA78012A5291 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (16, 4, CAST(0x0000AA78012E1375 AS DateTime), NULL)
INSERT [dbo].[IngresosUsuarios] ([id], [usuario], [fechaentrada], [fechasalida]) VALUES (17, 4, CAST(0x0000AA78012F67BA AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[IngresosUsuarios] OFF
/****** Object:  StoredProcedure [dbo].[eliminaruser]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[eliminarmesa]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[cargar_mesa]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[auth_login]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  Table [dbo].[aperturas_mesas]    Script Date: 06/28/2019 13:19:46 ******/
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
SET IDENTITY_INSERT [dbo].[aperturas_mesas] ON
INSERT [dbo].[aperturas_mesas] ([id], [idmesero], [idmesa], [horainicio], [horafin]) VALUES (1, 3, 5, CAST(0x433F0B00 AS Date), CAST(0x433F0B00 AS Date))
SET IDENTITY_INSERT [dbo].[aperturas_mesas] OFF
/****** Object:  Table [dbo].[pedidos]    Script Date: 06/28/2019 13:19:46 ******/
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
	[hora] [date] NOT NULL,
	[precio] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[listar_mesa]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_mesa]
as
begin
select * from Mesas where habilitada=1
end
GO
/****** Object:  StoredProcedure [dbo].[mesaxmesero]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Cerrardia]    Script Date: 06/28/2019 13:19:44 ******/
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

select @sesion = id from ingresousuarios where usuario = @id and fechasalida=NULL

update dbo.IngresosUsuarios set fechasalida=getdate()where id=@sesion
		

end
GO
/****** Object:  StoredProcedure [dbo].[VerificarMesa]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[VerificarMesa]   (
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
		Select 'ERROR, LA MESA YA SE ENCUENTRA ABIERTA'

		end



end
GO
/****** Object:  StoredProcedure [dbo].[listar_pedidos]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[listar_pedidos](
@datestart varchar(50) = '',
@dateend varchar(50) = '',
@mesa int = ''
)
as
begin

if(@mesa = '' or @mesa = 0)
begin
Select * from pedidos
end

else if (@datestart = '' or @dateend = '')
begin
Select * from pedidos where (hora between @datestart and @dateend)
end

else
begin
Select * from pedidos where (hora between @datestart and @dateend) and idmesa = @mesa
end

end
GO
/****** Object:  StoredProcedure [dbo].[Cargar_Pedido]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  StoredProcedure [dbo].[Cerrarmesa]    Script Date: 06/28/2019 13:19:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[Cerrarmesa](
@id int
)
as
begin

declare @sesion int

select @sesion = id from aperturas_mesas where idmesa = @id and horafin=NULL

update dbo.aperturas_mesas set horafin=getdate()where id=@sesion
		

end
GO
/****** Object:  StoredProcedure [dbo].[abrir_Mesa]    Script Date: 06/28/2019 13:19:44 ******/
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
/****** Object:  ForeignKey [FK__aperturas__idmes__59063A47]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__aperturas__idmes__59FA5E80]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[aperturas_mesas]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__IngresosU__usuar__06CD04F7]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[IngresosUsuarios]  WITH CHECK ADD FOREIGN KEY([usuario])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__Mesas__Mesero__37A5467C]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[Mesas]  WITH CHECK ADD FOREIGN KEY([Mesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idcomid__6C190EBB]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmesa__6D0D32F4]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesa])
REFERENCES [dbo].[Mesas] ([id])
GO
/****** Object:  ForeignKey [FK__pedidos__idmeser__6E01572D]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[pedidos]  WITH CHECK ADD FOREIGN KEY([idmesero])
REFERENCES [dbo].[Usuarios] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__idcom__123EB7A3]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idcomida])
REFERENCES [dbo].[COMIDAS] ([id])
GO
/****** Object:  ForeignKey [FK__tableingr__iding__1332DBDC]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[tableingredientes_x_comidas]  WITH CHECK ADD FOREIGN KEY([idingrediente])
REFERENCES [dbo].[Ingredientes] ([id])
GO
/****** Object:  ForeignKey [FK__Usuarios__tipo__32E0915F]    Script Date: 06/28/2019 13:19:46 ******/
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD FOREIGN KEY([tipo])
REFERENCES [dbo].[TiposUsuarios] ([id])
GO
