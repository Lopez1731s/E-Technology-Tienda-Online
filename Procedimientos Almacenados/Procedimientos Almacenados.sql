
GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarProfile]    Script Date: 26/05/2020 14:35:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ActualizarProfile]
(@nombreUsuario varchar(50), @nombres varchar(50), @apellidos varchar(50), @correo varchar(50), @contraseña varchar(50), @direccion varchar(50), @pais varchar(50), @provincia varchar(50), @zip varchar(50))
as
begin
	update ClienteUsuario set Nombres=@nombres, Apellidos=@apellidos, Correo=@correo, Contraseña=HASHBYTES('MD5',@contraseña), Direccion=@direccion, Pais=@pais, Provincia=@provincia, Zip= @zip where Usuario=@nombreUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[SP_ActualizarStock]    Script Date: 26/05/2020 14:35:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ActualizarStock]
(@cantidad int, @idProducto int)
as
begin
	update DetalleCompra set cantidadProductoComprado=@cantidad where idProducto=@idProducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_cart]    Script Date: 26/05/2020 14:35:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Buscar_cart]
(@tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);

	begin try
		SET @Sql = 'SELECT 1 as result, idProducto, nombreproducto, nombreCategoria, cantidad, precio, imagenProducto, (precio*cantidad)as total_pagar FROM ' + QUOTENAME(@tabla)
		EXEC sp_executesql @Sql
	end try

	begin catch
		select 0 as result
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Buscar_cart2]    Script Date: 26/05/2020 14:36:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Buscar_cart2]
(@tabla varchar(50), @cantidad varchar(50), @idproducto varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);


		SET @Sql = 'SELECT 1 as result, idProducto, nombreProducto, nombreCategoria, cantidad , precio, imagenProducto, (precio*cantidad) as total_pagar FROM ' + QUOTENAME(@tabla)+'where idProducto='+@idproducto
		EXEC sp_executesql @Sql

end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarComentario]    Script Date: 26/05/2020 14:36:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscarComentario]
(@idproducto int)
as
Begin
	select Tcomentario.idProducto, Tclienteuser.Usuario, Tcomentario.descripcionComentario, Tclienteuser.Profile_img from ComentarioProducto as Tcomentario
	INNER JOIN ClienteUsuario as Tclienteuser
	ON Tcomentario.idClienteUsuario= Tclienteuser.idClienteUsuario
	where Tcomentario.idProducto=@idproducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarCountComprados]    Script Date: 26/05/2020 14:36:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscarCountComprados]
(@ClienteUsuario varchar(50))
as
begin
	select COUNT(Tproducto.idProducto) from Producto as Tproducto
	INNER JOIN DetalleVentaOnline as Tdetalleventaonline
	ON Tproducto.idProducto= Tdetalleventaonline.idProducto
	INNER JOIN VentaOnline as Tventaonline
	ON Tdetalleventaonline.idVentaOnline = Tventaonline.idVentaOnline
	INNER JOIN ClienteUsuario as Tclienteusuario
	ON Tclienteusuario.idClienteUsuario= Tventaonline.idClienteUsuario
	where Tclienteusuario.Usuario=@ClienteUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarIDsVentaOnline]    Script Date: 26/05/2020 14:37:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscarIDsVentaOnline]
(@idClienteUsuario int)
as
begin
	select idVentaOnline  from VentaOnline  group by idVentaOnline,idClienteUsuario,horaVentaCliente,fechaVentaCliente  
	having horaVentaCliente= MAX(horaVentaCliente)and fechaVentaCliente= MAX(fechaVentaCliente) and idClienteUsuario=@idClienteUsuario  order by idVentaOnline desc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscaridUser]    Script Date: 26/05/2020 14:37:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscaridUser]
(@user varchar(50))
as
Begin
	select idClienteUsuario, Usuario from ClienteUsuario where Usuario=@user
end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarProductKeyWord]    Script Date: 26/05/2020 14:37:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscarProductKeyWord]
(@nombreProducto varchar(50))
as
begin
	if exists(select Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto INNER JOIN Categoria as Tcategoria ON Tproducto.idCategoria= Tcategoria.idCategoria  where Tproducto.nombreProducto like '%'+@nombreProducto+'%')
	begin
		select 1 as msg, Tproducto.idProducto, Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto INNER JOIN Categoria as Tcategoria ON Tproducto.idCategoria= Tcategoria.idCategoria  where Tproducto.nombreProducto like '%'+@nombreProducto+'%'
	end
	Else
		begin
			select 0 as msg
		end
end


GO
/****** Object:  StoredProcedure [dbo].[SP_BuscarTotalGastado]    Script Date: 26/05/2020 14:37:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_BuscarTotalGastado]
(@ClienteUsuario varchar(50))
as
begin
	select SUM(Tproducto.precio*Tdetalleventaonline.cantidadProducto) from Producto as Tproducto
	INNER JOIN DetalleVentaOnline as Tdetalleventaonline
	ON Tproducto.idProducto= Tdetalleventaonline.idProducto
	INNER JOIN VentaOnline as Tventaonline
	ON Tdetalleventaonline.idVentaOnline = Tventaonline.idVentaOnline
	INNER JOIN ClienteUsuario as Tclienteusuario
	ON Tclienteusuario.idClienteUsuario= Tventaonline.idClienteUsuario
	where Tclienteusuario.Usuario=@ClienteUsuario
end


GO
/****** Object:  StoredProcedure [dbo].[SP_CalcularCantidad_Precio]    Script Date: 26/05/2020 14:37:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CalcularCantidad_Precio]
(@tabla varchar(50), @idProducto varchar(50), @cantidad varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'update ' + QUOTENAME(@tabla)+'set cantidad='+@cantidad+'where idProducto='+@idProducto
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_CalcularCount_Productos]    Script Date: 26/05/2020 14:37:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CalcularCount_Productos]
(@tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'select COUNT(idProducto) as Total_productos from' + QUOTENAME(@tabla)
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_CalcularPrecio_Venta]    Script Date: 26/05/2020 14:37:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CalcularPrecio_Venta]
(@tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'select SUM(cantidad*precio) as Total_Venta from' + QUOTENAME(@tabla)
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Cargar_ProfielImg]    Script Date: 26/05/2020 14:38:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Cargar_ProfielImg]
(@usuario varchar(50))
as
begin
	if exists (select Profile_img from ClienteUsuario where Usuario=@usuario)
	begin
		select 1 as Result, Profile_img from ClienteUsuario where Usuario=@usuario
	end
	Else
		begin
			select 0 as result
		end
end


GO
/****** Object:  StoredProcedure [dbo].[SP_CargarUserPayment]    Script Date: 26/05/2020 14:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_CargarUserPayment]
(@user varchar(50))
as
begin
	select Nombres, Apellidos, Correo, Usuario, Direccion, Pais, Provincia, Zip  from ClienteUsuario where Usuario=@user
end


GO
/****** Object:  StoredProcedure [dbo].[SP_ComprasHistorial]    Script Date: 26/05/2020 14:38:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ComprasHistorial]
(@user varchar(50))
as
begin
	select Tproducto.nombreProducto, Tdetalleventaonline.cantidadProducto, (Tproducto.precio*Tdetalleventaonline.cantidadProducto)as Total, Tventaonline.fechaVentaCliente from Producto as Tproducto
	INNER JOIN DetalleVentaOnline as Tdetalleventaonline
	ON Tproducto.idProducto= Tdetalleventaonline.idProducto
	INNER JOIN VentaOnline as Tventaonline
	ON Tdetalleventaonline.idVentaOnline = Tventaonline.idVentaOnline
	INNER JOIN ClienteUsuario as Tclienteusuario
	ON Tclienteusuario.idClienteUsuario= Tventaonline.idClienteUsuario
	where Tclienteusuario.Usuario=@user
end


GO
/****** Object:  StoredProcedure [dbo].[SP_CrearNuevoCarrito]    Script Date: 26/05/2020 14:38:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CrearNuevoCarrito]
@nombreTabla varchar(50)
AS
BEGIN
   Execute ('Create TABLE '+@nombreTabla+'(idProducto int, nombreProducto varchar(50), nombreCategoria varchar(50), cantidad int, precio decimal(6,2), idVentaOnline int, imagenProducto varbinary(max))')
END


GO
/****** Object:  StoredProcedure [dbo].[SP_DetalleProducto]    Script Date: 26/05/2020 14:38:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_DetalleProducto]
(@idproducto int)
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	INNER JOIN DetalleCompra as TdetalleCompra
	ON TdetalleCompra.idProducto= Tproducto.idProducto
	where Tproducto.idProducto= @idproducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarCarrito]    Script Date: 26/05/2020 14:38:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_EliminarCarrito]
@nombreTabla varchar(50)
AS
BEGIN
   Execute ('DROP TABLE '+@nombreTabla)
END


GO
/****** Object:  StoredProcedure [dbo].[SP_EliminarItemCarrito]    Script Date: 26/05/2020 14:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_EliminarItemCarrito]
(@idProducto varchar(50), @tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'DELETE FROM' + QUOTENAME(@tabla)+'WHERE idProducto='+@idProducto
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarCarrito]    Script Date: 26/05/2020 14:39:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertarCarrito]
(@idProducto varchar(50), @tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'INSERT INTO' + QUOTENAME(@tabla)+'(idProducto, nombreProducto, nombreCategoria, precio, imagenProducto)
	select Tproducto.idProducto, Tproducto.nombreProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.idProducto='+@idProducto
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarUSer]    Script Date: 26/05/2020 14:39:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SP_InsertarUSer]
(@Nombres varchar(50), @Apellidos varchar(50), @Correo varchar(50), @Nombre_Usuario varchar(50), @Contraseña varchar(50),
@Direccion varchar(50), @Pais varchar(50), @Provincia varchar(50), @Zip varchar(50), @profile_img varbinary(max), @estado int)
as
Begin
	INSERT INTO ClienteUsuario(Nombres, Apellidos, Correo, Usuario, Contraseña, Direccion, Pais, Provincia, Zip, estado) 
	VALUES(@Nombres, @Apellidos, @Correo, @Nombre_Usuario, HASHBYTES('MD5',@Contraseña), @Direccion, @Pais, @Provincia, @Zip, @estado)
End


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertarVentaOnline]    Script Date: 26/05/2020 14:39:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertarVentaOnline]
(@Usuario varchar(50))
as
begin
	INSERT INTO VentaOnline(idClienteUsuario,horaVentaCliente,fechaVentaCliente)
	select idClienteUsuario, convert(char(5), GETDATE(), 108) as horaVentaCliente, CONVERT (char(10), getdate(), 103) as fechaVentaCliente from ClienteUsuario where Usuario=@Usuario
end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertComentario]    Script Date: 26/05/2020 14:39:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertComentario]
(@idClienteUsuario int, @idProducto int, @descripcion varchar(max),  @estado int)
as
begin
	insert into ComentarioProducto VALUES(@idClienteUsuario ,@idProducto, @estado, @descripcion)
end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDetalleVentaOnline]    Script Date: 26/05/2020 14:39:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertDetalleVentaOnline]
(@idVentaonline int, @idproducto int, @cantidad int)
as
begin
	insert into DetalleVentaOnline VALUES(@idventaonline, @idproducto, @cantidad, 1)
end


GO
/****** Object:  StoredProcedure [dbo].[SP_InsertDetalleVentaOnlineCarrito]    Script Date: 26/05/2020 14:39:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_InsertDetalleVentaOnlineCarrito]
(@tabla varchar(50))
as
begin
	/*insert into DetalleVentaOnline(idVentaOnline, idProducto,cantidadProducto)
	select idVentaOnline,idProducto,cantidad from @tabla*/

	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);

	SET @Sql = 'insert into DetalleVentaOnline(idVentaOnline, idProducto,cantidadProducto) select idVentaOnline,idProducto,cantidad from' + QUOTENAME(@tabla)     
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Login]    Script Date: 26/05/2020 14:39:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure  [dbo].[SP_Login]
 (@Nombre_Usuario varchar(50),@Password varchar(50))
 As
 Begin
 If exists ( select * from ClienteUsuario Where Usuario=@Nombre_Usuario and Contraseña=HASHBYTES('MD5',@Password))
	Begin
		Select 1 as Resultado, Usuario,CONCAT(Nombres, ' ', Apellidos) as Full_Name from ClienteUsuario Where Usuario=@Nombre_Usuario
	End 
	Else
	begin
		Select 0 as Resutado,'Credenciales incorrectas' as 'Mensaje'
	End
 End

 
GO
/****** Object:  StoredProcedure [dbo].[SP_NewStockCarrito]    Script Date: 26/05/2020 14:39:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_NewStockCarrito]
(@tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);

	SET @Sql = 'update DetalleCompra set detallecompra.cantidadProductoComprado = (v.cantidadProductoComprado-t.cantidad) from ' + QUOTENAME(@tabla)+ 'as t	INNER JOIN DetalleCompra as v
	on t.idProducto= v.idProducto
	where t.idProducto =  t.idProducto'
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_NuevoStockOneItem]    Script Date: 26/05/2020 14:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_NuevoStockOneItem]
(@idproducto varchar(50))
as
begin
	select cantidadProductoComprado, (cantidadProductoComprado-1) as NuevoStock from DetalleCompra where idProducto=@idproducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_Payment]    Script Date: 26/05/2020 14:40:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_Payment]
(@idproducto int)
as
begin
	select Tproducto.idProducto, Tproducto.nombreProducto, Tcategoria.nombreCategoria, Tproducto.precio from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.idProducto=@idproducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_ProfileSearch]    Script Date: 26/05/2020 14:40:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ProfileSearch]
(@usuario varchar(50))
as
begin
	select * from ClienteUsuario where Usuario=@usuario
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchAltavoces]    Script Date: 26/05/2020 14:40:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchAltavoces]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Altavoces%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchBluetooth]    Script Date: 26/05/2020 14:40:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchBluetooth]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Bluetooth%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchCase]    Script Date: 26/05/2020 14:40:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchCase]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Case%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchDisipador]    Script Date: 26/05/2020 14:40:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchDisipador]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Disipador%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchEnfriamiento]    Script Date: 26/05/2020 14:40:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchEnfriamiento]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%enfriamiento%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchExtraible]    Script Date: 26/05/2020 14:41:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchExtraible]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Extraible%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchHDD]    Script Date: 26/05/2020 14:41:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchHDD]
as
begin
	select Tproducto.idProducto, Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%hdd%'
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchM2]    Script Date: 26/05/2020 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchM2]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%M.2%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchMonitor]    Script Date: 26/05/2020 14:41:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchMonitor]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Monitor Gaming%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchMotherBoards]    Script Date: 26/05/2020 14:41:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchMotherBoards]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%MotherBoard%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchMouse]    Script Date: 26/05/2020 14:42:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchMouse]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Mouse%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchOneItemCart]    Script Date: 26/05/2020 14:42:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchOneItemCart]
(@idproducto int)
as
begin
	select Tproducto.idProducto , Tproducto.imagenProducto, Tproducto.nombreProducto, Tdetallecompra.cantidadProductoComprado, Tproducto.precio from Producto as Tproducto
	INNER JOIN DetalleCompra as Tdetallecompra
	ON Tproducto.idProducto= Tdetallecompra.idProducto
	where Tproducto.idProducto= @idproducto
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchPowerSupply]    Script Date: 26/05/2020 14:42:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchPowerSupply]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Fuente%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchProcesadores]    Script Date: 26/05/2020 14:42:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchProcesadores]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%intel%' or Tproducto.nombreProducto like'%amd%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchRAM]    Script Date: 26/05/2020 14:42:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchRAM]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%RAM%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchSDD]    Script Date: 26/05/2020 14:42:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchSDD]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%sdd%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchSoporteMonitor]    Script Date: 26/05/2020 14:43:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchSoporteMonitor]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Soporte%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchSwitch]    Script Date: 26/05/2020 14:43:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchSwitch]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Switch%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchTeclado]    Script Date: 26/05/2020 14:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchTeclado]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Teclado%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchVentilador]    Script Date: 26/05/2020 14:43:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchVentilador]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%ventilador%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_SearchVideoCards]    Script Date: 26/05/2020 14:43:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_SearchVideoCards]
as
begin
	select Tproducto.idProducto,Tproducto.nombreProducto, Tproducto.descripcionProducto, Tcategoria.nombreCategoria, Tproducto.precio, Tproducto.imagenProducto from Producto as Tproducto
	INNER JOIN Categoria as Tcategoria
	ON Tproducto.idCategoria= Tcategoria.idCategoria
	where Tproducto.nombreProducto like '%Video%'
	order by Tproducto.precio asc
end


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateIDenCarrito]    Script Date: 26/05/2020 14:43:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_UpdateIDenCarrito]
(@idventaonline varchar(50), @tabla varchar(50))
as
begin
	--update lopez1731s set idVentaOnline=11
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);

	SET @Sql = 'update' + QUOTENAME(@tabla)+'set idVentaOnline='+@idventaonline
	EXEC sp_executesql @Sql
end


GO
/****** Object:  StoredProcedure [dbo].[SP_UploadImage]    Script Date: 26/05/2020 14:43:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_UploadImage]
(@Profile_img varbinary(max), @usuario varchar(50))
as
begin
	update ClienteUsuario set Profile_img = @Profile_img where Usuario=@usuario
end



GO
/****** Object:  StoredProcedure [dbo].[SP_validar_cart]    Script Date: 26/05/2020 14:43:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_validar_cart]
(@tabla varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql NVARCHAR(MAX);

	begin try
		SET @Sql = 'SELECT ''a'' as result FROM ' + QUOTENAME(@tabla)
		EXEC sp_executesql @Sql
	end try

	begin catch
		select 0 as result
	end catch
end


GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarCantidadStock]    Script Date: 26/05/2020 14:44:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ValidarCantidadStock]
(@tabla varchar(50), @idProducto varchar(50))
as
begin
	SET NOCOUNT ON;
	DECLARE @Sql nvarchar(MAX)
	SET @Sql = 'select Tusuario.cantidad, Tdetallecompra.cantidadProductoComprado from' + QUOTENAME(@tabla)+'as Tusuario
	INNER JOIN DetalleCompra as Tdetallecompra
	ON Tusuario.idProducto = Tdetallecompra.idProducto
	where Tusuario.idProducto='+@idProducto
	EXEC sp_executesql @Sql

	/*select Tusuario.cantidad, Tdetallecompra.cantidadProductoComprado from lopez1731s as Tusuario
	INNER JOIN DetalleCompra as Tdetallecompra
	ON Tusuario.idProducto = Tdetallecompra.idProducto
	where Tusuario.idProducto=18*/
end


GO
/****** Object:  StoredProcedure [dbo].[SP_ValidarIdClienteUser]    Script Date: 26/05/2020 14:44:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SP_ValidarIdClienteUser]
(@Clienteusuario varchar(50))
as
begin
	select idClienteUsuario from ClienteUsuario where Usuario=@Clienteusuario
end


GO
/****** Object:  StoredProcedure [dbo].[sp_ValidarRegister]    Script Date: 26/05/2020 14:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_ValidarRegister]
(@user varchar(50))
as
begin
	if exists (select Usuario from ClienteUsuario where Usuario=@user)
	begin
		select 1 as Resultado
	end
	Else
		begin
			select 0 as resultado
		end
end

